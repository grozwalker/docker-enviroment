FROM nginx:1.12

COPY ./docker/dev/config/vhost.conf /etc/nginx/conf.d/default.conf
COPY ./docker/dev/config/custom.ini /usr/local/etc/php/conf.d/custom.ini

WORKDIR /var/www