-- Migration: create_it_service_table
-- Created: Пн 22 дек 2025 11:08:57 +07

BEGIN;
-- Создаем таблицу услуг в схеме sd_core
CREATE TABLE IF NOT EXISTS sd_core.it_service (
    id_service           BIGSERIAL PRIMARY KEY,
    fullname             TEXT NOT NULL,
    sname                TEXT,
    description          TEXT,
    developer            TEXT,
    date_s               DATE,
    date_f               DATE,
    priznak_is           BOOLEAN,
    id_service_type      BIGINT NOT NULL,
    id_exp_type          BIGINT NOT NULL,
    id_service_parent    BIGINT,
    is_need_approval     BOOLEAN NOT NULL DEFAULT FALSE,
    is_service           BOOLEAN NOT NULL DEFAULT TRUE,
    business_critical    SMALLINT NOT NULL DEFAULT 3 CHECK (business_critical IN (1, 2, 3)),
    basis_s              TEXT
);

-- Комментарии к таблице
COMMENT ON TABLE sd_core.it_service IS 'Сервис (ИС), модуль сервиса';
COMMENT ON COLUMN sd_core.it_service.business_critical IS 'критичность для бизнеса 1,2,3';
COMMENT ON COLUMN sd_core.it_service.id_service IS 'Уникальный идентификатор сервиса';
COMMENT ON COLUMN sd_core.it_service.fullname IS 'Полное наименование сервиса';
COMMENT ON COLUMN sd_core.it_service.sname IS 'Краткое наименование (аббревиатура)';
COMMENT ON COLUMN sd_core.it_service.description IS 'Описание сервиса';
COMMENT ON COLUMN sd_core.it_service.developer IS 'Разработчик/поставщик';
COMMENT ON COLUMN sd_core.it_service.date_s IS 'Дата начала эксплуатации';
COMMENT ON COLUMN sd_core.it_service.date_f IS 'Дата окончания эксплуатации';
COMMENT ON COLUMN sd_core.it_service.priznak_is IS 'Признак информационной системы';
COMMENT ON COLUMN sd_core.it_service.id_service_type IS 'Тип сервиса (ссылка на справочник)';
COMMENT ON COLUMN sd_core.it_service.id_exp_type IS 'Тип эксплуатации (ссылка на справочник)';
COMMENT ON COLUMN sd_core.it_service.id_service_parent IS 'Родительский сервис (иерархия)';
COMMENT ON COLUMN sd_core.it_service.is_need_approval IS 'Требуется ли согласование';
COMMENT ON COLUMN sd_core.it_service.is_service IS 'Является сервисом (true) или модулем (false)';
COMMENT ON COLUMN sd_core.it_service.basis_s IS 'Основание для создания сервиса';

-- Индексы для производительности
CREATE INDEX idx_service_type ON sd_core.it_service (id_service_type);
CREATE INDEX idx_exp_type ON sd_core.it_service (id_exp_type);
CREATE INDEX idx_service_parent ON sd_core.it_service (id_service_parent);
CREATE INDEX idx_service_fullname ON sd_core.it_service (fullname);
CREATE INDEX idx_service_sname ON sd_core.it_service (sname) WHERE sname IS NOT NULL;
CREATE INDEX idx_service_date_s ON sd_core.it_service (date_s);
CREATE INDEX idx_service_is_service ON sd_core.it_service (is_service);
CREATE INDEX idx_service_business_critical ON sd_core.it_service (business_critical);

-- Уникальность полного наименования
CREATE UNIQUE INDEX uq_service_fullname ON sd_core.it_service (fullname) WHERE date_f IS NULL;

-- Уникальность названия сервиса в пределах одного родителя
CREATE UNIQUE INDEX uq_service_fullname_parent 
    ON sd_core.it_service (fullname, id_service_parent) 
    WHERE id_service_parent IS NOT NULL
    AND fullname IS NOT NULL;

-- Права доступа
GRANT SELECT ON sd_core.it_service TO read_it;
GRANT INSERT, UPDATE, DELETE ON sd_core.it_service TO write_it;

COMMIT;