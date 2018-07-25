FROM ubuntu:18.04

## label and credits
LABEL image="Single Dockerized LEMP Stack - MySQL 8 Docker Image" \
      maintainer="Roozbeh Shafiee, me@roozbeh.cloud" \
      version="1.0.0-production" \
      released="July 25th, 2018" \
      reference="https://roozbeh.cloud, https://github.com/RoozbehShafiee"

## environment variables
ENV MYSQL_USER=admin \
    MYSQL_PASS= \
    REPLICATION_USER=replica \
    REPLICATION_PASS=replica \
    REPLICATION_HOST= \
    REPLICATION_PORT=3306 \
    MYSQL_DATA_DIR=/var/lib/mysql \
    MYSQL_CONFIG=/etc/mysql/conf.d/custom.cnf \
    MYSQL_RUN_DIR=/var/run/mysqld \
    MYSQL_LOG=/var/log/mysql/error.log \
    OS_LOCALE="en_US.UTF-8" \
    DEBIAN_FRONTEND=noninteractive

## install MySQL 8 and necessary configurations
RUN apt-get update \
    && apt-get install -y gnupg2 \
    && apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 5072E1F5 \
    && echo "deb http://repo.mysql.com/apt/ubuntu/ bionic mysql-8.0" | tee /etc/apt/sources.list.d/mysql.list \
    && apt-get update \
    && apt-get -y dist-upgrade \
    && apt-get -yq install mysql-server mysql-client lbzip2 \
    && rm -rf /etc/mysql/* \
    && mkdir /etc/mysql/conf.d \
    && rm -rf /var/lib/apt/lists/* \
    && touch /tmp/.EMPTY_DB \
    && rm -rf /var/lib/apt/lists/*

## add and apply extra configuration files.
ADD ./conf_files/my.cnf /etc/mysql/my.cnf
ADD ./conf_files/custom.cnf ${MYSQL_CONFIG}
ADD ./conf_files/entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh

## container volume
VOLUME  ["${MYSQL_DATA_DIR}"]

## expose port
EXPOSE 3306/tcp

## setup and run MySQL
ENTRYPOINT ["/entrypoint.sh"]
