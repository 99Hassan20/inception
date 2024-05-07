
all:
	mkdir -p /Users/hassanoigag/1337/inception/data/wordpress
	mkdir -p /Users/hassanoigag/1337/inception/data/mariadb
	docker-compose -f ./srcs/docker-compose.yml up --build -d

clean:
	docker-compose -f ./srcs/docker-compose.yml down
	docker volume rm -f $$(docker volume ls -q) 2> /dev/null
	rm -rf /Users/hassanoigag/1337/inception/data/wordpress
	rm -rf /Users/hassanoigag/1337/inception/data/mariadb

fclean: clean
	docker rmi -f $$(docker images -qa)

re: down all

