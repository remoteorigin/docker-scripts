Install instructions
====================
Run the following commands:

- `docker run --rm sentry config generate-secret-key`
- `update key in the .env file`
- `docker-compose up -d`
- `docker exec -it errorreportersentry_sentry_1 sentry upgrade`


⚠WARNING⚠
- The instance requires 2 GB ram !
- For source maps to work properly, the sentry worker needs to share a volume with the sentry web container
- Redis might require persistence using a volume similar to postgresql

##How to set change log level in the sentry worker:

- Remove  `/usr/local/lib/python2.7/site-packages/sentry/lang/javascript/processor.pyc`
- edit `/usr/local/lib/python2.7/site-packages/sentry/lang/javascript/processor.py` (you can use vim)
- Add `logger.setLevel(logging.DEBUG)`
