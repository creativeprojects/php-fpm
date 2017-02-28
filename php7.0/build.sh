#!/bin/sh

current_version=7.0.12
image_name=creativeprojects/php-fpm

if [ -n "$1" ]; then
    current_version="$1"
fi

docker pull php:${current_version}-fpm
docker rmi ${image_name}:latest
sed -e "s/PHP_VERSION/${current_version}/g" Dockerfile.template > Dockerfile
docker build -t ${image_name}:${current_version} -t ${image_name}:latest ./
docker push ${image_name}:${current_version}
docker push ${image_name}:latest
rm Dockerfile
