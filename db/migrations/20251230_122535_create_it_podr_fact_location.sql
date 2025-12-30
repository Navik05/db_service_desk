-- Migration: create_it_podr_fact_location
-- Created: Tue, Dec 30, 2025 12:25:35 PM

BEGIN;

CREATE TABLE IF NOT EXISTS sd_core.it_podr_fact_location (
    id_podr_fact_location BIGINT NOT NULL,
    id_podr               BIGINT NOT NULL,
    id_fact_location      BIGINT NOT NULL
);

COMMIT;
