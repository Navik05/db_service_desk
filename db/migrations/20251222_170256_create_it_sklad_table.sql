-- Migration: create_it_sklad_table
-- Created: Пн 22 дек 2025 17:02:56 +07

BEGIN;
-- Создаем таблицу в схеме sd_core
CREATE TABLE IF NOT EXISTS sd_core.it_sklad (
    id_sklad    SERIAL PRIMARY KEY,
    name        TEXT,
    id_podr     INTEGER NOT NULL
);

-- Комментарии к таблице и колонкам
COMMENT ON TABLE sd_core.it_sklad IS 'Склад из 1С УПП';
COMMENT ON COLUMN sd_core.it_sklad.id_sklad IS 'Уникальный идентификатор склада';
COMMENT ON COLUMN sd_core.it_sklad.name IS 'Наименование склада';
COMMENT ON COLUMN sd_core.it_sklad.id_podr IS 'Идентификатор подразделения-владельца';

-- Индексы для производительности
CREATE INDEX idx_sklad_name ON sd_core.it_sklad (name) WHERE name IS NOT NULL;
CREATE INDEX idx_sklad_podr ON sd_core.it_sklad (id_podr);

-- Права доступа отсутствуют

COMMIT;