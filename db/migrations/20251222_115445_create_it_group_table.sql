-- Migration: create_it_group_table
-- Created: Пн 22 дек 2025 11:54:45 +07

BEGIN;
-- Создаем таблицу групп поддержки в схеме sd_core
CREATE TABLE IF NOT EXISTS sd_core.it_group (
    id_group         BIGSERIAL PRIMARY KEY,
    id_user          BIGINT,
    name             TEXT,
    name_1c_doc      TEXT,
    description      TEXT
);

-- Комментарии к таблице и колонкам
COMMENT ON TABLE sd_core.it_group IS 'Группа поддержки';
COMMENT ON COLUMN sd_core.it_group.id_group IS 'Уникальный идентификатор группы';
COMMENT ON COLUMN sd_core.it_group.id_user IS 'Дежурный группы, либо руководитель группы (штаба)';
COMMENT ON COLUMN sd_core.it_group.name IS 'Наименование группы';
COMMENT ON COLUMN sd_core.it_group.name_1c_doc IS 'Наименование роли в 1С Документооборот';
COMMENT ON COLUMN sd_core.it_group.description IS 'Описание группы';

-- Индексы для производительности
CREATE INDEX idx_group_name ON sd_core.it_group (name) WHERE name IS NOT NULL;
CREATE INDEX idx_group_id_user ON sd_core.it_group (id_user) WHERE id_user IS NOT NULL;
CREATE INDEX idx_group_name_1c_doc ON sd_core.it_group (name_1c_doc) WHERE name_1c_doc IS NOT NULL;

-- Права доступа
GRANT SELECT ON sd_core.it_group TO read_it;
GRANT INSERT, UPDATE, DELETE ON sd_core.it_group TO write_it;

COMMIT;