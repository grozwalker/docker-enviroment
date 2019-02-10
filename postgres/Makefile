SHELL=/bin/bash -e

fresh-install: install clear-folder

prepare-db: migrate seed

prepare-app: composer-install env key-generate

install:
	@docker exec -it project-name_app_1  sh -c "composer create-project --prefer-dist laravel/laravel ./laravel"

clear-folder:
	@docker exec -it project-name_app_1  sh -c "mv ./laravel/* ./ && rm -rf ./laravel"

up:
	@docker-compose -f docker-compose.yml -p project-name up -d --force-recreate

start:
	@docker-compose -f docker-compose.yml start

migrate:
	@docker-compose -f docker-compose.yml -p project-name run app php artisan migrate --force

seed:
	@docker-compose -f docker-compose.yml -p project-name run app php artisan db:seed --force

logs:
	@docker-compose -f docker-compose.yml -p project-name logs --follow

down:
	@docker-compose -f docker-compose.yml -p project-name down

stop:
	@docker-compose -f docker-compose.yml -p project-name stop

rm: stop
	@docker-compose -f docker-compose.yml -p project-name rm --force

ps:
	@docker-compose -f docker-compose.yml -p project-name ps

composer-install:
	@docker exec -it project-name_app_1 sh -c "composer install"

env:
	@docker exec -it project-name_app_1  sh -c "cp .env.docker.example .env"

key-generate:
	@docker exec -it project-name_app_1 sh -c "php artisan key:generate"

bash:
	docker exec -it project-name_app_1 bash
