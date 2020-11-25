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
        libmcrypt-dev \
        libpng-dev \
        libcurl4-openssl-dev libpcre3-dev \
        libpq5 libpq-dev \
    && docker-php-ext-install bz2 calendar exif gettext mbstring mcrypt mysqli pdo_mysql pgsql pdo_pgsql sockets zip \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include --with-jpeg-dir=/usr/include \
    && docker-php-ext-install gd \
    && pecl install xdebug-2.7.2 \
    && pecl install igbinary \
    && printf "yes\n" | pecl install redis \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/* \
    && chmod 777 /tmp/xdebug

COPY ext-*.ini /usr/local/etc/php/conf.d/
