-- Migration: create_it_recepient
-- Created: Tue, Dec 30, 2025 12:47:59 PM

BEGIN;

-- Создание таблицы
CREATE TABLE IF NOT EXISTS sd_core.it_recepient (
    id_recepient    BIGINT NOT NULL,
    id_it_user      BIGINT NOT NULL,
    id_mailing_type BIGINT NOT NULL
);

-- Рекомендуется сразу добавить первичный ключ (в Oracle его, скорее всего, добавляли отдельно)
ALTER TABLE it_recepient
ADD CONSTRAINT pk_it_recepient PRIMARY KEY (id_recepient);

-- Права доступа (аналог GRANT)
GRANT SELECT ON TABLE it_recepient TO read_it;
GRANT INSERT, UPDATE, DELETE ON TABLE it_recepient TO write_it;

-- Комментарии
COMMENT ON TABLE it_recepient IS 'получатели рассылок';

COMMENT ON COLUMN it_recepient.id_recepient IS 'идентификатор получателя рассылки';
COMMENT ON COLUMN it_recepient.id_it_user IS 'код пользователя получателя';
COMMENT ON COLUMN it_recepient.id_mailing_type IS 'код типа рассылки';

COMMIT;
