-- Migration: create_it_task_state_table
-- Created: Пн 29 дек 2025 18:01:22 +07

BEGIN;
-- Создаем таблицу-справочник состояний задач в схеме sd_core
CREATE TABLE IF NOT EXISTS sd_core.it_task_state (
    id_task_state    SERIAL PRIMARY KEY,
    name             VARCHAR(256)
);

-- Комментарии к таблице
COMMENT ON TABLE sd_core.it_task_state IS 'Справочник состояний задач';
COMMENT ON COLUMN sd_core.it_task_state.id_task_state IS 'Уникальный идентификатор состояния задачи';
COMMENT ON COLUMN sd_core.it_task_state.name IS 'Наименование состояния задачи';

-- Индексы для производительности
CREATE INDEX idx_task_state_name ON sd_core.it_task_state (name) WHERE name IS NOT NULL;

-- Права доступа отсутствуют

COMMIT;