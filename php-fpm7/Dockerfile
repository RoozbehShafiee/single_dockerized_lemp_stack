FROM alpine:3.9

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
RUN apk add --update --no-cache \
        libmcrypt-dev \
        zlib-dev \
        gmp-dev \
        freetype-dev \
        libjpeg-turbo-dev \
        libpng-dev \
        php7-fpm \
        php7-json \
        php7-zlib \
        php7-xml \
        php7-pdo \
        php7-phar \
        php7-openssl \
        php7-pdo_mysql \
        php7-mysqli \
        php7-session \
        php7-gd \
        php7-iconv \
        php7-mcrypt \
        php7-gmp \
        php7-zip \
        php7-curl \
        php7-opcache \
        php7-ctype \
        php7-apcu \
        php7-intl \
        php7-bcmath \
        php7-dom \
        php7-mbstring \
        php7-xmlreader \
    && rm -f /var/cache/apk/*

## managing users, groups, files, directories and configuration files
RUN mkdir /run/php \
    && mkdir -p /var/log/php-fpm7 \
    && sed -i 's/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/g' /etc/php7/php.ini \
    && sed -i 's/expose_php = On/expose_php = Off/g' /etc/php7/php.ini \
    && sed -i "s|;date.timezone =|date.timezone = ${TIMEZONE}|g" /etc/php7/php.ini \
    && addgroup -g 82 -S nginx \
	  && adduser -u 82 -D -S -G nginx nginx
ADD www.conf /etc/php7/php-fpm.d/www.conf

## data sorage
VOLUME ["${DATA_DIR}"]

## working directory
WORKDIR ${DATA_DIR}

## expose port
EXPOSE 9000

## running commands to start services
ENTRYPOINT /usr/sbin/php-fpm7 --nodaemonize
