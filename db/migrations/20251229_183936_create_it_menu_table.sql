-- Migration: create_it_menu_table
-- Created: Пн 29 дек 2025 18:39:36 +07

BEGIN;
-- Создаем таблицу-справочник пунктов меню в схеме sd_reference
CREATE TABLE IF NOT EXISTS sd_reference.it_menu (
    id_menu        SERIAL PRIMARY KEY,
    name           VARCHAR(256),
    description    TEXT,
    acc_level      SMALLINT CHECK (acc_level >= 1 AND acc_level <= 9),
    id_function    INTEGER NOT NULL
);

-- Комментарии к таблице
COMMENT ON TABLE sd_reference.it_menu IS 'Справочник пунктов меню системы';
COMMENT ON COLUMN sd_reference.it_menu.id_menu IS 'Уникальный идентификатор пункта меню';
COMMENT ON COLUMN sd_reference.it_menu.name IS 'Наименование пункта меню';
COMMENT ON COLUMN sd_reference.it_menu.description IS 'Описание пункта меню';
COMMENT ON COLUMN sd_reference.it_menu.acc_level IS 'Уровень доступа (1-9)';
COMMENT ON COLUMN sd_reference.it_menu.id_function IS 'Идентификатор функции для проверки прав доступа';

-- Индексы для производительности
CREATE INDEX idx_menu_name ON sd_reference.it_menu (name) WHERE name IS NOT NULL;
CREATE INDEX idx_menu_function ON sd_reference.it_menu (id_function);
CREATE INDEX idx_menu_acc_level ON sd_reference.it_menu (acc_level) WHERE acc_level IS NOT NULL;

-- Права доступа
GRANT SELECT ON sd_reference.it_function TO read_it;
GRANT INSERT, UPDATE, DELETE ON sd_reference.it_scale TO write_it;

COMMIT;