FROM alpine:3.8

## label and credits
LABEL image="Single Dockerized LEMP Stack - MariaDB 10.2 Docker Image" \
      maintainer="Roozbeh Shafiee, me@roozbeh.cloud" \
      version="1.0.0-production" \
      released="February 8th, 2019" \
      reference="https://roozbeh.cloud, https://github.com/RoozbehShafiee"

## install MariaDB and necessary packages
RUN apk add --update --no-cache \
        mariadb \
        mariadb-client \
        pwgen \
    && rm -f /var/cache/apk/*

## manage entrypoint file and directories
ADD entrypoint.sh /scripts/entrypoint.sh
RUN mkdir /docker-entrypoint-initdb.d \
    && mkdir /scripts/pre-exec.d \
    && mkdir /scripts/pre-init.d \
    && chmod -R 755 /scripts

## expose port
EXPOSE 3306

## define volume
VOLUME ["/var/lib/mysql"]

## start service
ENTRYPOINT ["/scripts/entrypoint.sh"]
