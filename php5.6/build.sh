#!/bin/sh

current_version=5.6.8

docker pull php:${current_version}-fpm
sed -e "s/PHP_VERSION/${current_version}/g" Dockerfile.template > Dockerfile
docker build -t creativeprojects/php-fpm:${current_version} ./
rm Dockerfile
