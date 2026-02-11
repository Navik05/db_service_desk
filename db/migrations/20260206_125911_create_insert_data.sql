-- Migration: create_insert_data
-- Created: Fri Feb  6 12:59:11     2026
BEGIN;

-- Без внешних ключей
INSERT INTO
    sd_core.it_effect (name)
VALUES
    ('Первый эффект'),
    ('Второй эффект');

INSERT INTO
    sd_core.it_exp_type (name)
VALUES
    ('Первый тип эксплуатации для каталога'),
    ('Второй тип эксплуатации для сервиса');

INSERT INTO
    sd_core.it_order_priority (name, color)
VALUES
    ('Низкий', 'green'),
    ('Высокий', 'red');

INSERT INTO
    sd_core.it_order_source (name)
VALUES
    ('Первый источник');

INSERT INTO
    sd_core.it_order_state (name)
VALUES
    ('Возобновлена'),
    ('В ожидании'),
    ('В работе'),
    ('Закрыта'),
    ('На контроле'),
    ('На подтверждении'),
    ('На рассмотрении'),
    ('На согласовании'),
    ('На утверждении'),
    ('Не согласовано'),
    ('Новая'),
    ('Отклонена'),
    ('Отменена инициатором'),
    ('Согласовано'),
    ('Согласование отклонено'),
    ('Согласование отменено'),
    ('Утверждено');

INSERT INTO
    sd_core.it_order_type (name, available)
VALUES
    ('ЗНД', true),
    ('ЗНИ', true),
    ('ЗНО', true);

INSERT INTO
    sd_core.it_scale (name)
VALUES
    ('Крупный'),
    ('Средний'),
    ('Мелкий');

INSERT INTO
    sd_core.it_service_type (name, fullname)
VALUES
    ('Первый тип сервиса', 'Полный первый тип сервиса');

INSERT INTO
    sd_core.it_podr (name, id_podr_parent, id_1c, is_deleted, por)
VALUES
    (
        'Первое подразделение',
        null,
        'Первый айди 1с',
        false,
        1
    );

COMMIT;