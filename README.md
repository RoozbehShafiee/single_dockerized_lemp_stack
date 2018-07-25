# Single Dockerized LEMP Stack

Project Details
----
This set of dockerfiles and compose run and deploy an LEMP stack on a single node environment including:

 * Nginx (Stable branch)
 * PHP7-FPM (7.2)
 * MySQL 8 (8.0)

 and all based on Ubuntu:18.04 as the base image.

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

To create `Username`, `Password` and `Database` during the launch, use these environment variables for `mysql` service in `docker-compose.yml`:

```yaml
environment:
  - MYSQL_USER=username
  - MYSQL_PASS=myPassword
  - DB_NAME=dbname
```

also to define `FQDN` and `Supporting SSL` for `nginx` service:

```yaml
environment:
  - FQDN=example.com
  - SUPPORT_SSL=no
```

IMPORTANT: If you want to use SSL support, don't forget to place ssl keys into ./nginx/conf_files/ssl with this naming:

- certificate.pem
- private.key
