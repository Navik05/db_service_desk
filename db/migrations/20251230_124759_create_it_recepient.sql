-- Migration: create_it_recepient
-- Created: Tue, Dec 30, 2025 12:47:59 PM

BEGIN;

-- Создание таблицы
CREATE TABLE IF NOT EXISTS sd_core.it_recepient (
    id_recepient    SERIAL PRIMARY KEY,
    id_it_user      INTEGER NOT NULL,
    id_mailing_type INTEGER NOT NULL,

    CONSTRAINT fk_recepient_user
        FOREIGN KEY (id_it_user)
        REFERENCES sd_core.it_user (id_it_user),

    CONSTRAINT fk_recepient_mailing_type
        FOREIGN KEY (id_mailing_type)
        REFERENCES sd_core.it_mailing_type (id_mailing_type)
);
-- Права доступа (аналог GRANT)
GRANT SELECT ON TABLE it_recepient TO read_it;
GRANT INSERT, UPDATE, DELETE ON TABLE it_recepient TO write_it;

-- Комментарии
COMMENT ON TABLE it_recepient IS 'получатели рассылок';

COMMENT ON COLUMN it_recepient.id_recepient IS 'идентификатор получателя рассылки';
COMMENT ON COLUMN it_recepient.id_it_user IS 'код пользователя получателя';
COMMENT ON COLUMN it_recepient.id_mailing_type IS 'код типа рассылки';

COMMIT;
