NAME=inception

VOLUME="/home/hoigag/data"

all:
	@echo "setting up the infrastructure"
	@mkdir -p $(VOLUME)/wordpress
	@mkdir -p $(VOLUME)/mariadb
	@docker-compose -p $(NAME) -f ./srcs/docker-compose.yml up --build -d

clean:
	@echo "shutting down and deleting containers"
	@docker-compose -p $(NAME) -f ./srcs/docker-compose.yml down

fclean: clean
	@echo "cleaning everything"
	@docker volume rm -f $$(docker volume ls -q)
	@docker rmi -f $$(docker images -qa)
	@sudo rm -rf $(VOLUME)/wordpress
	@sudo rm -rf $(VOLUME)/mariadb

re: fclean all

.PHONY: all clean fclean re