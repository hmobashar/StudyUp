#!/usr/bin/env bash
set -e

if grep -q "$1:6379" "/etc/nginx/nginx.conf"; then
  echo IP already in use
else
  sed -i'' "s/server .*:6379/server $1:6379/" /etc/nginx/nginx.conf
fi

exec /usr/sbin/nginx -s reload

exec "$@"
