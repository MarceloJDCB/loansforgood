build:
	docker-compose up -d --build --remove-orphans

build-no-cache:
	docker-compose build --no-cache

up:
	docker-compose up --remove-orphans

stop:
	docker-compose stop 

down:
	docker-compose down --remove-orphans

npm_install:
	npm install

init : npm_install build up
