
all: volumes build up

build:
	docker-compose -f ./srcs/docker-compose.yml build

up:
	docker-compose -f ./srcs/docker-compose.yml up -d

down:
	docker-compose -f ./srcs/docker-compose.yml down -v

start:
	docker-compose -f ./srcs/docker-compose.yml start

stop:
	docker-compose -f ./srcs/docker-compose.yml stop

logs:
	docker-compose -f ./srcs/docker-compose.yml logs

clean: stop down cleanvolumes
	@read -p "Are you sure you want to remove all images? (y/N): " confirm; \
	if [ "$$confirm" = "y" ]; then \
		echo "Removing all images..."; \
		docker rmi --force nginx wordpress mariadb; \
		echo "images removed."; \
	else \
		echo "Operation canceled."; \
	fi

fclean: clean
	@read -p "Are you sure you want to remove all docker contents? (y/N): " confirm; \
	if [ "$$confirm" = "y" ]; then \
		echo "Removing all data..."; \
		docker system prune --all --force; \
		docker volume rm $(docker volume ls -q); \
		echo "all docker data removed."; \
	else \
		echo "Operation canceled."; \
	fi


cleanvolumes:
	@read -p "Are you sure you want to remove all current directoires of volumes? (y/N): " confirm; \
	if [ "$$confirm" = "y" ]; then \
		echo "Removing all volumes"; \
		rm -rf /home/suibrahi/data/db-data; \
		rm -rf /home/suibrahi/data/www-data; \
		echo "Volumes removed."; \
	else \
		echo "Operation canceled."; \
	fi

freshvolumes:
	rm -rf /home/suibrahi/data/db-data/*
	rm -rf /home/suibrahi/data/www-data/*

volumes:
	mkdir -p /home/suibrahi/data/db-data
	mkdir -p /home/suibrahi/data/www-data