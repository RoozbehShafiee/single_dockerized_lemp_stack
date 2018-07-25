#!/bin/bash

set -m
set -e

FQDN=${FQDN:-}
SUPPORT_SSL=${SUPPORT_SSL:-}

initialize() {
      rm /etc/nginx/sites-available/default
      rm /etc/nginx/sites-enabled/default
      echo "<?php phpinfo(); ?>" > /data/index.php
}

support_ssl() {
  if [ $SUPPORT_SSL = "yes" ]; then
      sed -i "s|FQDN|${FQDN}|g" /etc/nginx/sites-available/443-default
      ln -s /etc/nginx/sites-available/443-default /etc/nginx/sites-enabled/443-default
  else
      sed -i "s|FQDN|${FQDN}|g" /etc/nginx/sites-available/80-default
      ln -s /etc/nginx/sites-available/80-default /etc/nginx/sites-enabled/80-default
  fi
}

run_nginx() {
      nginx -g 'daemon off;'
}

initialize
support_ssl
run_nginx
