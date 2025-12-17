# Сброс базы данных

echo "⚠️  ПРЕДУПРЕЖДЕНИЕ: Это приведет к сбросу базы данных"
read -p "Вы уверены? (y/N): " -n 1 -r
echo

if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "Остановка контейнеров..."
    docker-compose down
    
    echo "Удаление томов..."
    docker volume rm -f db_service_desk_postgres_data 2>/dev/null || true
    docker volume rm -f db_service_desk_pgadmin_data 2>/dev/null || true
    
    echo "Начинаю все сначала..."
    docker-compose up -d
    
    echo "✅ Сброс базы данных завершен"
else
    echo "❌ Операция отменена"
fi