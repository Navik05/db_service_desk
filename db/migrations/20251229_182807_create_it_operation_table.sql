-- Migration: create_it_operation_table
-- Created: Пн 29 дек 2025 18:28:07 +07

BEGIN;
-- Создаем таблицу-спрвочник опираций в схеме sd_core
CREATE TABLE IF NOT EXISTS sd_core.it_operation (
    id_operation    SERIAL PRIMARY KEY,
    name            TEXT NOT NULL,
    description     TEXT,
    id_function     INTEGER NOT NULL
);

-- Комментарии к таблице
COMMENT ON TABLE sd_core.it_operation IS 'Справочник операций';
COMMENT ON COLUMN sd_core.it_operation.id_operation IS 'Уникальный идентификатор операции';
COMMENT ON COLUMN sd_core.it_operation.name IS 'Наименование операции';
COMMENT ON COLUMN sd_core.it_operation.description IS 'Описание операции';
COMMENT ON COLUMN sd_core.it_operation.id_function IS 'Идентификатор функции';

-- Индексы для производительности
CREATE INDEX idx_operation_name ON sd_core.it_operation (name);
CREATE INDEX idx_operation_function ON sd_core.it_operation (id_function);

-- Уникальность названия операции
CREATE UNIQUE INDEX uq_operation_name ON sd_core.it_operation (name);

-- Права доступа
GRANT SELECT ON sd_core.it_function TO read_it;
GRANT INSERT, UPDATE, DELETE ON sd_core.it_scale TO write_it;

COMMIT;