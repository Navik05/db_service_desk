# Makefile для Service Desk Database
.PHONY: help up down logs psql reset-db reset-all backup

# Переменные
DB_USER = service_user
DB_NAME = service_desk
PGADMIN_PORT = 5050
ADMINER_PORT = 8080

help: ## Показать эту справку
	@echo "Доступные команды:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2}'

up: ## Запустить все сервисы
	docker-compose up -d
	@echo "✅ Сервисы запущены"
	@echo "pgAdmin: http://localhost:${PGADMIN_PORT}  👤 Логин: admin@service-desk.com  🔑 Пароль: 123qwe"
	@echo "Adminer: http://localhost:${ADMINER_PORT}"
	@echo "База данных: localhost:5431"

down: ## Остановить все сервисы
	docker-compose down
	@echo "✅ Сервисы остановлены"

logs: ## Показать логи в реальном времени
	docker-compose logs -f

psql: ## Подключиться к БД через psql
	docker-compose exec postgres psql -U $(DB_USER) -d $(DB_NAME)

reset-db: ## Сбросить только базу данных (сохранить pgAdmin)
	docker-compose down
	docker volume rm -f db_service_desk_postgres_data 2>/dev/null || true
	docker-compose up -d

	@echo "✅ База данных сброшена"
	@echo "ℹ️ pgAdmin сохранен (серверы остались)"
	@echo "pgAdmin: http://localhost:${PGADMIN_PORT}  👤 Логин: admin@service-desk.com  🔑 Пароль: 123qwe"

reset-all: ## Полный сброс (БД + pgAdmin)
	docker-compose down -v
	docker-compose up -d

	@echo "✅ Полный сброс выполнен"
	@echo "⚠️  Нужно заново добавить сервер в pgAdmin!"
	@echo "pgAdmin: http://localhost:${PGADMIN_PORT}  👤 Логин: admin@service-desk.com  🔑 Пароль: 123qwe"
	@echo "Регистрация сервера:\n 
	Имя - любое\n
	Имя/адресс сервера - postgres\n 
	Порт - 5432\n 
	Служебная база данных - service_desk\n 
	Имя пользователя - service_user\n
	Пароль - 123qwe"

backup: ## Создать бэкап базы данных
	mkdir -p backups
	docker-compose exec postgres pg_dump -U $(DB_USER) $(DB_NAME) > backups/backup_$$(date +%Y%m%d_%H%M%S).sql
	@echo "✅ Бэкап создан в папке backups/"

status: ## Показать статус контейнеров
	docker-compose ps

new-migration: ## Создать новую миграцию
	@read -p "Название миграции: " name; \
	timestamp=$$(date +%Y%m%d_%H%M%S); \
	file="db/migrations/$${timestamp}_$${name}.sql"; \
	echo "-- Migration: $$name" > $$file; \
	echo "-- Created: $$(date)" >> $$file; \
	echo "" >> $$file; \
	echo "BEGIN;" >> $$file; \
	echo "" >> $$file; \
	echo "/* Ваш SQL код здесь */" >> $$file; \
	echo "" >> $$file; \
	echo "COMMIT;" >> $$file; \
	echo "✅ Создана миграция: $$file"

test-connection: ## Проверить подключение к БД
	docker-compose exec postgres psql -U $(DB_USER) -d $(DB_NAME) -c "SELECT '✅ PostgreSQL работает!', version();"