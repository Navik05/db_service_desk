-- Migration: create
-- Created: Вс 15 фев 2026 20:41:13 +07

BEGIN;
--Создаём таблицу-справочник статусов ИТ услуг
CREATE TABLE IF NOT EXISTS sd_core.it_catitem_state (
    id_catitem_state SERIAL PRIMARY KEY,
    name TEXT
);

-- Комментарии к таблице
COMMENT ON TABLE sd_core.it_catitem_state IS 'Справочник статусов ИТ услуг';
COMMENT ON COLUMN sd_core.it_catitem_state.id_catitem_state IS 'Уникальный идентификатор статуса ИТ услуги';
COMMENT ON COLUMN sd_core.it_catitem_state.name IS 'Наименование статуса';

-- Индексы для производительности
CREATE INDEX idx_catitem_state_name ON sd_core.it_catitem_state (name) WHERE name IS NOT NULL;

-- Права доступа
GRANT SELECT ON sd_core.it_catitem_state TO read_it;
GRANT INSERT, UPDATE, DELETE ON sd_core.it_catitem_state TO write_it;


COMMIT;