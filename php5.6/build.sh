#!/bin/sh

current_version=5.6.8
image_name=creativeprojects/php-fpm

docker pull php:${current_version}-fpm
sed -e "s/PHP_VERSION/${current_version}/g" Dockerfile.template > Dockerfile
docker build -t ${image_name}:${current_version} ./
docker push ${image_name}:${current_version}
rm Dockerfile
