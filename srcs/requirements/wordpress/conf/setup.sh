#!/bin/bash

mkdir /var/www/html/wordpress

cd /var/www/html/wordpress

wp core download --allow-root

wp core config --dbname=${DB_NAME} --dbuser=${DB_USER_NAME} --dbpass=${DB_USER_PASSWORD} --dbhost=mariadb --allow-root

wp core install --url=${DOMAIN_NAME} --title=${TITLE} --admin_user=${WP_ADMIN_USERNAME} --admin_password=${WP_ADMIN_PASSWORD} --admin_email=${WP_ADMIN_EMAIL} --allow-root

wp user create ${USER_NAME} ${USER_EMAIL} --role=editor --user_pass=${USER_PASSWORD} --allow-root

sed -i "s|listen = /run/php/php8.2-fpm.sock|listen = 0.0.0.0:9000|g" /etc/php/8.2/fpm/pool.d/www.conf

exec $@