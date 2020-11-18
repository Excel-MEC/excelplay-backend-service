#!/bin/bash

DC="/usr/bin/docker-compose --no-ansi"
DKR="/usr/bin/docker"

cd /home/excel/excelplay-backend-kryptos/
$DC run certbot renew && $DC kill -s SIGHUP excelplay-backend-nginx
$DKR system prune -af    