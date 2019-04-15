SHELL=/bin/bash -e

#VARIABLES#
project_name=""



fresh-install: install clear-folder

prepare-db: migrate seed

prepare-app: composer-install env key-generate

build-front: npm-i build-grunt copy-front

build-front-fast: npm-i build-grunt copy-front

install:
	@docker exec -it "${project_name}_app_1"  sh -c "composer create-project --prefer-dist laravel/laravel ./laravel"

clear-folder:
	@docker exec -it "${project_name}_app_1"  sh -c "mv ./laravel/* ./ && rm -rf ./laravel"

up:
	@docker-compose -f docker-compose.yml -p $project_name up -d --force-recreate

start:
	@docker-compose -f docker-compose.yml start

migrate:
	@docker-compose -f docker-compose.yml -p $project_name run app php artisan migrate --force

seed:
	@docker-compose -f docker-compose.yml -p $project_name run app php artisan db:seed --force

logs:
	@docker-compose -f docker-compose.yml -p $project_name logs --follow

down:
	@docker-compose -f docker-compose.yml -p $project_name down

stop:
	@docker-compose -f docker-compose.yml -p $project_name stop

rm: stop
	@docker-compose -f docker-compose.yml -p $project_name rm --force

ps:
	@docker-compose -f docker-compose.yml -p $project_name ps

composer-install:
	@docker exec -it "${project_name}_app_1" sh -c "composer install"

env:
	@docker exec -it "${project_name}_app_1"  sh -c "cp .env.docker.example .env"

key-generate:
	@docker exec -it "${project_name}_app_1" sh -c "php artisan key:generate"

db-fresh:
	@docker exec -it "${project_name}_app_1" sh -c "php artisan migrate:fresh --seed --force"

npm-i:
	@docker exec -it "${project_name}_node_1" sh -c "npm i"

build-grunt:
	@docker exec -it "${project_name}_node_1" sh -c "grunt build-fast"

copy-front:
	@cp -r ./markup/build/res ./php/public

bash:
	docker exec -it "${project_name}_app_1" bash
