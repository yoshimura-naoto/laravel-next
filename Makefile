# Docker
up:
	docker-compose up -d

build:
	docker-compose build

build-no-cache:
	docker-compose build --no-cache

down:
	docker-compose down

plune:
	docker system prune -a --volumes

# コンテナ
.PHONY: client
client:
	docker-compose exec client /bin/bash

app:
	docker-compose exec app /bin/bash

mysql:
	docker-compose exec mysql /bin/bash

# app操作
composer-install:
	docker-compose exec app composer install

yarn-ci-client:
	docker-compose exec app yarn install --immutable --immutable-cache --check-cache

yarn-ci-app:
	docker-compose exec app yarn install --immutable --immutable-cache --check-cache

migrate:
	docker-compose exec app php artisan migrate

migrate-test:
	docker-compose exec -e DB_DATABASE=laravel-next-test app php artisan migrate

test:
	docker-compose exec app php artisan test

key-generate:
	docker-compose run --rm app php artisan key:generate

# その他
copy-env:
	cp ./server/.env.example ./server/.env

open-next:
	open -a "Google Chrome" http://localhost:3000

open-laravel:
	open -a "Google Chrome" http://localhost

# 初期化
init:
	@make copy-env
	@make up
	@make yarn-ci-client
	@make yarn-ci-app
	@make composer-install
	@make key-generate
	@make migrate
