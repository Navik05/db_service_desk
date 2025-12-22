-- Migration: create_it_catalogitem_table
-- Created: Пн 22 дек 2025 12:20:26 +07

BEGIN;
-- Создаем таблицу ИТ услуг в схеме sd_core
CREATE TABLE IF NOT EXISTS sd_core.it_catalogitem (
    id_catitem          BIGSERIAL PRIMARY KEY,
    id_service          BIGINT,
    id_catitem_parent   BIGINT,
    id_exp_type         BIGINT NOT NULL,
    exp_basis           TEXT,
    exp_date            DATE,
    nomer               VARCHAR(7),
    name                TEXT,
    description         TEXT,
    info                TEXT,
    id_effect           INTEGER,
    id_scale            INTEGER
);

-- Комментарии к таблице и колонкам
COMMENT ON TABLE sd_core.it_catalogitem IS 'ИТ Услуга';
COMMENT ON COLUMN sd_core.it_catalogitem.id_catitem IS 'Уникальный идентификатор услуги';
COMMENT ON COLUMN sd_core.it_catalogitem.id_service IS 'Ссылка на сервис';
COMMENT ON COLUMN sd_core.it_catalogitem.id_catitem_parent IS 'Ссылка на родительскую услугу';
COMMENT ON COLUMN sd_core.it_catalogitem.id_exp_type IS 'Тип эксплуатации';
COMMENT ON COLUMN sd_core.it_catalogitem.exp_basis IS 'Основание для ввода в эксплуатацию';
COMMENT ON COLUMN sd_core.it_catalogitem.exp_date IS 'Дата ввода в эксплуатацию';
COMMENT ON COLUMN sd_core.it_catalogitem.nomer IS 'Номер услуги';
COMMENT ON COLUMN sd_core.it_catalogitem.name IS 'Наименование услуги';
COMMENT ON COLUMN sd_core.it_catalogitem.description IS 'Описание услуги';
COMMENT ON COLUMN sd_core.it_catalogitem.info IS 'Дополнительная информация';
COMMENT ON COLUMN sd_core.it_catalogitem.id_effect IS 'Эффективность/результативность';
COMMENT ON COLUMN sd_core.it_catalogitem.id_scale IS 'Масштаб/охват';

-- Внешний ключ на родительскую услугу
ALTER TABLE sd_core.it_catalogitem
ADD CONSTRAINT fk_catitem_parent
    FOREIGN KEY (id_catitem_parent)
    REFERENCES sd_core.it_catalogitem (id_catitem)
    ON DELETE CASCADE;

-- Индексы для производительности
CREATE INDEX idx_catitem_service ON sd_core.it_catalogitem (id_service) WHERE id_service IS NOT NULL;
CREATE INDEX idx_catitem_parent ON sd_core.it_catalogitem (id_catitem_parent) WHERE id_catitem_parent IS NOT NULL;
CREATE INDEX idx_catitem_exp_type ON sd_core.it_catalogitem (id_exp_type);
CREATE INDEX idx_catitem_nomer ON sd_core.it_catalogitem (nomer) WHERE nomer IS NOT NULL;
CREATE INDEX idx_catitem_name ON sd_core.it_catalogitem (name) WHERE name IS NOT NULL;
CREATE INDEX idx_catitem_exp_date ON sd_core.it_catalogitem (exp_date) WHERE exp_date IS NOT NULL;

-- Уникальность номера услуги
CREATE UNIQUE INDEX uq_catitem_nomer ON sd_core.it_catalogitem (nomer) WHERE nomer IS NOT NULL;

-- Уникальность названия услуги в пределах одного родителя
CREATE UNIQUE INDEX uq_catalogitem_name_parent 
    ON sd_core.it_catalogitem (name, id_catitem_parent) 
    WHERE name IS NOT NULL;

-- Права доступа
GRANT SELECT ON sd_core.it_catalogitem TO read_it;
GRANT INSERT, UPDATE, DELETE ON sd_core.it_catalogitem TO write_it;

COMMIT;