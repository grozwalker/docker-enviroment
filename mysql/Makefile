SHELL=/bin/bash -e

prepare-db: migrate seed

prepare-app: composer-install env key-generate


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
