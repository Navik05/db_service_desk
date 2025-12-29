CREATE TABLE it_approve
    (id_approve                     NUMBER(*,0) NOT NULL,
    id_order                       NUMBER(*,0),
    name                           VARCHAR2(4000 BYTE),
    id_user_creator                NUMBER(*,0),
    flag_approved                  NUMBER(1,0) DEFAULT 0,
    date_c                         DATE DEFAULT sysdate,
    date_plan                      DATE,
    state                          NUMBER(1,0) DEFAULT 0,
    date_fact                      DATE,
    task_text                      VARCHAR2(4000 BYTE))
  SEGMENT CREATION IMMEDIATE
  PCTFREE     10
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  it_data_tbl
  STORAGE   (
    INITIAL     65536
    NEXT        1048576
    MINEXTENTS  1
    MAXEXTENTS  2147483645
  )
  NOCACHE
  MONITORING
  NOPARALLEL
  LOGGING
;




COMMENT ON COLUMN it_approve.date_fact IS 'Фактическая дата согласования'
;
COMMENT ON COLUMN it_approve.date_plan IS 'Срок согласования'
;
CREATE TABLE it_approve_users
    (id_approve_users               NUMBER(*,0) NOT NULL,
    id_approve                     NUMBER(*,0) NOT NULL,
    id_user                        NUMBER(*,0) NOT NULL,
    user_role                      NUMBER(1,0),
    state                          NUMBER(1,0) DEFAULT 0,
    result_text                    VARCHAR2(4000 BYTE),
    id_approve_users_parent        NUMBER,
    date_plan                      DATE,
    date_fact                      DATE,
    task_text                      VARCHAR2(4000 BYTE))
  SEGMENT CREATION IMMEDIATE
  PCTFREE     10
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  it_data_tbl
  STORAGE   (
    INITIAL     65536
    NEXT        1048576
    MINEXTENTS  1
    MAXEXTENTS  2147483645
  )
  NOCACHE
  MONITORING
  NOPARALLEL
  LOGGING
;




COMMENT ON COLUMN it_approve_users.date_fact IS 'Фактическая дата согласования(Выполнения задачи)'
;
COMMENT ON COLUMN it_approve_users.date_plan IS 'Срок согласования (Выполнения задачи)'
;
COMMENT ON COLUMN it_approve_users.id_approve_users_parent IS 'Родительская задача согласования'
;
COMMENT ON COLUMN it_approve_users.result_text IS 'Результат выполнения/согласования'
;
COMMENT ON COLUMN it_approve_users.state IS 'Состояние 0 - ?, 1 - согласовано, 2 отклонено'
;
COMMENT ON COLUMN it_approve_users.task_text IS 'Задача для выполнения/согласования'
;
CREATE TABLE it_authority
    (id_authority                   NUMBER(*,0) NOT NULL,
    authority                      VARCHAR2(256 BYTE),
    description                    VARCHAR2(4000 BYTE))
  SEGMENT CREATION IMMEDIATE
  PCTFREE     10
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  it_data_tbl
  STORAGE   (
    INITIAL     65536
    NEXT        1048576
    MINEXTENTS  1
    MAXEXTENTS  2147483645
  )
  NOCACHE
  MONITORING
  NOPARALLEL
  LOGGING
;

GRANT SELECT ON it_authority TO read_it
;
GRANT DELETE ON it_authority TO write_it
;
GRANT INSERT ON it_authority TO write_it
;
GRANT UPDATE ON it_authority TO write_it
;



COMMENT ON TABLE it_authority IS 'Справочник привелегий (ролей) для разграничения доступа'
;
COMMENT ON COLUMN it_authority.authority IS 'Имя привелегии'
;
COMMENT ON COLUMN it_authority.description IS 'Описание'
;
CREATE TABLE it_catalog_arh
    (id_arh                         NUMBER NOT NULL,
    d_c                            DATE DEFAULT sysdate NOT NULL,
    u_c                            NUMBER NOT NULL,
    remark                         VARCHAR2(250 BYTE))
  SEGMENT CREATION IMMEDIATE
  PCTFREE     10
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  it_data_tbl
  STORAGE   (
    INITIAL     65536
    NEXT        1048576
    MINEXTENTS  1
    MAXEXTENTS  2147483645
  )
  NOCACHE
  MONITORING
  NOPARALLEL
  LOGGING
;




CREATE TABLE it_catalog_arh_data
    (id_data                        NUMBER NOT NULL,
    id_arh                         NUMBER NOT NULL,
    old_pk                         NUMBER,
    nomer                          VARCHAR2(7 BYTE),
    name                           VARCHAR2(256 BYTE),
    description                    VARCHAR2(4000 BYTE),
    org                            VARCHAR2(256 BYTE),
    podr                           VARCHAR2(256 BYTE),
    fio_fz                         VARCHAR2(256 BYTE),
    fio_cu                         VARCHAR2(256 BYTE),
    fio_sm                         VARCHAR2(256 BYTE),
    state                          VARCHAR2(50 BYTE),
    exp_basis                      VARCHAR2(256 BYTE),
    exp_date                       DATE,
    scale                          VARCHAR2(50 BYTE),
    effect                         VARCHAR2(50 BYTE),
    info                           VARCHAR2(4000 BYTE))
  SEGMENT CREATION IMMEDIATE
  PCTFREE     10
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  it_data_tbl
  STORAGE   (
    INITIAL     65536
    NEXT        1048576
    MINEXTENTS  1
    MAXEXTENTS  2147483645
  )
  NOCACHE
  MONITORING
  NOPARALLEL
  LOGGING
