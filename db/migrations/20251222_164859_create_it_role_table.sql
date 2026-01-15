-- Migration: create_it_role_table
-- Created: Пн 22 дек 2025 16:48:59 +07

BEGIN;
-- Создаем таблицу-справочник ролей пользователей в схеме sd_reference
CREATE TABLE IF NOT EXISTS sd_reference.it_role (
    id_role        SERIAL PRIMARY KEY,
    name           TEXT NOT NULL,
    description    TEXT,
    id_function    INTEGER NOT NULL,

    CONSTRAINT fk_role_function
        FOREIGN KEY (id_function)
        REFERENCES sd_reference.it_function (id_function)
);

-- Комментарии к таблице и колонкам
COMMENT ON TABLE sd_reference.it_role IS 'Справочник ролей пользователей';
COMMENT ON COLUMN sd_reference.it_role.id_role IS 'Уникальный идентификатор роли';
COMMENT ON COLUMN sd_reference.it_role.name IS 'Наименование роли';
COMMENT ON COLUMN sd_reference.it_role.description IS 'Описание роли';
COMMENT ON COLUMN sd_reference.it_role.id_function IS 'Идентификатор функции/группы ролей';

-- Индексы для производительности
CREATE INDEX idx_role_name ON sd_reference.it_role (name);
CREATE INDEX idx_role_function ON sd_reference.it_role (id_function);

-- Уникальность названия роли
CREATE UNIQUE INDEX uq_role_name ON sd_reference.it_role (name);

-- Права доступа
GRANT SELECT ON sd_reference.it_role TO read_it;
GRANT INSERT, UPDATE, DELETE ON sd_reference.it_scale TO write_it;

COMMIT;