# Service Desk Database

База данных PostgreSQL 18 для приложения Service Desk

## Управление проектом

Все команды выполняются через Makefile:

```bash
# Показать все команды
make help

# Полный список команд в Makefile
make up              # запустить проект
make down            # остановить проект  
make reset-db        # сбросить БД (после изменений миграций)
make reset-all       # Полный сброс (БД + pgAdmin)
make psql            # подключиться к консоли БД
make logs            # посмотреть логи
make backup          # Создать бэкап базы данных
make new-migration   # Создать новую миграцию
make test-connection # Проверить подключение к БД
make status          # Показать статус контейнеров