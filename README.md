# Service Desk Database

База данных PostgreSQL 18 для приложения Service Desk

## Start

1. Скопировать файл среды:

# cp .env.example .env

2. если контейнеры уже запущены, выполнить полный сброс (удалить том с данными)
Это для того чтоб подтянулись миграции

# docker-compose down -v  
# docker-compose up -d


3. Запустите контейнеры

# docker-compose up -d

4. Можно проверить статус и проверить логи PostgreSQL

# docker-compose ps
# docker-compose logs postgres

5. Перейти в http://localhost:5050 и ввести логин и пароль для pgAdmin из файла .env

6. Теперь создаём миграции 002_add_пример.sql, 003_fix_пример.sql и тд.
Изменения в pgAdmin локальны
Миграции можно создавать через скрипты, но я пока не разбирался