-- Migration: create_it_service_catitem
-- Created: Tue, Dec 30, 2025 12:49:54 PM

BEGIN;

-- Создание таблицы
CREATE TABLE IF NOT EXISTS sd_core.it_service_catitem (
    id_service_catitem BIGINT NOT NULL,
    id_service         BIGINT NOT NULL,
    id_catitem         BIGINT NOT NULL
);

-- Рекомендуется сразу добавить первичный ключ
ALTER TABLE it_service_catitem
ADD CONSTRAINT pk_it_service_catitem PRIMARY KEY (id_service_catitem);

COMMIT;
