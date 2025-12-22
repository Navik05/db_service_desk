-- Migration: create_it_new_table
-- Created: Пн 22 дек 2025 01:45:00 +07

BEGIN;
CREATE TABLE IF NOT EXISTS sd_core.it_new (
    id_new        BIGSERIAL PRIMARY KEY,
    name          TEXT,
    date_s        DATE,
    description   TEXT,
    id_service    BIGINT NOT NULL
);

-- Комментарии к таблице 
COMMENT ON TABLE sd_core.it_new IS 'Таблица для хранения новых записей';
COMMENT ON COLUMN sd_core.it_new.id_new IS 'Уникальный идентификатор записи';
COMMENT ON COLUMN sd_core.it_new.name IS 'Наименование';
COMMENT ON COLUMN sd_core.it_new.date_s IS 'Дата создания/начала';
COMMENT ON COLUMN sd_core.it_new.description IS 'Описание';
COMMENT ON COLUMN sd_core.it_new.id_service IS 'Идентификатор услуги';

-- Индексы
CREATE INDEX idx_it_new_id_service ON sd_core.it_new (id_service);
CREATE INDEX idx_it_new_date_s ON sd_core.it_new (date_s);

-- Права доступа
GRANT SELECT ON sd_core.it_new TO read_it;
GRANT INSERT, UPDATE, DELETE ON sd_core.it_new TO write_it;

COMMIT;