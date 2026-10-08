#!/bin/sh

image_name=creativeprojects/php-fpm
php_versions="8.2.34 8.4.26"

cd $(dirname "${0}") || exit 1

docker buildx create --driver docker-container --name php-fpm-builder --bootstrap --use

for php_version in ${php_versions}; do
    main_version=${php_version%.*}
    echo "Will generate docker image for PHP ${main_version} (${php_version}):"
    docker buildx build \
        --pull \
        --file php${main_version}.Dockerfile \
        --build-arg PHP_VERSION=${php_version} \
		--platform linux/amd64,linux/arm64 \
        --tag ${image_name}:${php_version} \
        --tag ${image_name}:${main_version} \
        --tag ${image_name}:latest \
        --push \
        .
done

docker buildx rm php-fpm-builder
