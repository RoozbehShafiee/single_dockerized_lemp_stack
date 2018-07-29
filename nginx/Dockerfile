FROM ubuntu:18.04

## label and credits
LABEL image="Single Dockerized LEMP Stack - Nginx Docker Image" \
      maintainer="Roozbeh Shafiee, me@roozbeh.cloud" \
      version="1.0.0-production" \
      released="July 25th, 2018" \
      reference="https://roozbeh.cloud, https://github.com/RoozbehShafiee"

## environment variables
ENV BRANCH=stable \
    HOME=/root \
    DEBIAN_FRONTEND=noninteractive \
    DATA_DIR=/data

## manage packages and repositories
RUN apt-get update \
    && apt-get -y dist-upgrade \
    && apt-get install -y software-properties-common \
    && add-apt-repository ppa:nginx/${BRANCH} \
    && apt-get update \
    && apt-get install -y nginx \
    && rm -rf /var/lib/apt/lists/*

## add and apply extra configuration files.
ADD ./conf_files/entrypoint.sh /entrypoint.sh
ADD ./conf_files/80-default /etc/nginx/sites-available/80-default
ADD ./conf_files/443-default /etc/nginx/sites-available/443-default
ADD ./conf_files/nginx.conf /etc/nginx/nginx.conf
ADD ./conf_files/sysctl.conf /etc/sysctl.d/00-ubuntu_nginx.conf
ADD ./conf_files/ssl /etc/nginx/ssl
RUN rm /etc/nginx/sites-available/default \
    && rm /etc/nginx/sites-enabled/default \
    && chmod +x /entrypoint.sh

## forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

## data sorage
VOLUME  ["${DATA_DIR}"]

## working directory
WORKDIR ${DATA_DIR}

## expose port
EXPOSE 80 443

## running commands to start services
STOPSIGNAL SIGTERM
ENTRYPOINT ["/entrypoint.sh"]
