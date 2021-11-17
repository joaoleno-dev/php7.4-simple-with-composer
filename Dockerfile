FROM php:7.4

RUN apt-get update

RUN apt-get install -qq git curl libmcrypt-dev libjpeg-dev libpng-dev libfreetype6-dev libz2-dev

RUN apt-get clean

RUN docker-php-ext-install mcrypt zip

RUN curl --silent --show-error "https://getcomposer.org/installer" | php -- --install-dir=/usr/local/bin --filename=composer

RUN composer global require "laravel/envoy=~1.0"