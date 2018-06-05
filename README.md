## Usage

```bash
kyxap@srv190515:/opt/src/pritunl-cli$ export PRITUNL_ADMIN_USER=admin
kyxap@srv190515:/opt/src/pritunl-cli$ export PRITUNL_ADMIN_PASSWORD=Theu3uereixei4
kyxap@srv190515:/opt/src/pritunl-cli$ export PRITUNL_WEB_URL=https://vpn.pro-manage.net:9700
kyxap@srv190515:/opt/src/pritunl-cli$ wget -q https://ip-ranges.amazonaws.com/ip-ranges.json -O - \
  | jq '.prefixes[] | select(.region == "us-east-1") | select(.service == "EC2") | .ip_prefix' -r > aws-networks.txt
kyxap@srv190515:/opt/src/pritunl-cli$ xargs -n1 ./pritunl-api-client.sh < aws-networks.txt
```

## Sample output

```bash
kyxap@srv190515:/opt/src/pritunl-cli$ ./pritunl-api-client.sh 172.16.26.0/24
HTTP/1.1 200 OK
Cache-Control: no-cache, no-store, must-revalidate
Content-Length: 41
Content-Type: application/json
Date: Tue, 05 Jun 2018 21:11:30 GMT
Expires: 0
Pragma: no-cache
Set-Cookie: session=.eJxVzt1OgzAYgOFbMT32AIoYWbKThY4_QSmswHdigJJRWgYB1I1l975kByZewPvkvaKS9-L0JTjaXNFThTYoSts-Wo9maFMRYSajzPsFG1SBYwzZQUO3ZzQ38yyGf1lC1BLZaoxX5VQZNeoDfamJtYOcqkjnIuvATNxxLdmwfRDieCqX76n5EyoHlkbtXtmezqHB3SSH5B2rIE05CQwy1dIXieOH8Qoe5G1R9NZApbZWl0Uv02JqXNqBBAgM5oEmLx-ZkpXNcWNzv2aMhPvwJ3Rbv-rkWmjnM5PE-oy3j5tF9M28lP2INrqJ37BhaJZ2uwNJu11b.DfiOAg.a18Tm-LkxRxvrGieyqW_i6gHdRg; Secure; HttpOnly; Path=/
Strict-Transport-Security: max-age=31536000
X-Frame-Options: DENY
```
```json
{
    "authenticated": true,
    "default": false
}
```
```
HTTP/1.1 200 OK
Cache-Control: no-cache, no-store, must-revalidate
Content-Length: 233
Content-Type: application/json
Date: Tue, 05 Jun 2018 21:11:31 GMT
Expires: 0
Pragma: no-cache
Set-Cookie: session=.eJxVzs9ugyAAgPFXWTjvADiTadLDjP96kFUUnFwWqEaZYJ26rLXpuy_ppdkDfL98VyAbq8dP3QD_Cp4U8AEpe0u2zs1CqgnmA6n2vyIUpsY5FhWD4PYMlnZZ9OlfVkRmJaGZ8s0kqqLOkdGXY-QF4oMaghpdfQm3SKdN8tPuTuhulOvP3D6E7e1SsikhjG-KeYTGXCrYXdQWwdpksxz6gI9cqKiGCp5TFgZpcVnO5RhgmqBFWL4qa9IsGvB73KQ5jOcqJiwfOlSm_Z6MtZOX_Ltk3oEjg6iJvEO-u9-s2rbLKu0EfOTiV-w40EO3P0yxXIg.DfiOAw.rcShYPt2sWsXNfAmBM9W4yrrg10; Secure; HttpOnly; Path=/
Strict-Transport-Security: max-age=31536000
X-Frame-Options: DENY
```
```json
{
    "comment": null,
    "id": "3137322e31362e32362e302f3234",
    "metric": null,
    "nat": false,
    "nat_interface": null,
    "net_gateway": false,
    "network": "172.16.26.0/24",
    "server": "59b5a96cb7ed5b05340e64c9",
    "vpc_id": null,
    "vpc_region": null
}
```
