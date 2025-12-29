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