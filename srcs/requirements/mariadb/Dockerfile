FROM debian:bookworm

RUN apt update && apt install -y mariadb-server 

RUN mkdir -p /var/run/mysqld && chmod 777 /var/run/mysqld && chown -R mysql:mysql /var/run/mysqld

EXPOSE 3306

COPY conf/setup.sh /setup.sh 
RUN chmod u+x /setup.sh

ENTRYPOINT  ["sh", "setup.sh"]  
# USER mysql

CMD ["mariadbd", "--user=mysql", "--bind-address=0.0.0.0"]
# CMD ["mysqld"]

