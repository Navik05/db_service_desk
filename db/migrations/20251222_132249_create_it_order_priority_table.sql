-- Migration: create_it_order_priority_table
-- Created: Пн 22 дек 2025 13:22:49 +07

BEGIN;
-- Создаем таблицу приоритета заявок в схеме sd_core
CREATE TABLE IF NOT EXISTS sd_core.it_order_priority (
    id_order_priority    SERIAL PRIMARY KEY,
    name                 TEXT,
    color                VARCHAR(8)
);

-- Комментарии к таблице и колонкам
COMMENT ON TABLE sd_core.it_order_priority IS 'Приоритеты заявок';
COMMENT ON COLUMN sd_core.it_order_priority.id_order_priority IS 'Уникальный идентификатор приоритета';
COMMENT ON COLUMN sd_core.it_order_priority.name IS 'Наименование';
COMMENT ON COLUMN sd_core.it_order_priority.color IS 'Цвет для отображения приоритета';

-- Индексы для производительности
CREATE INDEX idx_order_priority_name ON sd_core.it_order_priority (name) WHERE name IS NOT NULL;

-- Уникальность названия
CREATE UNIQUE INDEX uq_order_priority_name ON sd_core.it_order_priority (name) WHERE name IS NOT NULL;

-- Права доступа отсутствуют

--Начальные данные
INSERT INTO sd_core.it_order_priority (name, color) VALUES
    ('Низкий', 'green'),
    ('Средний', 'yellow'),
    ('Высокий', 'orange'),
    ('Критичный', 'red');

COMMIT;