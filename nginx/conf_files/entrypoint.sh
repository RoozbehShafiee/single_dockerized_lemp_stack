#!/bin/bash

set -m
set -e

FQDN=${FQDN:-}
SUPPORT_SSL=${SUPPORT_SSL:-}

support_ssl() {
  if [ $SUPPORT_SSL = "yes" ]; then
      sed -i "s|FQDN|${FQDN}|g" /etc/nginx/sites-available/443-default
      ln -sf /etc/nginx/sites-available/443-default /etc/nginx/sites-enabled/443-default
      chmod 600 /etc/nginx/ssl/*
      echo "<?php phpinfo(); ?>" > /data/index.php
  else
      sed -i "s|FQDN|${FQDN}|g" /etc/nginx/sites-available/80-default
      ln -sf /etc/nginx/sites-available/80-default /etc/nginx/sites-enabled/80-default
      echo "<?php phpinfo(); ?>" > /data/index.php
  fi
}

run_nginx() {
      nginx -g 'daemon off;'
}

support_ssl
run_nginx
