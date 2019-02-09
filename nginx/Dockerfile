FROM alpine:3.9

## label and credits
LABEL image="Single Dockerized LEMP Stack - Nginx Docker Image" \
      maintainer="Roozbeh Shafiee, me@roozbeh.cloud" \
      version="1.0.0-production" \
      released="February 8th, 2019" \
      reference="https://roozbeh.cloud, https://github.com/RoozbehShafiee"

## environment variables
ENV DATA_DIR=/data

## manage packages and repositories
RUN apk add --update --no-cache \
        nginx \
        curl \
        bash \
        openssl \
        certbot \
        python3 \
        py3-pip \
    && pip3 install --upgrade pip \
    && pip3 install 'certbot-nginx' \
    && pip3 install 'pyopenssl' \
    && rm -f /var/cache/apk/*

## managing files, directories and configuration file
ADD entrypoint.sh /entrypoint.sh
ADD default /etc/nginx/conf.d/default
ADD nginx.conf /etc/nginx/nginx.conf
ADD sysctl.conf /etc/sysctl.d/nginx.conf
RUN chmod +x /entrypoint.sh \
    && mkdir -p /run/nginx

## forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

## data volume
VOLUME  ["${DATA_DIR}"]

## working directory
WORKDIR ${DATA_DIR}

## expose port
EXPOSE 443 80

## running commands to start services
STOPSIGNAL SIGTERM
ENTRYPOINT ["/entrypoint.sh"]
