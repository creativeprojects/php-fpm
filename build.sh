#!/bin/sh

docker build -t creativeprojects/php-fpm:5.6.8 ./php5.6.8/
docker build -t creativeprojects/php-fpm:5.6.28 ./php5.6.28/
docker build -t creativeprojects/php-fpm:7.0.7 ./php7.0.7/
docker build -t creativeprojects/php-fpm:7.0.12 ./php7.0.12/
