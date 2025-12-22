-- Migration: create_it_mailing_type_table
-- Created: Пн 22 дек 2025 17:06:48 +07

BEGIN;
-- Создаем таблицу-справочник типов рассылок в схеме sd_reference
CREATE TABLE IF NOT EXISTS sd_reference.it_mailing_type (
    id_mailing_type    SERIAL PRIMARY KEY,
    name               TEXT
);

-- Комментарии к таблице и колонкам
COMMENT ON TABLE sd_reference.it_mailing_type IS 'Справочник типов рассылок';
COMMENT ON COLUMN sd_reference.it_mailing_type.id_mailing_type IS 'Уникальный идентификатор типа рассылки';
COMMENT ON COLUMN sd_reference.it_mailing_type.name IS 'Наименование типа рассылки';

-- Индексы для производительности
CREATE INDEX idx_mailing_type_name ON sd_reference.it_mailing_type (name) WHERE name IS NOT NULL;

-- Права доступа
GRANT SELECT ON sd_reference.it_mailing_type TO read_it;
GRANT INSERT, UPDATE, DELETE ON sd_reference.it_scale TO write_it;

COMMIT;