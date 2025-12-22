-- Migration: create_it_effect_table
-- Created: Пн 22 дек 2025 12:34:53 +07

BEGIN;
-- Создаем таблицу-справочник эффектов в схеме sd_reference
CREATE TABLE IF NOT EXISTS sd_reference.it_effect (
    id_effect    SERIAL PRIMARY KEY,
    name         TEXT
);

-- Комментарии к таблице и колонкам
COMMENT ON TABLE sd_reference.it_effect IS 'Справочник эффектов/результативности';
COMMENT ON COLUMN sd_reference.it_effect.id_effect IS 'Уникальный идентификатор эффекта';
COMMENT ON COLUMN sd_reference.it_effect.name IS 'Наименование эффекта';

-- Индексы для производительности
CREATE INDEX idx_effect_name ON sd_reference.it_effect (name) WHERE name IS NOT NULL;

-- Уникальность названия
CREATE UNIQUE INDEX uq_effect_name ON sd_reference.it_effect (name) WHERE name IS NOT NULL;

-- Права доступа
GRANT SELECT ON sd_reference.it_effect TO read_it;
GRANT INSERT, UPDATE, DELETE ON sd_reference.it_effect TO write_it;

COMMIT;