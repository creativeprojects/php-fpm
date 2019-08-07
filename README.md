# php-fpm

## php 5.6 fpm

PHP-FPM Docker image with all the most used PHP extensions installed.
This reflects a typical PHP host available on many commercial shared hosting platforms (and even some free ones).

Please note these images are not always the very latest ones available.
It's because I follow the images used by the different shared hosting platform I'm using for my projects.

Common hosting platform extensions installed:
* bz2
* calendar
* exif
* gettext
* mbstring
* mcrypt
* mysql
* mysqli
* pdo_mysql
* sockets
* zip
* gd
* PECL igbinary and phpredis

Development extensions installed:
* xdebug 2.5.5 (with "profiler_enable_trigger" and "trace_enable_trigger" both enabled)

For historical reasons, I'm using php 5.6.34

[Docker file](https://github.com/creativeprojects/php-fpm/blob/master/php5.6.Dockerfile)

To download an image:

```
docker pull creativeprojects/php-fpm:5.6.34
```


## php 7.0 fpm

Almost the same image as the 5.6 ones, except for the deprecated module _mysql_. Included: _xdebug_ 2.6.1

[Docker file](https://github.com/creativeprojects/php-fpm/blob/master/php7.0.Dockerfile)

To download the latest images:

```
docker pull creativeprojects/php-fpm:7.0.33
```


## php 7.1 fpm

Same configuration as php 7.0 images, except for the deprecated module _mcrypt_. Included: _xdebug_ 2.7.2

[Docker file](https://github.com/creativeprojects/php-fpm/blob/master/php7.1.Dockerfile)

To download the latest images:

```
docker pull creativeprojects/php-fpm:7.1.31
```


## php 7.2 fpm

Same configuration as php 7.1 images

[Docker file](https://github.com/creativeprojects/php-fpm/blob/master/php7.2.Dockerfile)

To download the latest images:

```
docker pull creativeprojects/php-fpm:7.2.21
```


## php 7.3 fpm

Same configuration as php 7.2 images

[Docker file](https://github.com/creativeprojects/php-fpm/blob/master/php7.3.Dockerfile)

To download the latest images:

```
docker pull creativeprojects/php-fpm:7.3.4
```

## xdebug

xdebug is configured with these options:

```
xdebug.coverage_enable=0
xdebug.profiler_enable_trigger=1
xdebug.profiler_output_dir=/tmp/xdebug
xdebug.show_mem_delta=1
xdebug.trace_enable_trigger=1
xdebug.trace_output_dir=/tmp/xdebug
```

If you want to see the profiles, you can use my [webgrind docker image](https://github.com/creativeprojects/webgrind.docker)
