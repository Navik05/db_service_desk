-- Migration: create_it_work_table
-- Created: Пн 22 дек 2025 12:01:24 +07

BEGIN;
-- Создаем таблицу работ по услугам в схеме sd_core
CREATE TABLE IF NOT EXISTS sd_core.it_work (
    id_work          BIGSERIAL PRIMARY KEY,
    id_work_parent   BIGINT,
    id_catitem       BIGINT,
    id_service       BIGINT,
    id_group         BIGINT,
    id_work_type     INTEGER NOT NULL,
    remark           TEXT,
    id_podr          BIGINT NOT NULL
);

-- Комментарии к таблице и колонкам
COMMENT ON TABLE sd_core.it_work IS 'Справочник Работа по услуге/сервису/модулю';
COMMENT ON COLUMN sd_core.it_work.id_work IS 'Уникальный идентификатор работы';
COMMENT ON COLUMN sd_core.it_work.id_work_parent IS 'Ссылка на родительскую работу';
COMMENT ON COLUMN sd_core.it_work.id_catitem IS 'Категория работы';
COMMENT ON COLUMN sd_core.it_work.id_service IS 'Ссылка на сервис/услугу';
COMMENT ON COLUMN sd_core.it_work.id_group IS 'Ответственная группа';
COMMENT ON COLUMN sd_core.it_work.id_work_type IS 'Тип работы';
COMMENT ON COLUMN sd_core.it_work.remark IS 'Примечание';
COMMENT ON COLUMN sd_core.it_work.id_podr IS 'Подразделение-заказчик';

-- Внешний ключ на родительскую работу
ALTER TABLE sd_core.it_work
ADD CONSTRAINT fk_work_parent
    FOREIGN KEY (id_work_parent)
    REFERENCES sd_core.it_work (id_work)
    ON DELETE CASCADE;

-- Индексы для производительности
CREATE INDEX idx_work_parent ON sd_core.it_work (id_work_parent) WHERE id_work_parent IS NOT NULL;
CREATE INDEX idx_work_service ON sd_core.it_work (id_service);
CREATE INDEX idx_work_group ON sd_core.it_work (id_group) WHERE id_group IS NOT NULL;
CREATE INDEX idx_work_type ON sd_core.it_work (id_work_type);
CREATE INDEX idx_work_podr ON sd_core.it_work (id_podr);
CREATE INDEX idx_work_catitem ON sd_core.it_work (id_catitem) WHERE id_catitem IS NOT NULL;

-- Права доступа
GRANT SELECT ON sd_core.it_work TO read_it;
GRANT INSERT, UPDATE, DELETE ON sd_core.it_work TO write_it;

COMMIT;