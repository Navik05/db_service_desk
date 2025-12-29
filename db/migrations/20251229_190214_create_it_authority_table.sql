-- Migration: create_it_authority_table
-- Created: Пн 29 дек 2025 19:02:14 +07

BEGIN;
-- Создаем таблицу-справочник привилегий в схеме sd_reference
CREATE TABLE IF NOT EXISTS sd_reference.it_authority (
    id_authority    SERIAL PRIMARY KEY,
    authority       VARCHAR(256),
    description     TEXT
);

-- Комментарии к таблице
COMMENT ON TABLE sd_reference.it_authority IS 'Справочник привилегий (ролей) для разграничения доступа';
COMMENT ON COLUMN sd_reference.it_authority.id_authority IS 'Уникальный идентификатор привилегии';
COMMENT ON COLUMN sd_reference.it_authority.authority IS 'Имя привилегии';
COMMENT ON COLUMN sd_reference.it_authority.description IS 'Описание';

-- Индексы для производительности
CREATE INDEX idx_authority_name ON sd_reference.it_authority (authority) WHERE authority IS NOT NULL;

-- Уникальность имени привилегии
CREATE UNIQUE INDEX uq_authority_name ON sd_reference.it_authority (authority) WHERE authority IS NOT NULL;

-- Права доступа
GRANT SELECT ON sd_reference.it_function TO read_it;
GRANT INSERT, UPDATE, DELETE ON sd_reference.it_scale TO write_it;

COMMIT;