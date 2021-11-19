FROM php:7.4

RUN apt-get update

RUN apt-get install -qq git curl libmcrypt-dev libjpeg-dev libpng-dev libfreetype6-dev libbz2-dev libzip-dev zip

RUN apt-get clean

RUN docker-php-ext-install zip

RUN  pecl install mcrypt && docker-php-ext-enable mcrypt

RUN curl --silent --show-error "https://getcomposer.org/installer" | php -- --install-dir=/usr/local/bin --filename=composer

RUN composer global require "laravel/envoy=~1.0"