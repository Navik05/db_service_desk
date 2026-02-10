-- Migration: create_it_order_binding_table
-- Created: Пн 29 дек 2025 18:25:14 +07

BEGIN;
-- Создаем таблицу в схеме sd_core
CREATE TABLE IF NOT EXISTS sd_core.it_order_binding (
    id_order_binding    SERIAL PRIMARY KEY,
    path                TEXT,
    id_order            INTEGER,
    d_c                 TIMESTAMPTZ,
    id_user             INTEGER NOT NULL,
    name                TEXT
);

-- Комментарии к таблице
COMMENT ON TABLE sd_core.it_order_binding IS 'Вложения (прикрепленные файлы к заявкам)';
COMMENT ON COLUMN sd_core.it_order_binding.id_order_binding IS 'Уникальный идентификатор вложения';
COMMENT ON COLUMN sd_core.it_order_binding.path IS 'Путь к файлу в файловой системе';
COMMENT ON COLUMN sd_core.it_order_binding.id_order IS 'Идентификатор заявки';
COMMENT ON COLUMN sd_core.it_order_binding.d_c IS 'Дата добавления вложения';
COMMENT ON COLUMN sd_core.it_order_binding.id_user IS 'Идентификатор пользователя';
COMMENT ON COLUMN sd_core.it_order_binding.name IS 'Имя файла';

-- Индексы для производительности
CREATE INDEX idx_order_binding_order ON sd_core.it_order_binding (id_order) WHERE id_order IS NOT NULL;
CREATE INDEX idx_order_binding_user ON sd_core.it_order_binding (id_user);
CREATE INDEX idx_order_binding_date ON sd_core.it_order_binding (d_c) WHERE d_c IS NOT NULL;
CREATE INDEX idx_order_binding_name ON sd_core.it_order_binding (name) WHERE name IS NOT NULL;
CREATE INDEX idx_order_binding_path ON sd_core.it_order_binding (path) WHERE path IS NOT NULL;

-- Права доступа отсутствуют

COMMIT;