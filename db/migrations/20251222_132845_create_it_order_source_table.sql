-- Migration: create_it_order_source_table
-- Created: Пн 22 дек 2025 13:28:45 +07

BEGIN;
-- Создаем таблицу-справочник источников заявок в схеме sd_core
CREATE TABLE IF NOT EXISTS sd_core.it_order_source (
    id_order_source    SERIAL PRIMARY KEY,
    name               TEXT
);

-- Комментарии к таблице и колонкам
COMMENT ON TABLE sd_core.it_order_source IS 'Справочник источников заявок';
COMMENT ON COLUMN sd_core.it_order_source.id_order_source IS 'Уникальный идентификатор источника';
COMMENT ON COLUMN sd_core.it_order_source.name IS 'Наименование источника';

-- Индексы для производительности
CREATE INDEX idx_order_source_name ON sd_core.it_order_source (name) WHERE name IS NOT NULL;

-- Уникальность названия
CREATE UNIQUE INDEX uq_order_source_name ON sd_core.it_order_source (name) WHERE name IS NOT NULL;

-- Права доступа отсутствуют

INSERT INTO sd_core.it_order_source (name) VALUES
    ('Первый источник');
COMMIT;