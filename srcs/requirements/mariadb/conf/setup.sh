#!/bin/bash

DB_USER_PASSWORD=$(cat /run/secrets/db_user_password)
DB_ROOT_PASSWORD=$(cat /run/secrets/db_root_password)

echo "FLUSH PRIVILEGES;
     CREATE DATABASE IF NOT EXISTS $DB_NAME;
     CREATE USER IF NOT EXISTS '$DB_USER_NAME'@'%' IDENTIFIED BY '$DB_USER_PASSWORD';
     GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER_NAME'@'%';
     ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PASSWORD';
     FLUSH PRIVILEGES;" | mariadbd --user=root --bootstrap 

exec "$@"
     