-- Migration: create_it_user_table
-- Created: Вс 21 дек 2025 21:42:26 +07

BEGIN;
-- Создаем таблицу пользователей в схеме sd_core
CREATE TABLE IF NOT EXISTS sd_core.it_user (
    -- Идентификатор
    id_it_user         SERIAL PRIMARY KEY, 
    
    -- Основные данные пользователя
    login_ad           VARCHAR(50),
    email_ad           TEXT,
    tel_ad             VARCHAR(50),
    fio_1c             TEXT,
    id_podr            INTEGER,
    dolzh_1c           TEXT,
    tab_num_1c         VARCHAR(50),
    
    -- Даты аудита
    d_c                DATE,
    d_m                DATE,
    
    -- Флаги и статусы
    is_user            BOOLEAN,
    d_prin             DATE,
    d_uvol             DATE,
    
    -- Дополнительные атрибуты
    agreement_type     VARCHAR(50),
    fiz_lico           VARCHAR(50),
    state_1c           TEXT,
    
    -- CRM/CTI данные
    cti_user           VARCHAR(50),
    cti_password       VARCHAR(50),
    crm_user           VARCHAR(50),
    crm_password       VARCHAR(50), 
    
    -- Флаги
    inter_ad           BOOLEAN,
    grade              INTEGER,

    -- Ограничения
    CONSTRAINT chk_phone_format CHECK (tel_ad ~ '^[\d\s\-\+\(\)]+$' OR tel_ad IS NULL)
    
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

INSERT INTO sd_core.it_user (login_ad,
    email_ad,
    tel_ad,
    fio_1c,
    id_podr,
    dolzh_1c,
    tab_num_1c,
    d_c,
    d_m,
    is_user,
    d_prin,
    d_uvol,
    agreement_type,
    fiz_lico,
    state_1c,
    cti_user,
    cti_password,
    crm_user,
    crm_password, 
    inter_ad,
    grade) VALUES
    ('user1', 'user1@mail.ru', '+1(111)111-1111', 'Ананьев Александр Александрович', 1, 'Первая должность 1с', 'Первый табномер 1с', '2026-01-29', null, 
    true, '2026-01-29', null, 'Первый тип соглашения', 'Первый код физлица 1с', 'Первый статус сотрудника 1с', 'ananevcti', 'ananevpasscti',
    'ananevcrm', 'ananevpasscrm', true, 1),
    ('user2', 'user2@mail.ru', '+2(222)222-2222', 'Борисов Борис Борисович', 1, 'Вторая должность 1с', 'Второй табномер 1с', '2026-01-29', null, 
    true, '2026-01-29', null, 'Второй тип соглашения', 'Второй код физлица 1с', 'Второй статус сотрудника 1с', 'borisovcti', 'borisovpasscti',
    'borisovcrm', 'borisovpasscrm', true, 2),
    ('user3', 'user3@mail.ru', '+3(333)333-3333', 'Воронин Владимир Владимирович', 1, 'Третья должность 1с', 'Третий табномер 1с', '2026-01-29', null, 
    true, '2026-01-29', null, 'Третий тип соглашения', 'Третий код физлица 1с', 'Третий статус сотрудника 1с', 'voronincti', 'voroninpasscti',
    'voronincrm', 'voroninpasscrm', true, 3);
COMMIT;