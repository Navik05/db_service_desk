-- Migration: create_it_catalog_arh_data_table
-- Created: Пн 29 дек 2025 19:08:50 +07

BEGIN;
-- Создаем таблицу архива каталога в схеме sd_core
CREATE TABLE IF NOT EXISTS sd_core.it_catalog_arh_data (
    id_data        SERIAL PRIMARY KEY,
    id_arh         INTEGER NOT NULL,
    old_pk         INTEGER,
    nomer          VARCHAR(7),
    name           VARCHAR(256),
    description    TEXT,
    org            VARCHAR(256),
    podr           VARCHAR(256),
    fio_fz         VARCHAR(256),
    fio_cu         VARCHAR(256),
    fio_sm         VARCHAR(256),
    state          VARCHAR(50),
    exp_basis      VARCHAR(256),
    exp_date       DATE,
    scale          VARCHAR(50),
    effect         VARCHAR(50),
    info           TEXT
);

-- Комментарии к таблице
COMMENT ON TABLE sd_core.it_catalog_arh_data IS 'Данные архива каталога';
COMMENT ON COLUMN sd_core.it_catalog_arh_data.id_data IS 'Первичный ключ записи данных архива';
COMMENT ON COLUMN sd_core.it_catalog_arh_data.id_arh IS 'Ссылка на запись в архиве (it_catalog_arh)';
COMMENT ON COLUMN sd_core.it_catalog_arh_data.old_pk IS 'PK из it_catalogitem с которого делали фиксацию';
COMMENT ON COLUMN sd_core.it_catalog_arh_data.nomer IS 'Номер услуги';
COMMENT ON COLUMN sd_core.it_catalog_arh_data.name IS 'Наименование услуги';
COMMENT ON COLUMN sd_core.it_catalog_arh_data.description IS 'Описание услуги';
COMMENT ON COLUMN sd_core.it_catalog_arh_data.org IS 'Организация';
COMMENT ON COLUMN sd_core.it_catalog_arh_data.podr IS 'Подразделение';
COMMENT ON COLUMN sd_core.it_catalog_arh_data.fio_fz IS 'ФИО физ. лица';
COMMENT ON COLUMN sd_core.it_catalog_arh_data.fio_cu IS 'ФИО контактного лица';
COMMENT ON COLUMN sd_core.it_catalog_arh_data.fio_sm IS 'ФИО руководителя';
COMMENT ON COLUMN sd_core.it_catalog_arh_data.state IS 'Состояние';
COMMENT ON COLUMN sd_core.it_catalog_arh_data.exp_basis IS 'Основание для ввода в эксплуатацию';
COMMENT ON COLUMN sd_core.it_catalog_arh_data.exp_date IS 'Дата ввода в эксплуатацию';
COMMENT ON COLUMN sd_core.it_catalog_arh_data.scale IS 'Масштаб';
COMMENT ON COLUMN sd_core.it_catalog_arh_data.effect IS 'Эффективность';
COMMENT ON COLUMN sd_core.it_catalog_arh_data.info IS 'Дополнительная информация';

-- Индексы для производительности
CREATE INDEX idx_arh_data_arh ON sd_core.it_catalog_arh_data (id_arh);
CREATE INDEX idx_arh_data_old_pk ON sd_core.it_catalog_arh_data (old_pk) WHERE old_pk IS NOT NULL;
CREATE INDEX idx_arh_data_nomer ON sd_core.it_catalog_arh_data (nomer) WHERE nomer IS NOT NULL;
CREATE INDEX idx_arh_data_name ON sd_core.it_catalog_arh_data (name) WHERE name IS NOT NULL;
CREATE INDEX idx_arh_data_exp_date ON sd_core.it_catalog_arh_data (exp_date) WHERE exp_date IS NOT NULL;

-- Права доступа отсутствуют

COMMIT;