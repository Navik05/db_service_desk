-- Migration: create_it_service_type_table
-- Created: Пн 22 дек 2025 11:26:49 +07

BEGIN;
-- Создаем таблицу типов сервиса в схеме sd_core
CREATE TABLE IF NOT EXISTS sd_core.it_service_type (
    id_service_type    SERIAL PRIMARY KEY,
    name               TEXT,
    fullname           TEXT
);

-- Комментарии к таблице
COMMENT ON TABLE sd_core.it_service_type IS 'Справочник типов сервисов';
COMMENT ON COLUMN sd_core.it_service_type.id_service_type IS 'Уникальный идентификатор типа сервиса';
COMMENT ON COLUMN sd_core.it_service_type.name IS 'Краткое наименование типа';
COMMENT ON COLUMN sd_core.it_service_type.fullname IS 'Полное наименование типа';

-- Индексы для производительности
CREATE INDEX idx_service_type_name ON sd_core.it_service_type (name) WHERE name IS NOT NULL;
CREATE INDEX idx_service_type_fullname ON sd_core.it_service_type (fullname) WHERE fullname IS NOT NULL;

-- Права доступа
GRANT SELECT ON sd_core.it_service_type TO read_it;
GRANT INSERT, UPDATE, DELETE ON sd_core.it_service_type TO write_it;

INSERT INTO sd_core.it_service_type (name, fullname) VALUES
    ('Первый тип сервиса', 'Полный первый тип сервиса');
COMMIT;