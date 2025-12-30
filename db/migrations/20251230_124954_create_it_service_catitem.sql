-- Migration: create_it_service_catitem
-- Created: Tue, Dec 30, 2025 12:49:54 PM

BEGIN;

-- Создание таблицы
CREATE TABLE IF NOT EXISTS sd_core.it_service_catitem (
    id_service_catitem SERIAL PRIMARY KEY,
    id_service         INTEGER NOT NULL,
    id_catitem         INTEGER NOT NULL,

    CONSTRAINT fk_service_catitem_service
        FOREIGN KEY (id_service)
        REFERENCES sd_core.it_service (id_service),

    CONSTRAINT fk_service_catitem_catitem
        FOREIGN KEY (id_catitem)
        REFERENCES sd_core.it_catalogitem (id_catitem)
);

COMMIT;
