-- Migration: it_work_type_table
-- Created: Пн 22 дек 2025 12:14:51 +07

BEGIN;
-- Создаем таблицу-справочник типов работ в схеме sd_reference
CREATE TABLE IF NOT EXISTS sd_reference.it_work_type (
    id_work_type    SERIAL PRIMARY KEY,
    name            TEXT,
    description     TEXT
);

-- Комментарии к таблице
COMMENT ON TABLE sd_reference.it_work_type IS 'Справочник типов работ';
COMMENT ON COLUMN sd_reference.it_work_type.id_work_type IS 'Уникальный идентификатор типа работы';
COMMENT ON COLUMN sd_reference.it_work_type.name IS 'Наименование типа работы';
COMMENT ON COLUMN sd_reference.it_work_type.description IS 'Описание типа работы';

-- Индексы для производительности
CREATE INDEX idx_work_type_name ON sd_reference.it_work_type (name) WHERE name IS NOT NULL;

-- Уникальность названия
CREATE UNIQUE INDEX uq_work_type_name ON sd_reference.it_work_type (name) WHERE name IS NOT NULL;

-- Права доступа
GRANT SELECT ON sd_reference.it_work_type TO read_it;
GRANT INSERT, UPDATE, DELETE ON sd_reference.it_work_type TO write_it;

COMMIT;