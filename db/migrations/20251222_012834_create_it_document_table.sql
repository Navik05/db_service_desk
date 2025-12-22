-- Migration: create_it_document_table
-- Created: Пн 22 дек 2025 01:28:34 +07

BEGIN;
-- Создаем таблицу документов в схеме sd_core
CREATE TABLE IF NOT EXISTS sd_core.it_document (
    -- Идентификатор
    id_document    SERIAL PRIMARY KEY,
    
    -- Основные данные
    name           VARCHAR(100),
    type           VARCHAR(10),
    content        BYTEA,
    id_new         INTEGER NOT NULL
);

-- Комментарии к таблице и колонкам
COMMENT ON TABLE sd_core.it_document IS 'Таблица для хранения документов';
COMMENT ON COLUMN sd_core.it_document.id_document IS 'Уникальный идентификатор документа';
COMMENT ON COLUMN sd_core.it_document.name IS 'Наименование документа';
COMMENT ON COLUMN sd_core.it_document.type IS 'Тип документа';
COMMENT ON COLUMN sd_core.it_document.content IS 'Содержимое документа (бинарные данные)';
COMMENT ON COLUMN sd_core.it_document.id_new IS 'Идентификатор связанной сущности';

-- Индексы для производительности
CREATE INDEX idx_document_id_new ON sd_core.it_document (id_new);
CREATE INDEX idx_document_type ON sd_core.it_document (type) WHERE type IS NOT NULL;

-- Права доступа
GRANT SELECT ON sd_core.it_document TO read_it;
GRANT INSERT, UPDATE, DELETE ON sd_core.it_document TO write_it;

COMMIT;