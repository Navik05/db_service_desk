-- Migration: create_it_order_state_table
-- Created: Пн 22 дек 2025 13:18:25 +07

BEGIN;
-- Создаем таблицу-справочник состояний заявки в схеме sd_reference
CREATE TABLE IF NOT EXISTS sd_reference.it_order_state (
    id_order_state    SERIAL PRIMARY KEY,
    name              TEXT
);

-- Комментарии к таблице и колонкам
COMMENT ON TABLE sd_reference.it_order_state IS 'Справочник состояний заявок';
COMMENT ON COLUMN sd_reference.it_order_state.id_order_state IS 'Уникальный идентификатор состояния';
COMMENT ON COLUMN sd_reference.it_order_state.name IS 'Наименование состояния';

-- Индексы для производительности
CREATE INDEX idx_order_state_name ON sd_reference.it_order_state (name) WHERE name IS NOT NULL;

-- Уникальность названия
CREATE UNIQUE INDEX uq_order_state_name ON sd_reference.it_order_state (name) WHERE name IS NOT NULL;

-- Права доступа
GRANT SELECT ON sd_reference.it_order_state TO read_it;
GRANT INSERT, UPDATE, DELETE ON sd_reference.it_scale TO write_it;

--Начальные данные
INSERT INTO sd_reference.it_order_state (name) VALUES
    ('Возобновлена'),
    ('В ожидании'),
    ('В работе'),
    ('Закрыта'),
    ('На контроле'),
    ('На подтверждении'),
    ('На рассмотрении'),
    ('На согласовании'),
    ('На утверждении'),
    ('Не согласовано'),
    ('Новая'),
    ('Отклонена'),
    ('Отменена инициатором'),
    ('Согласовано'),
    ('Согласование отклонено'),
    ('Согласование отменено'),
    ('Утверждено');
COMMIT;
