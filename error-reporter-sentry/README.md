Install instructions
====================
Run the following commands:

- `docker run --rm sentry config generate-secret-key`
- `docker-compose up -d redis postgres sentry`
- `update key in the .env file`
- `docker-compose down`
- `docker-compose up -d redis postgres sentry`
- `docker exec -it [CONTAINER] sentry upgrade`
- `docker-compose up -d`


⚠WARNING⚠ The instance requires 2 GB ram !

##How to set change log level in the sentry worker:

- Remove  `/usr/local/lib/python2.7/site-packages/sentry/lang/javascript/processor.pyc`
- edit `/usr/local/lib/python2.7/site-packages/sentry/lang/javascript/processor.py` (you can use vim)
- Add `logger.setLevel(logging.DEBUG)`
