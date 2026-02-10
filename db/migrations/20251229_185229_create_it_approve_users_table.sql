-- Migration: create_it_approve_users_table
-- Created: Пн 29 дек 2025 18:52:29 +07

BEGIN;
-- Создаем таблицу пользователей для согласования в схеме sd_core
CREATE TABLE IF NOT EXISTS sd_core.it_approve_users (
    id_approve_users         SERIAL PRIMARY KEY,
    id_approve               INTEGER NOT NULL,
    id_user                  INTEGER NOT NULL,
    user_role                SMALLINT CHECK (user_role >= 1 AND user_role <= 9),
    state                    SMALLINT DEFAULT 0 CHECK (state IN (0, 1, 2)),
    result_text              TEXT,
    id_approve_users_parent  INTEGER,
    date_plan                TIMESTAMPTZ,
    date_fact                TIMESTAMPTZ,
    task_text                TEXT
);

-- Комментарии к таблице
COMMENT ON TABLE sd_core.it_approve_users IS 'Пользователи для согласования';
COMMENT ON COLUMN sd_core.it_approve_users.id_approve_users IS 'Уникальный идентификатор записи пользователя согласования';
COMMENT ON COLUMN sd_core.it_approve_users.id_approve IS 'Идентификатор согласования';
COMMENT ON COLUMN sd_core.it_approve_users.id_user IS 'Идентификатор пользователя (согласующего)';
COMMENT ON COLUMN sd_core.it_approve_users.user_role IS 'Роль пользователя в согласовании (1-9)';
COMMENT ON COLUMN sd_core.it_approve_users.state IS 'Состояние: 0 - ожидает, 1 - согласовано, 2 - отклонено';
COMMENT ON COLUMN sd_core.it_approve_users.result_text IS 'Результат выполнения/согласования';
COMMENT ON COLUMN sd_core.it_approve_users.id_approve_users_parent IS 'Родительская задача согласования';
COMMENT ON COLUMN sd_core.it_approve_users.date_plan IS 'Срок согласования';
COMMENT ON COLUMN sd_core.it_approve_users.date_fact IS 'Фактическая дата согласования';
COMMENT ON COLUMN sd_core.it_approve_users.task_text IS 'Задача для выполнения/согласования';

-- Индексы для производительности
CREATE INDEX idx_approve_users_approve ON sd_core.it_approve_users (id_approve);
CREATE INDEX idx_approve_users_user ON sd_core.it_approve_users (id_user);
CREATE INDEX idx_approve_users_state ON sd_core.it_approve_users (state);
CREATE INDEX idx_approve_users_parent ON sd_core.it_approve_users (id_approve_users_parent) WHERE id_approve_users_parent IS NOT NULL;
CREATE INDEX idx_approve_users_date_plan ON sd_core.it_approve_users (date_plan) WHERE date_plan IS NOT NULL;
CREATE INDEX idx_approve_users_date_fact ON sd_core.it_approve_users (date_fact) WHERE date_fact IS NOT NULL;
CREATE INDEX idx_approve_users_user_role ON sd_core.it_approve_users (user_role) WHERE user_role IS NOT NULL;

-- Права доступа отсутствуют

COMMIT;