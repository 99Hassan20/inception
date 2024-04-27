all:
	docker-compose -f ./srcs/docker-compose.yml up --build -d
down:
	docker-compose -f ./srcs/docker-compose.yml down
	
stop:
	docker stop $$(docker ps -q)
remove:
	docker rm $$(docker ps -qa)
clean: stop remove

fclean: clean
	docker rmi $$(docker images -qa)
# re: stop remove
re: down
	docker rmi nginx mariadb
	docker-compose -f ./srcs/docker-compose.yml up --build -d
# 	docker rmi $(docker i)

