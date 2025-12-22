-- Migration: create_it_exp_type_table
-- Created: Пн 22 дек 2025 11:42:03 +07

BEGIN;
-- Создаем таблицу-справочник типов эксплуатации в схеме sd_reference
CREATE TABLE IF NOT EXISTS sd_reference.it_exp_type (
    id_exp_type    BIGSERIAL PRIMARY KEY,
    name           TEXT
);

-- Комментарии к таблице
COMMENT ON TABLE sd_reference.it_exp_type IS 'Справочник типов эксплуатации сервисов/ИС';
COMMENT ON COLUMN sd_reference.it_exp_type.id_exp_type IS 'Уникальный идентификатор типа эксплуатации';
COMMENT ON COLUMN sd_reference.it_exp_type.name IS 'Наименование типа эксплуатации';

-- Индексы для производительности
CREATE INDEX idx_exp_type_name ON sd_reference.it_exp_type (name) WHERE name IS NOT NULL;

-- Уникальность названия
CREATE UNIQUE INDEX uq_exp_type_name ON sd_reference.it_exp_type (name) WHERE name IS NOT NULL;

-- Права доступа
GRANT SELECT ON sd_reference.it_exp_type TO read_it;
GRANT INSERT, UPDATE, DELETE ON sd_reference.it_exp_type TO write_it;

COMMIT;