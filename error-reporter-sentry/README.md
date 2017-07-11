
First follow the Docker installation instructions from [Docker Installation](../docker-installation.md) (the machine requires 2 GB ram), then continue:

    git clone git@github.com:remoteorigin/docker-scripts.git
    cd error-reporter-sentry/

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

## How to enable SSL

###First time deploy (no existing SSL certificate)

- Disable ssl inside `ssl-proxy/nginx.conf` (comment all lines that start with `ssl`)
- Deploy docker containers with ssl disabled `docker-compose up --build -d`
- Generate certs using `docker exec -it errorreportersentry_ssh_server_1 certbot certonly --agree-tos --keep-until-expiring`
- Enable SSL inside `ssl-proxy/nginx.conf` (enable all lines that start with `ssl`)
- Deploy docker containers with ssl enabled `docker-compose up --build -d`


###Renew SSL certificate (every 90 days)

- Generate certs using `docker exec -it errorreportersentry_ssh_server_1 certbot certonly --agree-tos --keep-until-expiring`
- Restart server `docker-compose restart`
