all: build run

build:
	docker build . -t nginx
run:
	docker run -d --name nginx nginx

kill:
	docker kill nginx

rm:
	docker rm -f nginx
	docker image rm -f nginx

in:
	docker exec -it nginx /bin/sh

# Rebuild: removes container and image, then rebuilds and runs
rebuild: rm build run

# Restart: stops and starts container without rebuilding
restart:
	docker stop nginx || true
	docker start nginx || true

logs:
	docker logs nginx
