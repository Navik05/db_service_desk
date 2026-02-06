-- Migration: create_it_podr_fact_location
-- Created: Tue, Dec 30, 2025 12:25:35 PM

BEGIN;

CREATE TABLE IF NOT EXISTS sd_core.it_podr_fact_location (
    id_podr_fact_location SERIAL PRIMARY KEY,
    id_podr               INTEGER NOT NULL,
    id_fact_location      INTEGER NOT NULL,

    -- Внешний ключ на таблицу подразделений
    CONSTRAINT fk_podr_fact_location_podr
        FOREIGN KEY (id_podr)
        REFERENCES sd_core.it_podr (id_podr),

    -- Внешний ключ на таблицу фактических локаций
    CONSTRAINT fk_podr_fact_location_fact_location
        FOREIGN KEY (id_fact_location)
        REFERENCES sd_core.it_fact_location (id_fact_location)
);
COMMIT;
