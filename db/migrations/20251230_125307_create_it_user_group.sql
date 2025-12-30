-- Migration: create_it_user_group
-- Created: Tue, Dec 30, 2025 12:53:07 PM

BEGIN;

-- Создание таблицы
CREATE TABLE IF NOT EXISTS sd_core.it_user_group (
    id_user_group BIGINT NOT NULL,
    id_group      BIGINT NOT NULL,
    id_user       BIGINT NOT NULL
);

-- Рекомендуется сразу добавить первичный ключ
ALTER TABLE it_user_group
ADD CONSTRAINT pk_it_user_group PRIMARY KEY (id_user_group);

COMMIT;
