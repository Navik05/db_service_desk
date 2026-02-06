-- Migration: create_it_user_role_table
-- Created: Пн 29 дек 2025 18:32:32 +07

BEGIN;
-- Создаем таблицу-справочник ролей пользователей в схеме sd_core
CREATE TABLE IF NOT EXISTS sd_core.it_user_role (
    id_user_role    SERIAL PRIMARY KEY,
    name            VARCHAR(256)
);

-- Комментарии к таблице
COMMENT ON TABLE sd_core.it_user_role IS 'Справочник ролей пользователей (для групп поддержки)';
COMMENT ON COLUMN sd_core.it_user_role.id_user_role IS 'Уникальный идентификатор роли пользователя';
COMMENT ON COLUMN sd_core.it_user_role.name IS 'Наименование роли';

-- Индексы для производительности
CREATE INDEX idx_user_role_name ON sd_core.it_user_role (name) WHERE name IS NOT NULL;

-- Права доступа отсутствуют

COMMIT;