FROM alpine:3.9

## label and credits
LABEL image="Single Dockerized LEMP Stack - MariaDB 10.2 Docker Image" \
      maintainer="Roozbeh Shafiee, me@roozbeh.cloud" \
      version="1.0.0-production" \
      released="February 8th, 2019" \
      reference="https://roozbeh.cloud, https://github.com/RoozbehShafiee"

## manage packages and repositories
RUN apk add --update --no-cache \
        mariadb \
        mariadb-client \
        pwgen \
    && rm -f /var/cache/apk/*

## managing files, directories and configuration file
ADD entrypoint.sh /scripts/entrypoint.sh
ADD my.cnf /etc/my.cnf
RUN mkdir -p /etc/mysql/conf.d/ \
    && mkdir /docker-entrypoint-initdb.d \
    && mkdir /scripts/pre-exec.d \
    && mkdir /scripts/pre-init.d \
    && chmod -R 755 /scripts

## expose port
EXPOSE 3306

## define volume
VOLUME ["/var/lib/mysql"]

## start service
ENTRYPOINT ["/scripts/entrypoint.sh"]
