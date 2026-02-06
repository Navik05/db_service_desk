-- Migration: it_fact_location_table
-- Created: Пн 22 дек 2025 17:16:15 +07

BEGIN;
-- Создаем таблицу фактического местоположения в схеме sd_core
CREATE TABLE IF NOT EXISTS sd_core.it_fact_location (
    id_fact_location    SERIAL PRIMARY KEY,
    name                TEXT
);

-- Комментарии к таблице и колонкам
COMMENT ON TABLE sd_core.it_fact_location IS 'Фактическое местоположение';
COMMENT ON COLUMN sd_core.it_fact_location.id_fact_location IS 'Уникальный идентификатор местоположения';
COMMENT ON COLUMN sd_core.it_fact_location.name IS 'Наименование местоположения';

-- Индексы для производительности
CREATE INDEX idx_fact_location_name ON sd_core.it_fact_location (name) WHERE name IS NOT NULL;

-- Права доступа отсутствуют

COMMIT;