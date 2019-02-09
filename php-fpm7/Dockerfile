FROM alpine:3.8

## label and credits
LABEL image="Single Dockerized LEMP Stack - PHP-FPM Docker Image" \
      maintainer="Roozbeh Shafiee, me@roozbeh.cloud" \
      version="1.0.0-production" \
      released="February 8th, 2019" \
      reference="https://roozbeh.cloud, https://github.com/RoozbehShafiee"

## environment variables
ENV DATA_DIR=/data \
    TIMEZONE=Europe/Berlin

## manage packages and repositories
RUN apk update \
    && apk add \
           php7-fpm \
           php7-xml \
           php7-mysqli \
           php7-mysqlnd \
    && rm -f /var/cache/apk/*

## edit configuration files
RUN mkdir /run/php \
    && sed -ie "s|;date.timezone =|date.timezone = ${TIMEZONE}|g" /etc/php7/php.ini \
    && sed -ie "s|listen = 127.0.0.1:9000|listen = 0.0.0.0:9000|g" /etc/php7/php-fpm.d/www.conf

## data sorage
VOLUME ["${DATA_DIR}"]

## working directory
WORKDIR ${DATA_DIR}

## expose port
EXPOSE 9000

## running commands to start services
ENTRYPOINT /usr/sbin/php-fpm7 --nodaemonize
