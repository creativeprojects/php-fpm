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

Development extensions installed:
* xdebug (with "profiler_enable_trigger" and "trace_enable_trigger" both enabled)

For historical reasons, I'm using php 5.6.8, and the latest (5.6.28)

To download an image:

```
docker pull creativeprojects/php-fpm:5.6.8
```

```
docker pull creativeprojects/php-fpm:5.6.28
```


## php 7.0 fpm

Almost the same image as the 5.6 ones, except the module _mysql_ which doesn't exist any more (and was deprecated for quite some time).

To download the latest image:

```
docker pull creativeprojects/php-fpm:7.0.12
```


## php 7.1 fpm

Same configuration as php 7.0 images


To download the latest image:

```
docker pull creativeprojects/php-fpm:7.1.0
```

## xdebug

xdebug is configured with these options:

xdebug.coverage_enable=0
xdebug.profiler_enable_trigger=1
xdebug.profiler_output_dir=/tmp/xdebug
xdebug.show_mem_delta=1
xdebug.trace_enable_trigger=1
xdebug.trace_output_dir=/tmp/xdebug

If you want to see the profiles, you can use my [webgrind docker image](https://github.com/creativeprojects/webgrind.docker)
