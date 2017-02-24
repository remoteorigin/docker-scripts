# Error Reporting using sentry.io

First follow the Docker installation instructions from [Docker Installation](../docker-installation.md) (the machine requires 2 GB ram), then continue:

    git clone git@github.com:remoteorigin/docker-scripts.git
    cd error-reporter-sentry/

Generate SSL keys using

    openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout ssl-proxy/cert.key -out ssl-proxy/cert.crt

Start docker containers and setup sentry

    docker-compose up -d
    docker exec -it errorreportersentry_sentry_1 sentry upgrade



### Good to know

- The instance requires 2 GB ram
- For source maps to work properly, the sentry worker needs to share a volume with the sentry web container
- Redis might require persistence using a volume similar to postgresql
- Exposed ports are 80 and 443
- The server works only using SSL/HTTPS

## How to set change log level in the sentry worker

- Remove  `/usr/local/lib/python2.7/site-packages/sentry/lang/javascript/processor.pyc`
- Edit `/usr/local/lib/python2.7/site-packages/sentry/lang/javascript/processor.py` (you can use vim)
- Add `logger.setLevel(logging.DEBUG)`
