FROM node:10

RUN npm install -g bower
RUN npm install --global gulp-cli grunt-cli && npm install gulp grunt
RUN echo '{ "allow_root": true }' > /root/.bowerrc

WORKDIR /var/www/markup
