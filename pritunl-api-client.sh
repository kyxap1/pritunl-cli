#!/usr/bin/env bash
set -eu

# manage printul via cli without enterprise license
# API documentation: https://pritunl.com/api
#
# prereq:
#   httpie jq
#
# usage:
#   export PRITUNL_ADMIN_USER=admin
#   export PRITUNL_ADMIN_PASSWORD=Theu3uereixei4
#   export PRITUNL_WEB_URL=https://vpn.pro-manage.net:9700
#  ./pritunl-api-client.sh 172.16.25.0/24

PRITUNL_ADMIN_USER=${PRITUNL_ADMIN_USER}
PRITUNL_ADMIN_PASSWORD=${PRITUNL_ADMIN_PASSWORD}
PRITUNL_WEB_URL=${PRITUNL_WEB_URL}

# select correct server id from web interface
SERVER_ID=59b5a96cb7ed5b05340e64c9

# httpie default args
ARGS=(--follow --session=pritunl-auth)

NET=${@:?}

auth() {
  # get auth
  http ${ARGS[@]} POST ${PRITUNL_WEB_URL}/auth/session \
    username=${PRITUNL_ADMIN_USER} password=${PRITUNL_ADMIN_PASSWORD}

  # get token
  if ! TOKEN=$(http ${ARGS[@]} GET ${PRITUNL_WEB_URL}/state | jq .csrf_token -r); then exit 1; fi
}

add_route() {
  local net=$1

  http ${ARGS[@]} POST ${PRITUNL_WEB_URL}/server/${SERVER_ID}/route \
    Csrf-Token:${TOKEN} \
    network=${net:?}
}

auth
add_route ${NET}
