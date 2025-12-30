-- Migration: create_it_user_group
-- Created: Tue, Dec 30, 2025 12:53:07 PM

BEGIN;

-- Создание таблицы
CREATE TABLE IF NOT EXISTS sd_core.it_user_group (
    id_user_group SERIAL PRIMARY KEY,
    id_group      INTEGER NOT NULL,
    id_user       INTEGER NOT NULL,

    CONSTRAINT fk_user_group_group
        FOREIGN KEY (id_group)
        REFERENCES sd_core.it_group (id_group),

    CONSTRAINT fk_user_group_user
        FOREIGN KEY (id_user)
        REFERENCES sd_core.it_user (id_it_user)
);
COMMIT;
