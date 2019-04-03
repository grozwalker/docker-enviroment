FROM node:10-alpine

RUN apk add --quiet --no-progress --update git bash

RUN npm install -g bower
RUN npm install --global gulp-cli && npm install gulp

WORKDIR /var/www
