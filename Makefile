all:
# mkdir /home/hoigag/data/wordpress
# mkdir /home/hoigag/data/mariadb
	mkdir -p /home/hoigag/inception/data/wordpress
	mkdir -p /home/hoigag/inception/data/mariadb
	docker-compose -f ./srcs/docker-compose.yml up --build -d
down:
	sudo rm -rf /home/hoigag/inception/data/wordpress
	sudo rm -rf /home/hoigag/inception/data/mariadb
	docker-compose -f ./srcs/docker-compose.yml down
	docker volume rm $$(docker volume ls -q)
# sudo rm -rf /home/hoigag/data/wordpress
# sudo rm -rf /home/hoigag/data/mariadb
	
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

