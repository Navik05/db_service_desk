-- Migration: create_it_approve_table
-- Created: Пн 29 дек 2025 18:44:54 +07

BEGIN;
-- Создаем таблицу согласования заявок в схеме sd_core
CREATE TABLE IF NOT EXISTS sd_core.it_approve (
    id_approve         SERIAL PRIMARY KEY,
    id_order           INTEGER,
    name               TEXT,
    id_user_creator    INTEGER,
    flag_approved      BOOLEAN DEFAULT FALSE,
    date_c             DATE DEFAULT CURRENT_DATE,
    date_plan          DATE,
    state              SMALLINT DEFAULT 0,
    date_fact          DATE,
    task_text          TEXT,

    CONSTRAINT fk_approve_order
        FOREIGN KEY (id_order)
        REFERENCES sd_core.it_order (id_order),
    
    CONSTRAINT fk_approve_user_creator
        FOREIGN KEY (id_user_creator)
        REFERENCES it_core.it_user (id_it_user)
);

-- Комментарии к таблице
COMMENT ON TABLE sd_core.it_approve IS 'Таблица согласований заявок';
COMMENT ON COLUMN sd_core.it_approve.id_approve IS 'Уникальный идентификатор согласования';
COMMENT ON COLUMN sd_core.it_approve.id_order IS 'Идентификатор заявки';
COMMENT ON COLUMN sd_core.it_approve.name IS 'Наименование/тема согласования';
COMMENT ON COLUMN sd_core.it_approve.id_user_creator IS 'Создатель согласования';
COMMENT ON COLUMN sd_core.it_approve.flag_approved IS 'Флаг согласования (0 - не согласовано, 1 - согласовано)';
COMMENT ON COLUMN sd_core.it_approve.date_c IS 'Дата создания согласования';
COMMENT ON COLUMN sd_core.it_approve.date_plan IS 'Срок согласования';
COMMENT ON COLUMN sd_core.it_approve.state IS 'Состояние согласования';
COMMENT ON COLUMN sd_core.it_approve.date_fact IS 'Фактическая дата согласования';
COMMENT ON COLUMN sd_core.it_approve.task_text IS 'Текст задачи/комментарий';

-- Индексы для производительности
CREATE INDEX idx_approve_order ON sd_core.it_approve (id_order) WHERE id_order IS NOT NULL;
CREATE INDEX idx_approve_creator ON sd_core.it_approve (id_user_creator) WHERE id_user_creator IS NOT NULL;
CREATE INDEX idx_approve_flag_approved ON sd_core.it_approve (flag_approved);
CREATE INDEX idx_approve_date_c ON sd_core.it_approve (date_c);
CREATE INDEX idx_approve_date_plan ON sd_core.it_approve (date_plan) WHERE date_plan IS NOT NULL;
CREATE INDEX idx_approve_date_fact ON sd_core.it_approve (date_fact) WHERE date_fact IS NOT NULL;
CREATE INDEX idx_approve_state ON sd_core.it_approve (state);

-- Права доступа будут отсутствуют

COMMIT;