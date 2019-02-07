FROM php:7.2-fpm

RUN apt-get -qq update && apt-get -qq install -y \
    libmcrypt-dev \
    libpq-dev \
    git \
    vim \
    zip \
    zlib1g-dev \
    sqlite3 \
    libsqlite3-dev  \
 && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-install
    pdo \
    pdo_pgsql \
    zip \
    mbstring \

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin/ --filename=composer
WORKDIR /var/www


RUN adduser --disabled-password --gecos "" docker-user && \
  echo "docker-user ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER docker-user





