-- Migration: create_it_user_authority
-- Created: Tue, Dec 30, 2025 12:51:26 PM

BEGIN;

-- Создание таблицы
CREATE TABLE IF NOT EXISTS sd_core.it_user_authority (
    id_user_authority BIGINT NOT NULL,
    id_user           BIGINT NOT NULL,
    id_authority      BIGINT NOT NULL
);

-- Рекомендуется сразу добавить первичный ключ
ALTER TABLE it_user_authority
ADD CONSTRAINT pk_it_user_authority PRIMARY KEY (id_user_authority);

-- Права доступа
GRANT SELECT ON TABLE it_user_authority TO read_it;
GRANT INSERT, UPDATE, DELETE ON TABLE it_user_authority TO write_it;

COMMENT ON TABLE it_user_authority IS 'Привелегии (роли) пользователей для разграничения доступа';
COMMIT;
