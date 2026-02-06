-- Migration: create_it_scale_table
-- Created: Пн 22 дек 2025 12:40:37 +07

BEGIN;
-- Создаем таблицу-справочник масштабов в схеме sd_core
CREATE TABLE IF NOT EXISTS sd_core.it_scale (
    id_scale    SERIAL PRIMARY KEY,
    name        TEXT
);

-- Комментарии к таблице и колонкам
COMMENT ON TABLE sd_core.it_scale IS 'Справочник масштабов/охвата';
COMMENT ON COLUMN sd_core.it_scale.id_scale IS 'Уникальный идентификатор масштаба';
COMMENT ON COLUMN sd_core.it_scale.name IS 'Наименование масштаба';

-- Индексы для производительности
CREATE INDEX idx_scale_name ON sd_core.it_scale (name) WHERE name IS NOT NULL;

-- Уникальность названия
CREATE UNIQUE INDEX uq_scale_name ON sd_core.it_scale (name) WHERE name IS NOT NULL;

-- Права доступа
GRANT SELECT ON sd_core.it_scale TO read_it;
GRANT INSERT, UPDATE, DELETE ON sd_core.it_scale TO write_it;

COMMIT;