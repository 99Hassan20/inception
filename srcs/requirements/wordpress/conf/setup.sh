#!/bin/bash


WP_ADMIN_USERNAME=$(cat /run/secrets/wp_credentials | grep WP_ADMIN_USERNAME | cut -d "=" -f2)
WP_ADMIN_PASSWORD=$(cat /run/secrets/wp_credentials | grep WP_ADMIN_PASSWORD | cut -d "=" -f2)

WP_USER_NAME=$(cat /run/secrets/wp_credentials | grep WP_USER_NAME | cut -d "=" -f2)
WP_USER_PASSWORD=$(cat /run/secrets/wp_credentials | grep WP_USER_PASSWORD | cut -d "=" -f2)

cd /var/www/html/wordpress
ls -al

wp core download --allow-root

wp core config --dbname=${DB_NAME} --dbuser=${DB_USER_NAME} --dbpass=$(cat /run/secrets/db_user_password) --dbhost=${DB_HOST} --allow-root

wp core install --url=${DOMAIN_NAME} --title=${TITLE} --admin_user=${WP_ADMIN_USERNAME} --admin_password=${WP_ADMIN_PASSWORD} --admin_email=${WP_ADMIN_EMAIL} --allow-root

wp user create ${WP_USER_NAME} ${WP_USER_EMAIL} --role=editor --user_pass=${WP_USER_PASSWORD} --allow-root

sed -i "s|listen = /run/php/php8.2-fpm.sock|listen = 0.0.0.0:9000|g" /etc/php/8.2/fpm/pool.d/www.conf

exec $@