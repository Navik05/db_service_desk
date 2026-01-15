-- Migration: create_it_operation_table
-- Created: Пн 29 дек 2025 18:28:07 +07

BEGIN;
-- Создаем таблицу-спрвочник опираций в схеме sd_reference
CREATE TABLE IF NOT EXISTS sd_reference.it_operation (
    id_operation    SERIAL PRIMARY KEY,
    name            VARCHAR(256) NOT NULL,
    description     TEXT,
    id_function     INTEGER NOT NULL,

    CONSTRAINT fk_operation_function
        FOREIGN KEY (id_function)
        REFERENCES sd_reference.it_function (id_function)
);

-- Комментарии к таблице
COMMENT ON TABLE sd_reference.it_operation IS 'Справочник операций';
COMMENT ON COLUMN sd_reference.it_operation.id_operation IS 'Уникальный идентификатор операции';
COMMENT ON COLUMN sd_reference.it_operation.name IS 'Наименование операции';
COMMENT ON COLUMN sd_reference.it_operation.description IS 'Описание операции';
COMMENT ON COLUMN sd_reference.it_operation.id_function IS 'Идентификатор функции';

-- Индексы для производительности
CREATE INDEX idx_operation_name ON sd_reference.it_operation (name);
CREATE INDEX idx_operation_function ON sd_reference.it_operation (id_function);

-- Уникальность названия операции
CREATE UNIQUE INDEX uq_operation_name ON sd_reference.it_operation (name);

-- Права доступа
GRANT SELECT ON sd_reference.it_function TO read_it;
GRANT INSERT, UPDATE, DELETE ON sd_reference.it_scale TO write_it;

COMMIT;