# Error Reporting using sentry.io

First follow the Docker installation instructions from [Docker Installation](../docker-installation.md) (the machine requires 2 GB ram), then continue:

    git clone git@github.com:remoteorigin/docker-scripts.git
    cd error-reporter-sentry/
    docker run --rm sentry config generate-secret-key
   
The last line will be the `SENTRY_SECRET_KEY` - store it somewhere

    cp .env-sample .env

Edit newly created `.env` file and add your `SENTRY_SECRET_KEY`

    docker-compose up -d
    docker exec -it errorreportersentry_sentry_1 sentry upgrade

### Good to know

- The instance requires 2 GB ram
- For source maps to work properly, the sentry worker needs to share a volume with the sentry web container
- Redis might require persistence using a volume similar to postgresql

## How to set change log level in the sentry worker

- Remove  `/usr/local/lib/python2.7/site-packages/sentry/lang/javascript/processor.pyc`
- Edit `/usr/local/lib/python2.7/site-packages/sentry/lang/javascript/processor.py` (you can use vim)
- Add `logger.setLevel(logging.DEBUG)`
