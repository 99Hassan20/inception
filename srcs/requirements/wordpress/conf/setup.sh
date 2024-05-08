#!/bin/bash

DB_USER_PASSWORD=$(cat /run/secrets/db_user_password)

WP_ADMIN_USERNAME=$(cat /run/secrets/wp_credentials | grep WP_ADMIN_USERNAME | cut -d '=' -f 2)
WP_ADMIN_PASSWORD=$(cat /run/secrets/wp_credentials | grep WP_ADMIN_PASSWORD | cut -d '=' -f 2)

WP_USER_NAME=$(cat /run/secrets/wp_credentials | grep WP_USER_NAME | cut -d '=' -f 2)
WP_USER_PASSWORD=$(cat /run/secrets/wp_credentials | grep WP_USER_PASSWORD | cut -d '=' -f 2)

cd /var/www/html/wordpress
# check if wordpress is already installed``
if [ -e "/var/www/html/wordpress/wp-config.php" ]; then
    echo "WordPress is already installed"
else
    wp core download --allow-root

    wp core config --dbname=${DB_NAME} --dbuser=${DB_USER_NAME} --dbpass=${DB_USER_PASSWORD} --dbhost=mariadb --allow-root

    wp core install --url=${DOMAIN_NAME} --title=${TITLE} --admin_user=${WP_ADMIN_USERNAME} --admin_password=${WP_ADMIN_PASSWORD} --admin_email=${WP_ADMIN_EMAIL} --allow-root

    wp user create ${WP_USER_NAME} ${USER_EMAIL} --role=editor --user_pass=${WP_USER_PASSWORD} --allow-root
fi

sed -i "s|listen = /run/php/php8.2-fpm.sock|listen = 0.0.0.0:9000|g" /etc/php/8.2/fpm/pool.d/www.conf

exec $@