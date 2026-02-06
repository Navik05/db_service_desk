-- Migration: create_it_order_type_table
-- Created: Пн 22 дек 2025 13:09:02 +07

BEGIN;
-- Создаем таблицу-справочник типов заявок в схеме sd_core
CREATE TABLE IF NOT EXISTS sd_core.it_order_type (
    id_order_type    SERIAL PRIMARY KEY,
    name             TEXT,
    available        BOOLEAN DEFAULT FALSE
);

-- Комментарии к таблице
COMMENT ON TABLE sd_core.it_order_type IS 'Справочник типов заявок';
COMMENT ON COLUMN sd_core.it_order_type.id_order_type IS 'Уникальный идентификатор типа заявки';
COMMENT ON COLUMN sd_core.it_order_type.name IS 'Наименование типа заявки';
COMMENT ON COLUMN sd_core.it_order_type.available IS 'Доступность типа (true - доступен, false - не доступен)';

-- Индексы для производительности
CREATE INDEX idx_order_type_name ON sd_core.it_order_type (name) WHERE name IS NOT NULL;
CREATE INDEX idx_order_type_available ON sd_core.it_order_type (available);

-- Уникальность названия
CREATE UNIQUE INDEX uq_order_type_name ON sd_core.it_order_type (name) WHERE name IS NOT NULL;

-- Права доступа отсутствуют

--Начальные данные
INSERT INTO sd_core.it_order_type (name, available) VALUES
    ('ЗНД', true),
    ('ЗНИ', true),
    ('ЗНО', true);

COMMIT;