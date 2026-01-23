-- Migration: create_it_catitem_user_role_table
-- Created: Пн 29 дек 2025 19:24:04 +07

BEGIN;
-- Создаем таблицу ролей пользователей для услуг католога в схеме sd_core
CREATE TABLE IF NOT EXISTS sd_core.it_catitem_user_role (
    id_catitem_user_role    SERIAL PRIMARY KEY,
    id_catitem              INTEGER,
    id_user                 INTEGER NOT NULL,
    id_podr                 INTEGER,
    id_user_role            INTEGER NOT NULL,
    id_service              INTEGER
);

-- Комментарии к таблице и колонкам
COMMENT ON TABLE sd_core.it_catitem_user_role IS 'Роли пользователей для услуг каталога (назначение ответственных)';
COMMENT ON COLUMN sd_core.it_catitem_user_role.id_catitem_user_role IS 'Уникальный идентификатор назначения роли';
COMMENT ON COLUMN sd_core.it_catitem_user_role.id_catitem IS 'Идентификатор услуги каталога';
COMMENT ON COLUMN sd_core.it_catitem_user_role.id_user IS 'Идентификатор пользователя';
COMMENT ON COLUMN sd_core.it_catitem_user_role.id_podr IS 'Идентификатор подразделения';
COMMENT ON COLUMN sd_core.it_catitem_user_role.id_user_role IS 'Идентификатор роли пользователя';
COMMENT ON COLUMN sd_core.it_catitem_user_role.id_service IS 'Идентификатор сервиса';

-- Индексы для производительности
CREATE INDEX idx_catitem_user_role_catitem ON sd_core.it_catitem_user_role (id_catitem) WHERE id_catitem IS NOT NULL;
CREATE INDEX idx_catitem_user_role_user ON sd_core.it_catitem_user_role (id_user);
CREATE INDEX idx_catitem_user_role_podr ON sd_core.it_catitem_user_role (id_podr) WHERE id_podr IS NOT NULL;
CREATE INDEX idx_catitem_user_role_user_role ON sd_core.it_catitem_user_role (id_user_role);
CREATE INDEX idx_catitem_user_role_service ON sd_core.it_catitem_user_role (id_service) WHERE id_service IS NOT NULL;

-- Права доступа отсутствуют

COMMIT;