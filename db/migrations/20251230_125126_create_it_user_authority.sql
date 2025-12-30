-- Migration: create_it_user_authority
-- Created: Tue, Dec 30, 2025 12:51:26 PM

BEGIN;

-- Создание таблицы
CREATE TABLE IF NOT EXISTS sd_core.it_user_authority (
    id_user_authority SERIAL PRIMARY KEY,
    id_user           INTEGER NOT NULL,
    id_authority      INTEGER NOT NULL,

    CONSTRAINT fk_user_authority_user
        FOREIGN KEY (id_user)
        REFERENCES sd_core.it_user (id_it_user),

    CONSTRAINT fk_user_authority_authority
        FOREIGN KEY (id_authority)
        REFERENCES sd_reference.it_authority (id_authority)
);

-- Права доступа
GRANT SELECT ON TABLE it_user_authority TO read_it;
GRANT INSERT, UPDATE, DELETE ON TABLE it_user_authority TO write_it;

COMMENT ON TABLE it_user_authority IS 'Привелегии (роли) пользователей для разграничения доступа';
COMMIT;
