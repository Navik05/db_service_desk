-- Migration: create_it_user_table
-- Created: Вс 21 дек 2025 21:42:26 +07

BEGIN;
-- Создаем таблицу пользователей в схеме sd_core
CREATE TABLE IF NOT EXISTS sd_core.it_user (
    -- Идентификатор
    id_it_user         SERIAL PRIMARY KEY, 
    
    -- Основные данные пользователя
    login_ad           CHARACTER(50),
    email_ad           TEXT,
    tel_ad             CHARACTER(50),
    fio_1c             TEXT,
    id_podr            INTEGER,
    dolzh_1c           TEXT,
    tab_num_1c         CHARACTER(50),
    
    -- Даты аудита
    d_c                DATE,
    d_m                DATE,
    
    -- Флаги и статусы
    is_user            BOOLEAN,
    d_prin             DATE,
    d_uvol             DATE,
    
    -- Дополнительные атрибуты
    agreement_type     CHARACTER(50),
    fiz_lico           CHARACTER(50),
    state_1c           TEXT,
    
    -- CRM/CTI данные
    cti_user           CHARACTER(50),
    cti_password       CHARACTER(50),
    crm_user           CHARACTER(50),
    crm_password       CHARACTER(50), 
    
    -- Флаги
    inter_ad           BOOLEAN,
    grade              INTEGER,

    -- Ограничения
    CONSTRAINT chk_phone_format CHECK (tel_ad ~ '^[\d\s\-\+\(\)]+$' OR tel_ad IS NULL),

    CONSTRAINT fk_user_podr
        FOREIGN KEY (id_podr)
        REFERENCES sd_reference.it_podr (id_podr),
    
);

-- Комментарии к таблице и колонкам
COMMENT ON TABLE sd_core.it_user IS 'Справочник IT-пользователей (сотрудников)';

COMMENT ON COLUMN sd_core.it_user.id_it_user IS 'Уникальный идентификатор пользователя';
COMMENT ON COLUMN sd_core.it_user.login_ad IS 'Логин в Active Directory';
COMMENT ON COLUMN sd_core.it_user.email_ad IS 'Email в Active Directory';
COMMENT ON COLUMN sd_core.it_user.tel_ad IS 'Телефонный номер';
COMMENT ON COLUMN sd_core.it_user.fio_1c IS 'ФИО из 1С';
COMMENT ON COLUMN sd_core.it_user.id_podr IS 'Идентификатор подразделения';
COMMENT ON COLUMN sd_core.it_user.dolzh_1c IS 'Должность из 1С';
COMMENT ON COLUMN sd_core.it_user.tab_num_1c IS 'Табельный номер из 1С';
COMMENT ON COLUMN sd_core.it_user.d_c IS 'Дата создания записи';
COMMENT ON COLUMN sd_core.it_user.d_m IS 'Дата последнего изменения записи';
COMMENT ON COLUMN sd_core.it_user.is_user IS 'Является реальным сотрудником (true) или виртуальным (false)';
COMMENT ON COLUMN sd_core.it_user.d_prin IS 'Дата принятия на работу';
COMMENT ON COLUMN sd_core.it_user.d_uvol IS 'Дата увольнения';
COMMENT ON COLUMN sd_core.it_user.agreement_type IS 'Тип соглашения: Основной, ГПХ, Совмещение';
COMMENT ON COLUMN sd_core.it_user.fiz_lico IS 'Код физического лица из 1С';
COMMENT ON COLUMN sd_core.it_user.state_1c IS 'Статус сотрудника в 1С';
COMMENT ON COLUMN sd_core.it_user.cti_user IS 'Имя пользователя Cisco для CRM';
COMMENT ON COLUMN sd_core.it_user.cti_password IS 'Пароль Cisco для CRM';
COMMENT ON COLUMN sd_core.it_user.crm_user IS 'Пользователь CRM';
COMMENT ON COLUMN sd_core.it_user.crm_password IS 'Пароль CRM';
COMMENT ON COLUMN sd_core.it_user.inter_ad IS 'Признак международного AD';
COMMENT ON COLUMN sd_core.it_user.grade IS 'Грейд сотрудника из 1С';

-- Создаем индексы для часто используемых полей
CREATE INDEX idx_it_user_login_ad ON sd_core.it_user (login_ad);
CREATE INDEX idx_it_user_email_ad ON sd_core.it_user (email_ad);
CREATE INDEX idx_it_user_id_podr ON sd_core.it_user (id_podr);

-- Назначаем права доступа
GRANT SELECT ON sd_core.it_user TO read_it;
GRANT INSERT, UPDATE, DELETE ON sd_core.it_user TO write_it;

COMMIT;