FROM php:PHP_VERSION-fpm

LABEL maintainer="Fred <Fred@CreativeProjects.Tech>" \
      version="PHP_VERSION-fpm"

VOLUME /tmp/xdebug

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y \
        libbz2-dev libzip-dev \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        libcurl4-openssl-dev libpcre3-dev \
        libpq5 libpq-dev \
        libonig5 libonig-dev \
    && docker-php-ext-install bz2 calendar exif gettext mbstring mysqli pdo_mysql pgsql pdo_pgsql sockets zip \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd \
    && pecl install xdebug-3.1.1 \
    && pecl install igbinary \
    && printf "yes\n" | pecl install redis \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p /tmp/xdebug \
    && chmod 777 /tmp/xdebug

COPY ext-*.ini /usr/local/etc/php/conf.d/
