-- Migration: create_it_service_state
-- Created: Sat Feb 14 15:38:32     2026
BEGIN;

CREATE TABLE IF NOT EXISTS sd_core.it_service_state (
    id_service_state SERIAL PRIMARY KEY,
    name TEXT
);

-- Комментарии к таблице
COMMENT ON TABLE sd_core.it_service_state IS 'Справочник статусов сервисов';
COMMENT ON COLUMN sd_core.it_service_state.id_service_state IS 'Уникальный идентификатор статуса сервиса';
COMMENT ON COLUMN sd_core.it_service_state.name IS 'Наименование статуса';

-- Индексы для производительности
CREATE INDEX idx_service_state_name ON sd_core.it_service_state (name) WHERE name IS NOT NULL;

-- Права доступа
GRANT SELECT ON sd_core.it_service_state TO read_it;
GRANT INSERT, UPDATE, DELETE ON sd_core.it_service_state TO write_it;


COMMIT;