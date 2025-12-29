-- Migration: create_it_catalog_arh_table
-- Created: Пн 29 дек 2025 19:05:28 +07

BEGIN;
-- Создаем таблицу архив каталога в схеме sd_core
CREATE TABLE IF NOT EXISTS sd_core.it_catalog_arh (
    id_arh    SERIAL PRIMARY KEY,
    d_c       DATE DEFAULT CURRENT_DATE NOT NULL,
    u_c       INTEGER NOT NULL,
    remark    VARCHAR(250)
);

-- Комментарии к таблице
COMMENT ON TABLE sd_core.it_catalog_arh IS 'Архив каталога (история изменений)';
COMMENT ON COLUMN sd_core.it_catalog_arh.id_arh IS 'Уникальный идентификатор записи архива';
COMMENT ON COLUMN sd_core.it_catalog_arh.d_c IS 'Дата создания записи архива';
COMMENT ON COLUMN sd_core.it_catalog_arh.u_c IS 'Идентификатор пользователя (кто внес изменение)';
COMMENT ON COLUMN sd_core.it_catalog_arh.remark IS 'Примечание/комментарий к изменению';

-- Индексы для производительности
CREATE INDEX idx_catalog_arh_date ON sd_core.it_catalog_arh (d_c);
CREATE INDEX idx_catalog_arh_user ON sd_core.it_catalog_arh (u_c);

-- Права доступа отсутствуют

COMMIT;