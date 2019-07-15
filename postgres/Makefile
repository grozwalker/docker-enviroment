SHELL=/bin/bash -e

include docker.env
export $(shell sed 's/=.*//' docker.env)


ifndef COMPOSE_PROJECT_NAME
$(error The COMPOSE_PROJECT_NAME variable is missing.)
endif


fresh-install:
	@echo -e "Make: Installing fresh Laravel instance...\n"
	@make -s up
	@make -s install
	@make -s clear-folder
	@make -s env
	@make -s prepare-app
	@make -s prepare-db
	@make -s clean
	@echo "Laravel installation complete"

prepare-db: migrate db-seed

prepare-app: composer-install env key-generate init-hook


install:
	@echo -e "Make: Installing Laravel...\n"
	@docker exec -it "${COMPOSE_PROJECT_NAME}_app_1"  sh -c "composer create-project --prefer-dist laravel/laravel ./laravel"

clear-folder:
	@echo -e "Make: Clearing installation folder...\n"
	@docker exec -it "${COMPOSE_PROJECT_NAME}_app_1"  sh -c "mv ./laravel/* ./ && rm -rf ./laravel"

clean:
	@docker system prune --volumes --force

up:
	@echo -e "Make: Up containers.\n"
	@docker-compose -f docker-compose.yml -p $project_name up  -d --force-recreate

start:
	@docker-compose -f docker-compose.yml start

migrate:
	@echo -e "Make: Database migration.\n"
	@docker-compose -f docker-compose.yml -p $project_name run app php artisan migrate --force

db-seed:
	@echo -e "Make: Database seeding.\n"
	@docker-compose -f docker-compose.yml -p $project_name run app php artisan db:seed --force

db-fresh:
	@echo -e "Make: Fresh database.\n"
	@docker exec -it "${COMPOSE_PROJECT_NAME}_app_1" sh -c "php artisan migrate:fresh --seed --force"

logs:
	@docker-compose -f docker-compose.yml -p $project_name logs --follow

composer-install:
	@echo -e "Make: Installing composer dependencies.\n"
	@docker exec -it "${COMPOSE_PROJECT_NAME}_app_1" sh -c "composer install"

env:
	@echo -e "Make: Сopying env file.\n"
	@docker exec -it "${COMPOSE_PROJECT_NAME}_app_1"  sh -c "cp .env.docker.example .env"

key-generate:
	@echo -e "Make: Generate Laravel key.\n"
	@docker exec -it "${COMPOSE_PROJECT_NAME}_app_1" sh -c "php artisan key:generate"

helper-generate:
	@docker exec -it "${COMPOSE_PROJECT_NAME}_app_1" sh -c "php artisan ide-helper:eloquent && php artisan ide-helper:generate && php artisan ide-helper:meta && php artisan ide-helper:models"

bash:
	docker exec -it "${COMPOSE_PROJECT_NAME}_app_1" bash
