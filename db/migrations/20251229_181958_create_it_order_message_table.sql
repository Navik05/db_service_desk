-- Migration: create_it_order_message_table
-- Created: Пн 29 дек 2025 18:19:58 +07

BEGIN;
-- Создаем таблицу обсуждений в схеме sd_core
CREATE TABLE IF NOT EXISTS sd_core.it_order_message (
    id_order_message    SERIAL PRIMARY KEY,
    d_c                 TIMESTAMPTZ,
    text                TEXT,
    id_order            INTEGER NOT NULL,
    id_user             INTEGER NOT NULL,
    id_order_task       INTEGER
);

-- Комментарии к таблице
COMMENT ON TABLE sd_core.it_order_message IS 'Обсуждения (сообщения к заявкам)';
COMMENT ON COLUMN sd_core.it_order_message.id_order_message IS 'Уникальный идентификатор сообщения';
COMMENT ON COLUMN sd_core.it_order_message.d_c IS 'Дата создания сообщения';
COMMENT ON COLUMN sd_core.it_order_message.text IS 'Текст сообщения';
COMMENT ON COLUMN sd_core.it_order_message.id_order IS 'Идентификатор заявки';
COMMENT ON COLUMN sd_core.it_order_message.id_user IS 'Идентификатор пользователя (автор сообщения)';
COMMENT ON COLUMN sd_core.it_order_message.id_order_task IS 'Ссылка на задачу';

-- Индексы для производительности
CREATE INDEX idx_order_message_order ON sd_core.it_order_message (id_order);
CREATE INDEX idx_order_message_user ON sd_core.it_order_message (id_user);
CREATE INDEX idx_order_message_task ON sd_core.it_order_message (id_order_task) WHERE id_order_task IS NOT NULL;
CREATE INDEX idx_order_message_date ON sd_core.it_order_message (d_c) WHERE d_c IS NOT NULL;

-- Права доступа отсутствуют

COMMIT;