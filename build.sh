#!/bin/sh

image_name=creativeprojects/php-fpm
php_versions="5.6.34 7.0.32 7.0.33 7.1.23"

cd $(dirname "${0}")

for php_version in ${php_versions}; do
    main_version=${php_version%.*}
    echo "Will generate docker image for PHP ${main_version} (${php_version}):"
    cd php${main_version}
    docker pull creativeprojects/webgrind:latest
    docker pull php:${php_version}-fpm
    docker rmi ${image_name}:${main_version}
    docker rmi ${image_name}:latest
    sed -e "s/PHP_VERSION/${php_version}/g" Dockerfile.template > Dockerfile
    docker build \
        -t ${image_name}:${php_version} \
        -t ${image_name}:${main_version} \
        -t ${image_name}:latest \
        ./
    rm Dockerfile
    cd ..
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
