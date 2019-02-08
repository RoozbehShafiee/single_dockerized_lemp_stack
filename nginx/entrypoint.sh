#!/bin/bash

set -m
set -e

FQDN=${FQDN:-}

support_ssl() {
      sed -i "s|FQDN|${FQDN}|g" /etc/nginx/conf.d/default
      chmod 600 /etc/nginx/ssl/*
}

run_nginx() {
      nginx -g 'daemon off;'
}

support_ssl
run_nginx
