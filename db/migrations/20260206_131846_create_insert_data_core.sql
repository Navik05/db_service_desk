-- Migration: create_insert_data_core
-- Created: Fri Feb  6 13:18:47     2026
BEGIN;

-- С внешними ключами
INSERT INTO
    sd_core.it_service (
        fullname,
        sname,
        description,
        developer,
        date_s,
        date_f,
        priznak_is,
        id_service_type,
        id_exp_type,
        id_service_parent,
        is_need_approval,
        is_service,
        business_critical,
        basis_s
    )
VALUES
    (
        'Первый сервис',
        'П сервис',
        'Описание первого сервиса',
        'Разработчик первого сервиса',
        '2026-01-29 20:00:00-07',
        null,
        true,
        1,
        2,
        null,
        false,
        true,
        1,
        'Какой-то базис'
    );

INSERT INTO
    sd_core.it_catalogitem (
        id_service,
        id_catitem_parent,
        id_exp_type,
        exp_basis,
        exp_date,
        nomer,
        name,
        description,
        info,
        id_effect,
        id_scale
    )
VALUES
    (
        1,
        null,
        1,
        null,
        null,
        '0000001',
        'Первая услуга',
        'Описание первой услуги',
        'Инфо первой услуги',
        1,
        1
    );

INSERT INTO
    sd_core.it_user (
        login_ad,
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
        grade
    )
VALUES
    (
        'user1',
        'user1@mail.ru',
        '+1(111)111-1111',
        'Ананьев Александр Александрович',
        1,
        'Первая должность 1с',
        'Первый табномер 1с',
        '2026-01-29',
        null,
        true,
        '2026-01-29',
        null,
        'Первый тип соглашения',
        'Первый код физлица 1с',
        'Первый статус сотрудника 1с',
        'ananevcti',
        'ananevpasscti',
        'ananevcrm',
        'ananevpasscrm',
        true,
        1
    ),
    (
        'user2',
        'user2@mail.ru',
        '+2(222)222-2222',
        'Борисов Борис Борисович',
        1,
        'Вторая должность 1с',
        'Второй табномер 1с',
        '2026-01-29',
        null,
        true,
        '2026-01-29',
        null,
        'Второй тип соглашения',
        'Второй код физлица 1с',
        'Второй статус сотрудника 1с',
        'borisovcti',
        'borisovpasscti',
        'borisovcrm',
        'borisovpasscrm',
        true,
        2
    ),
    (
        'user3',
        'user3@mail.ru',
        '+3(333)333-3333',
        'Воронин Владимир Владимирович',
        1,
        'Третья должность 1с',
        'Третий табномер 1с',
        '2026-01-29',
        null,
        true,
        '2026-01-29',
        null,
        'Третий тип соглашения',
        'Третий код физлица 1с',
        'Третий статус сотрудника 1с',
        'voronincti',
        'voroninpasscti',
        'voronincrm',
        'voroninpasscrm',
        true,
        3
    );

INSERT INTO
    sd_core.it_order (
        nomer,
        name,
        description,
        date_c,
        date_f_plan,
        date_f_fact,
        id_order_parent,
        id_order_type,
        id_catitem,
        id_service,
        id_order_state,
        id_order_priority,
        id_user_creator,
        id_user_initiator,
        id_user_dispatcher,
        id_order_source,
        result_text,
        id_user_executor
    )
VALUES
    (
        '1',
        'Очень большой такой заголовок заявки',
        'Длинное описание Длинное описание Длинное описание Длинное описание',
        '2026-01-29 20:00:00-07',
        '2026-02-01 20:00:00-00',
        null,
        null,
        3,
        1,
        1,
        11,
        1,
        1,
        2,
        3,
        1,
        null,
        null
    );

COMMIT;