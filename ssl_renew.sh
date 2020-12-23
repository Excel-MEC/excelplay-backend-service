#!/bin/bash

DC="/usr/bin/docker-compose --no-ansi"
DKR="/usr/bin/docker"

cd /home/agz/excelplay-backend-service/
$DC -f prod.docker-compose.yml run certbot renew && $DC kill -s SIGHUP excelplay-backend-nginx
$DKR system prune -af    