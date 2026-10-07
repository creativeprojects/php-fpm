#!/bin/sh

image_name=creativeprojects/php-fpm
php_versions="8.2.34 8.4.26"

cd $(dirname "${0}") || exit 1

for php_version in ${php_versions}; do
    main_version=${php_version%.*}
    echo "Will generate docker image for PHP ${main_version} (${php_version}):"
    sed -e "s/PHP_VERSION/${php_version}/g" php${main_version}.Dockerfile > Dockerfile
    docker buildx build \
        --pull \
		--platform linux/amd64,linux/arm64 \
        --tag ${image_name}:${php_version} \
        --tag ${image_name}:${main_version} \
        --tag ${image_name}:latest \
        --push \
        .
    rm Dockerfile
done
