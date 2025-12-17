# Скрипт для создания новой миграции

if [ -z "$1" ]; then
    echo "Использование: $0 <migration_name>"
    exit 1
fi

MIGRATION_NAME=$(echo "$1" | tr ' ' '_' | tr '[:upper:]' '[:lower:]')
MIGRATION_FILE="db/migrations/$(date +%Y%m%d%H%M%S)_${MIGRATION_NAME}.sql"

cat > "$MIGRATION_FILE" << EOF
-- Migration: $(date +"%Y-%m-%d %H:%M:%S")
-- Description: $1

BEGIN;

-- Your SQL here

COMMIT;
EOF

echo "Созданная миграция: $MIGRATION_FILE"