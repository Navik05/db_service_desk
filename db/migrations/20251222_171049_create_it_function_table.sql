-- Migration: create_it_function_table
-- Created: Пн 22 дек 2025 17:10:49 +07

BEGIN;
-- Создаем таблицу в схеме sd_reference
CREATE TABLE IF NOT EXISTS sd_reference.it_function (
    id_function    SERIAL PRIMARY KEY,
    name           TEXT NOT NULL,
    description    TEXT,
    id_service     INTEGER,
    acc_level      INTEGER CHECK (acc_level >= 1 AND acc_level <= 9)
);

-- Комментарии к таблице и колонкам
COMMENT ON TABLE sd_reference.it_function IS 'Справочник функций/прав доступа';
COMMENT ON COLUMN sd_reference.it_function.id_function IS 'Уникальный идентификатор функции';
COMMENT ON COLUMN sd_reference.it_function.name IS 'Наименование функции';
COMMENT ON COLUMN sd_reference.it_function.description IS 'Описание функции';
COMMENT ON COLUMN sd_reference.it_function.id_service IS 'Связанный сервис (если функция относится к конкретному сервису)';
COMMENT ON COLUMN sd_reference.it_function.acc_level IS 'Уровень доступа (1-9)';

-- Индексы для производительности
CREATE INDEX idx_function_name ON sd_reference.it_function (name);
CREATE INDEX idx_function_service ON sd_reference.it_function (id_service) WHERE id_service IS NOT NULL;
CREATE INDEX idx_function_acc_level ON sd_reference.it_function (acc_level) WHERE acc_level IS NOT NULL;

-- Права доступа
GRANT SELECT ON sd_reference.it_function TO read_it;
GRANT INSERT, UPDATE, DELETE ON sd_reference.it_scale TO write_it;

COMMIT;