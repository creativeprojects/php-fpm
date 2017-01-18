# php-fpm

## php 5.6 fpm

PHP-FPM Docker image with most used PHP extensions installed.
This reflects a typical php available on many commercial (and even some free) shared hosting.

Extensions installed:
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
