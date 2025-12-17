# Применить миграцию базы данных

set -e

echo "🔧 Применение миграции базы данных..."

if [ -f .env ]; then
    export $(cat .env | grep -v '^#' | xargs)
fi

DB_HOST=${DB_HOST:-localhost}
DB_PORT=${DB_PORT:-5432}
DB_NAME=${DB_NAME:-service_desk}
DB_USER=${DB_USER:-service_user}

echo "База данных: $DB_NAME@$DB_HOST:$DB_PORT"

for migration in $(ls db/migrations/*.sql | sort); do
    echo "Обратившийся: $(basename $migration)"
    PGPASSWORD=$DB_PASSWORD psql -h $DB_HOST -p $DB_PORT -U $DB_USER -d $DB_NAME -f "$migration"
done

echo "✅ Все миграции были успешно выполнены"