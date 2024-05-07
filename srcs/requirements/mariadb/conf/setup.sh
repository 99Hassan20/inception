#!/bin/bash

echo "FLUSH PRIVILEGES;
     CREATE DATABASE IF NOT EXISTS $DB_NAME;
     CREATE USER IF NOT EXISTS '$DB_USER_NAME'@'%' IDENTIFIED BY $(cat /run/secrets/db_password);
     GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER_NAME'@'%';
     ALTER USER 'root'@'%' IDENTIFIED BY $(cat /run/secrets/db_root_password);
     FLUSH PRIVILEGES;" | mariadbd --user=root --bootstrap 

exec "$@"
     