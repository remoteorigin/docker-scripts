FROM nginx:1.11.10-alpine

COPY nginx.conf /etc/nginx/nginx.conf

RUN apk add --update certbot \
  && rm -rf /var/cache/apk/* && mkdir /var/www
COPY certbot.ini root/.config/letsencrypt/cli.ini
