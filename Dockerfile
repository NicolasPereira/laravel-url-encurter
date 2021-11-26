FROM php:8.0.5-fpm-alpine
RUN apk add --no-cache openssl bash nodejs npm
RUN docker-php-ext-install bcmath mysqli pdo pdo_mysql
RUN docker-php-ext-enable pdo_mysql
WORKDIR /var/www
RUN chown -R www-data:www-data /var/www
RUN rm -rf /var/www/html
RUN ln -s public html
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
EXPOSE 9000
ENTRYPOINT ["php-fpm"]
