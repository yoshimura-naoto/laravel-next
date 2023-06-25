FROM php:8.2-fpm-bullseye

COPY --chown=www-data:www-data ./server /app
COPY ./server/.docker/local/php/php.ini /usr/local/etc/php/php.ini
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer
COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/bin/

RUN install-php-extensions \
    pdo_mysql \
    bcmath \
    mbstring \
    zip \
    opcache \
    gd \
    intl \
    redis \
    decimal \
    xdebug

RUN curl -sL https://deb.nodesource.com/setup_lts.x | bash -
RUN apt install -y nodejs
RUN npm install --global yarn

WORKDIR /app
