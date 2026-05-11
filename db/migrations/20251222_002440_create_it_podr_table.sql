-- Migration: create_it_podr_table
-- Created: Пн 22 дек 2025 00:24:40 +07

BEGIN;
-- Создаем таблицу подразделений в схеме sd_core
CREATE TABLE IF NOT EXISTS sd_core.it_podr (
    id_podr           SERIAL PRIMARY KEY,
    name              TEXT NOT NULL,
    id_podr_parent    INTEGER,
    id_1c             TEXT,
    is_deleted        BOOLEAN NOT NULL DEFAULT FALSE,
    por               INTEGER,
    
    -- Проверочные ограничения
    CONSTRAINT chk_not_self_parent CHECK (id_podr != id_podr_parent OR id_podr_parent IS NULL)    
);

-- Комментарии к таблице и колонкам
COMMENT ON TABLE sd_core.it_podr IS 'Справочник подразделений';
COMMENT ON COLUMN sd_core.it_podr.id_podr IS 'Уникальный идентификатор подразделения';
COMMENT ON COLUMN sd_core.it_podr.name IS 'Наименование подразделения';
COMMENT ON COLUMN sd_core.it_podr.id_podr_parent IS 'Ссылка на родительское подразделение';
COMMENT ON COLUMN sd_core.it_podr.id_1c IS 'Идентификатор подразделения в 1С';
COMMENT ON COLUMN sd_core.it_podr.is_deleted IS 'Признак удаления';
COMMENT ON COLUMN sd_core.it_podr.por IS 'Порядок';

-- Индексы для производительности
CREATE INDEX idx_podr_parent ON sd_core.it_podr (id_podr_parent) WHERE id_podr_parent IS NOT NULL;
CREATE INDEX idx_podr_id_1c ON sd_core.it_podr (id_1c) WHERE id_1c IS NOT NULL;
CREATE INDEX idx_podr_por ON sd_core.it_podr (por);
CREATE INDEX idx_podr_name ON sd_core.it_podr (name);
    
-- Права доступа
GRANT SELECT ON sd_core.it_podr TO read_it;
GRANT INSERT, UPDATE, DELETE ON sd_core.it_podr TO write_it;

COMMIT;