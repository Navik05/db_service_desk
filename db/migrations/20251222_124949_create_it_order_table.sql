-- Migration: create_it_order_table
-- Created: Пн 22 дек 2025 12:49:49 +07

BEGIN;
-- Создаем таблицу заявок в схеме sd_core
CREATE TABLE IF NOT EXISTS sd_core.it_order (
    id_order              SERIAL PRIMARY KEY,
    nomer                 INTEGER,
    name                  TEXT, -- varchar(100)
    description           TEXT,
    date_c                TIMESTAMP, -- важна дата создания - timestamp
    date_f_plan           TIMESTAMP,
    date_f_fact           TIMESTAMP,
    id_order_parent       INTEGER,
    id_order_type         INTEGER,
    id_catitem            INTEGER,
    id_service            INTEGER,
    id_order_state        INTEGER NOT NULL,
    id_order_priority     INTEGER,
    id_user_creator       INTEGER NOT NULL,
    id_user_initiator     INTEGER NOT NULL,
    id_user_dispatcher    INTEGER,
    id_order_source       INTEGER,
    result_text           TEXT,
    id_user_executor      INTEGER
);

-- Посмотреть timestamp с часовым поясом
-- Комментарии к таблице
COMMENT ON TABLE sd_core.it_order IS 'Таблица заявок';
COMMENT ON COLUMN sd_core.it_order.id_order IS 'Уникальный идентификатор заявки';
COMMENT ON COLUMN sd_core.it_order.nomer IS 'Номер заявки';
COMMENT ON COLUMN sd_core.it_order.name IS 'Заголовок';
COMMENT ON COLUMN sd_core.it_order.description IS 'Описание';
COMMENT ON COLUMN sd_core.it_order.date_c IS 'Дата внесения';
COMMENT ON COLUMN sd_core.it_order.date_f_plan IS 'Желаемая дата завершения';
COMMENT ON COLUMN sd_core.it_order.date_f_fact IS 'Дата фактического завершения';
COMMENT ON COLUMN sd_core.it_order.id_order_parent IS 'Родительская заявка';
COMMENT ON COLUMN sd_core.it_order.id_order_type IS 'Тип заявки';
COMMENT ON COLUMN sd_core.it_order.id_catitem IS 'Услуга с которой связана заявка';
COMMENT ON COLUMN sd_core.it_order.id_service IS 'Сервис с которым связана заявка';
COMMENT ON COLUMN sd_core.it_order.id_order_state IS 'Состояние заявки';
COMMENT ON COLUMN sd_core.it_order.id_order_priority IS 'Приоритет заявки';
COMMENT ON COLUMN sd_core.it_order.id_user_creator IS 'Создатель заявки';
COMMENT ON COLUMN sd_core.it_order.id_user_initiator IS 'Инициатор заявки';
COMMENT ON COLUMN sd_core.it_order.id_user_dispatcher IS 'Специалист линии поддержки, взявший заявку в работу';
COMMENT ON COLUMN sd_core.it_order.id_order_source IS 'Источник заявки';
COMMENT ON COLUMN sd_core.it_order.result_text IS 'Результат выполнения';
COMMENT ON COLUMN sd_core.it_order.id_user_executor IS 'Исполнитель';

-- Внешний ключ на родительскую заявку
ALTER TABLE sd_core.it_order
ADD CONSTRAINT fk_order_parent
    FOREIGN KEY (id_order_parent)
    REFERENCES sd_core.it_order (id_order)
    ON DELETE CASCADE;

-- Индексы для производительности
CREATE INDEX idx_order_nomer ON sd_core.it_order (nomer) WHERE nomer IS NOT NULL;
CREATE INDEX idx_order_parent ON sd_core.it_order (id_order_parent) WHERE id_order_parent IS NOT NULL;
CREATE INDEX idx_order_type ON sd_core.it_order (id_order_type) WHERE id_order_type IS NOT NULL;
CREATE INDEX idx_order_catitem ON sd_core.it_order (id_catitem) WHERE id_catitem IS NOT NULL;
CREATE INDEX idx_order_service ON sd_core.it_order (id_service) WHERE id_service IS NOT NULL;
CREATE INDEX idx_order_state ON sd_core.it_order (id_order_state);
CREATE INDEX idx_order_priority ON sd_core.it_order (id_order_priority) WHERE id_order_priority IS NOT NULL;
CREATE INDEX idx_order_creator ON sd_core.it_order (id_user_creator);
CREATE INDEX idx_order_initiator ON sd_core.it_order (id_user_initiator);
CREATE INDEX idx_order_dispatcher ON sd_core.it_order (id_user_dispatcher) WHERE id_user_dispatcher IS NOT NULL;
CREATE INDEX idx_order_source ON sd_core.it_order (id_order_source) WHERE id_order_source IS NOT NULL;
CREATE INDEX idx_order_executor ON sd_core.it_order (id_user_executor) WHERE id_user_executor IS NOT NULL;
CREATE INDEX idx_order_date_c ON sd_core.it_order (date_c) WHERE date_c IS NOT NULL;
CREATE INDEX idx_order_date_f_plan ON sd_core.it_order (date_f_plan) WHERE date_f_plan IS NOT NULL;
CREATE INDEX idx_order_date_f_fact ON sd_core.it_order (date_f_fact) WHERE date_f_fact IS NOT NULL;

-- Права доступа
GRANT SELECT ON sd_core.it_order TO read_it;
GRANT INSERT, UPDATE, DELETE ON sd_core.it_scale TO write_it;
GRANT SELECT ON sd_core.it_order TO bkp;

INSERT INTO sd_core.it_order (nomer, name, description, date_c, 
    date_f_plan, date_f_fact, id_order_parent, id_order_type, id_catitem,
    id_service, id_order_state, id_order_priority, id_user_creator, 
    id_user_initiator, id_user_dispatcher, id_order_source, result_text, id_user_executor) VALUES
    ('1', 'Очень большой такой заголовок заявки', 'Длинное описание Длинное описание Длинное описание Длинное описание', 
    '2026-01-29 20:00:00-07', '2026-02-01 20:00:00-00', null, null, 3, 1, 1, 11, 1, 1, 2, 3, 1, null, null);
COMMIT;