#!/bin/sh

image_name=creativeprojects/php-fpm
php_versions="8.2.27 8.2.28"

cd $(dirname "${0}")

for php_version in ${php_versions}; do
    main_version=${php_version%.*}
    echo "Will generate docker image for PHP ${main_version} (${php_version}):"
    docker pull creativeprojects/webgrind:latest
    docker pull php:${php_version}-fpm
    docker rmi ${image_name}:${main_version}
    docker rmi ${image_name}:latest
    sed -e "s/PHP_VERSION/${php_version}/g" php${main_version}.Dockerfile > Dockerfile
    docker build \
        --pull \
        --build-arg http_proxy=${http_proxy} \
        --tag ${image_name}:${php_version} \
        --tag ${image_name}:${main_version} \
        --tag ${image_name}:latest \
        ./
    rm Dockerfile
done

echo "Pushing images to docker repository..."
for php_version in ${php_versions}; do
    main_version=${php_version%.*}
    echo "Pushing image ${php_version}..."
    docker push ${image_name}:${php_version}
    echo "Pushing image ${main_version}..."
    docker push ${image_name}:${main_version}
done
echo "Pushing latest image..."
docker push ${image_name}:latest
