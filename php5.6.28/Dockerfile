FROM php:5.6.28-fpm

MAINTAINER Fred <Fred@CreativeProjects.Tech>

RUN apt-get update && apt-get install -y \
        libbz2-dev \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng12-dev \
    && docker-php-ext-install bz2 calendar exif gettext mbstring mcrypt mysql mysqli pdo_mysql sockets zip \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include --with-jpeg-dir=/usr/include \
    && docker-php-ext-install gd \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

