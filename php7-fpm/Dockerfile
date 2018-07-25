FROM ubuntu:18.04

## label and credits
LABEL image="Single Dockerized LEMP Stack - PHP-FPM Docker Image" \
      maintainer="Roozbeh Shafiee, me@roozbeh.cloud" \
      version="1.0.0-production" \
      released="July 25th, 2018" \
      reference="https://roozbeh.cloud, https://github.com/RoozbehShafiee"

## environment variables
ENV HOME=/root \
    DEBIAN_FRONTEND=noninteractive \
    DATA_DIR=/data \
    TIMEZONE=Europe/Berlin


## manage packages and repositories
RUN apt-get update \
    && apt-get -y dist-upgrade \
    && apt-get -y install php-fpm php-xml php-mysql \
    && rm -rf /var/lib/apt/lists/*

## edit configuration files
RUN mkdir /run/php \
    && sed -ie "s|;date.timezone =|date.timezone = ${TIMEZONE}|g" /etc/php/7.2/fpm/php.ini \
    && sed -ie "s|listen = /run/php/php7.2-fpm.sock|listen = 0.0.0.0:9000|g" /etc/php/7.2/fpm/pool.d/www.conf

## forward request logs to docker log collector
RUN ln -sf /dev/stdout /var/log/php7.2-fpm.log

## data sorage
VOLUME ["${DATA_DIR}"]

## working directory
WORKDIR ${DATA_DIR}

## expose port
EXPOSE 9000

## running commands to start services
ENTRYPOINT /usr/sbin/php-fpm7.2 --nodaemonize
