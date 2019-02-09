# Single Dockerized LEMP Stack

Project Details
----
This set of dockerfiles and compose run and deploy an LEMP stack on a single node environment including:

 * Nginx (1.14)
 * PHP7-FPM (7.2)
 * MariaDB (10.2)

 and all based on Alpine Linux 3.8 as the base image.

Up n Launch
----
To run and launch the LEMP stack, first install `docker-compose` and `git` on the Docker host and then run these commands:

```bash
  git clone https://github.com/RoozbehShafiee/single_dockerized_lemp_stack.git \
  && cd single_dockerized_lemp_stack \
  && docker-compose up -d --build
```

Environment Variables
----

Before running the stack, change default environment variables for `mariadb` service in `docker-compose.yml`:

```yaml
environment:
  - MYSQL_DATABASE=dbname
  - MYSQL_USER=username
  - MYSQL_PASSWORD=myPassword
  - MYSQL_ROOT_PASSWORD=rootPassword
```

also define a `DOMAIN_NAME` binded to a valid IP address and `EMAIL_ADDRESS` for `nginx` service for running Let's Encrypt Certbot successfully.

```yaml
environment:
  - DOMAIN_NAME=example.com
  - EMAIL_ADDRESS=my@email.com
```

IMPORTANT: Stack uses Let's Encrypt to make `HTTPS` connections by default, so DO run the stack with a valid domain name binded to a valid IP address. (It doesn't run on localhost)
