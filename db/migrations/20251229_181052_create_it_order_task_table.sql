-- Migration: create_it_order_task_table
-- Created: Пн 29 дек 2025 18:10:52 +07

BEGIN;
-- Создаем таблицу задач по заявкам в схеме sd_core
CREATE TABLE IF NOT EXISTS sd_core.it_order_task (
    id_order_task          SERIAL PRIMARY KEY,
    id_order               INTEGER NOT NULL,
    id_order_task_parent   INTEGER,
    id_work                INTEGER,
    id_user_executor       INTEGER,
    date_f_plan            TIMESTAMP,
    date_f_fact            TIMESTAMP,
    description            TEXT,
    close_parent_check     BOOLEAN,
    id_task_state          INTEGER NOT NULL,
    date_c                 TIMESTAMP,
    id_user_creator        INTEGER NOT NULL,
    result_text            TEXT
);

-- Комментарии к таблице
COMMENT ON TABLE sd_core.it_order_task IS 'Задачи по заявкам';
COMMENT ON COLUMN sd_core.it_order_task.id_order_task IS 'Уникальный идентификатор задачи';
COMMENT ON COLUMN sd_core.it_order_task.id_order IS 'Идентификатор заявки';
COMMENT ON COLUMN sd_core.it_order_task.id_order_task_parent IS 'Родительская задача';
COMMENT ON COLUMN sd_core.it_order_task.id_work IS 'Ссылка на работу';
COMMENT ON COLUMN sd_core.it_order_task.id_user_executor IS 'Исполнитель задачи';
COMMENT ON COLUMN sd_core.it_order_task.date_f_plan IS 'Плановая дата завершения';
COMMENT ON COLUMN sd_core.it_order_task.date_f_fact IS 'Фактическая дата завершения';
COMMENT ON COLUMN sd_core.it_order_task.description IS 'Описание задачи';
COMMENT ON COLUMN sd_core.it_order_task.close_parent_check IS '1 - При закрытии задачи проверять всех детей родителя на предмет закрытия, если все закрыты то закрывать родителя; 0 - Такая проверка не проводится, предполагается ручное закрытие родительской задачи';
COMMENT ON COLUMN sd_core.it_order_task.id_task_state IS 'Состояние задачи';
COMMENT ON COLUMN sd_core.it_order_task.date_c IS 'Дата создания задачи';
COMMENT ON COLUMN sd_core.it_order_task.id_user_creator IS 'Создатель задачи';
COMMENT ON COLUMN sd_core.it_order_task.result_text IS 'Результат выполнения';

-- Внешние ключи
ALTER TABLE sd_core.it_order_task
ADD CONSTRAINT fk_order_task_parent
    FOREIGN KEY (id_order_task_parent)
    REFERENCES sd_core.it_order_task (id_order_task)
    ON DELETE CASCADE;

-- Индексы для производительности
CREATE INDEX idx_order_task_order ON sd_core.it_order_task (id_order);
CREATE INDEX idx_order_task_parent ON sd_core.it_order_task (id_order_task_parent) WHERE id_order_task_parent IS NOT NULL;
CREATE INDEX idx_order_task_work ON sd_core.it_order_task (id_work) WHERE id_work IS NOT NULL;
CREATE INDEX idx_order_task_executor ON sd_core.it_order_task (id_user_executor) WHERE id_user_executor IS NOT NULL;
CREATE INDEX idx_order_task_state ON sd_core.it_order_task (id_task_state);
CREATE INDEX idx_order_task_creator ON sd_core.it_order_task (id_user_creator);
CREATE INDEX idx_order_task_date_c ON sd_core.it_order_task (date_c) WHERE date_c IS NOT NULL;
CREATE INDEX idx_order_task_date_f_plan ON sd_core.it_order_task (date_f_plan) WHERE date_f_plan IS NOT NULL;
CREATE INDEX idx_order_task_date_f_fact ON sd_core.it_order_task (date_f_fact) WHERE date_f_fact IS NOT NULL;

-- Права доступа
GRANT SELECT ON sd_reference.it_function TO read_it;
GRANT INSERT, UPDATE, DELETE ON sd_reference.it_scale TO write_it;

COMMIT;