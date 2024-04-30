#!/bin/bash

mkdir /var/www/html/wordpress

cd /var/www/html/wordpress

wp core download --allow-root

wp core config --dbname=${DB_NAME} --dbuser=${DB_USER_NAME} --dbpass=${DB_USER_PASSWORD} --dbhost=mariadb --allow-root

wp core install --url=${DOMAIN_NAME} --title=${TITLE} --admin_user=${WP_USER} --admin_password=${ADMIN_PASSWORD} --admin_email=${ADMIN_EMAIL} --allow-root

exec $@