;




COMMENT ON COLUMN it_catalog_arh_data.id_data IS 'pk'
;
COMMENT ON COLUMN it_catalog_arh_data.old_pk IS 'PK из it_catalogitem с которого делали фиксацию'
;

CREATE TABLE it_catitem_user_role
    (id_catitem_user_role           NUMBER(*,0) NOT NULL,
    id_catitem                     NUMBER(*,0),
    id_user                        NUMBER(*,0) NOT NULL,
    id_podr                        NUMBER(*,0),
    id_user_role                   NUMBER(*,0) NOT NULL,
    id_service                     NUMBER(*,0))
  SEGMENT CREATION IMMEDIATE
  PCTFREE     10
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  it_data_tbl
  STORAGE   (
    INITIAL     65536
    NEXT        1048576
    MINEXTENTS  1
    MAXEXTENTS  2147483645
  )
  NOCACHE
  MONITORING
  NOPARALLEL
  LOGGING
;




CREATE TABLE it_menu
    (id_menu                        NUMBER(*,0) NOT NULL,
    name                           VARCHAR2(256 BYTE),
    description                    VARCHAR2(4000 BYTE),
    acc_level                      NUMBER(1,0),
    id_function                    NUMBER(*,0) NOT NULL)
  SEGMENT CREATION IMMEDIATE
  PCTFREE     10
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  it_data_tbl
  STORAGE   (
    INITIAL     65536
    NEXT        1048576
    MINEXTENTS  1
    MAXEXTENTS  2147483645
  )
  NOCACHE
  MONITORING
  NOPARALLEL
  LOGGING
;

GRANT SELECT ON it_menu TO read_it
;
GRANT DELETE ON it_menu TO write_it
;
GRANT INSERT ON it_menu TO write_it
;
GRANT UPDATE ON it_menu TO write_it
;



CREATE TABLE it_podr_fact_location
    (id_podr_fact_location          NUMBER(*,0) NOT NULL,
    id_podr                        NUMBER(*,0) NOT NULL,
    id_fact_location               NUMBER(*,0) NOT NULL)
  SEGMENT CREATION DEFERRED
  PCTFREE     10
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  it_data_tbl
  NOCACHE
  MONITORING
  NOPARALLEL
  LOGGING
;




CREATE TABLE it_recepient
    (id_recepient                   NUMBER(*,0) NOT NULL,
    id_it_user                     NUMBER(*,0) NOT NULL,
    id_mailing_type                NUMBER(*,0) NOT NULL)
  SEGMENT CREATION IMMEDIATE
  PCTFREE     10
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  it_data_tbl
  STORAGE   (
    INITIAL     65536
    NEXT        1048576
    MINEXTENTS  1
    MAXEXTENTS  2147483645
  )
  NOCACHE
  MONITORING
  NOPARALLEL
  LOGGING
;

GRANT SELECT ON it_recepient TO read_it
;
GRANT DELETE ON it_recepient TO write_it
;
GRANT INSERT ON it_recepient TO write_it
;
GRANT UPDATE ON it_recepient TO write_it
;



COMMENT ON TABLE it_recepient IS 'получатели рассылок'
;
COMMENT ON COLUMN it_recepient.id_it_user IS 'код пользователя получателя'
;
COMMENT ON COLUMN it_recepient.id_mailing_type IS 'код типа рассылки'
;




CREATE TABLE it_service_catitem
    (id_service_catitem             NUMBER(*,0) NOT NULL,
    id_service                     NUMBER(*,0) NOT NULL,
    id_catitem                     NUMBER(*,0) NOT NULL)
  SEGMENT CREATION IMMEDIATE
  PCTFREE     10
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  it_data_tbl
  STORAGE   (
    INITIAL     65536
    NEXT        1048576
    MINEXTENTS  1
    MAXEXTENTS  2147483645
  )
  NOCACHE
  MONITORING
  NOPARALLEL
  LOGGING
;


CREATE TABLE it_user_authority
    (id_user_authority              NUMBER(*,0) NOT NULL,
    id_user                        NUMBER(*,0) NOT NULL,
    id_authority                   NUMBER(*,0) NOT NULL)
  SEGMENT CREATION IMMEDIATE
  PCTFREE     10
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  it_data_tbl
  STORAGE   (
    INITIAL     65536
    NEXT        1048576
    MINEXTENTS  1
    MAXEXTENTS  2147483645
  )
  NOCACHE
  MONITORING
  NOPARALLEL
  LOGGING
;

GRANT SELECT ON it_user_authority TO read_it
;
GRANT DELETE ON it_user_authority TO write_it
;
GRANT INSERT ON it_user_authority TO write_it
;
GRANT UPDATE ON it_user_authority TO write_it
;



COMMENT ON TABLE it_user_authority IS 'Привелегии (роли) пользователей для разграничения доступа'
;
CREATE TABLE it_user_group
    (id_user_group                  NUMBER(*,0) NOT NULL,
    id_group                       NUMBER(*,0) NOT NULL,
    id_user                        NUMBER(*,0) NOT NULL)
  SEGMENT CREATION IMMEDIATE
  PCTFREE     10
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  it_data_tbl
  STORAGE   (
    INITIAL     65536
    NEXT        1048576
    MINEXTENTS  1
    MAXEXTENTS  2147483645
  )
  NOCACHE
  MONITORING
  NOPARALLEL
  LOGGING
;