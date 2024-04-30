FROM debian:bookworm

RUN apt update && apt upgrade -y && apt install -y php8.2 php8.2-fpm php8.2-mysql mariadb-client mariadb-server nginx curl

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

COPY conf/setup.sh setup.sh

RUN chmod +x setup.sh

EXPOSE 9000

ENTRYPOINT [ "sh", "setup.sh" ]

CMD ["php-fpm8.2", "-R", "-F"]