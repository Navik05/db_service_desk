-- Migration: create_it_article_table
-- Created: Wed Feb 25 17:12:53     2026

BEGIN;

CREATE TABLE IF NOT EXISTS sd_core.it_article (
    id_article           SERIAL PRIMARY KEY,
    title                TEXT,
    content             TEXT,
    date_c              TIMESTAMPTZ NOT NULL,
    id_article_category INTEGER NOT NULL,
    id_user_creator     INTEGER NOT NULL
);

-- Комментарии к таблице 
COMMENT ON TABLE sd_core.it_article IS 'Таблица для хранения статей главной страницы';
COMMENT ON COLUMN sd_core.it_article.id_article IS 'Уникальный идентификатор статьи';
COMMENT ON COLUMN sd_core.it_article.title IS 'Заголовок';
COMMENT ON COLUMN sd_core.it_article.content IS 'Содержание статьи';
COMMENT ON COLUMN sd_core.it_article.date_c IS 'Дата создания';
COMMENT ON COLUMN sd_core.it_article.id_article_category IS 'Идентификатор категории';
COMMENT ON COLUMN sd_core.it_article.id_user_creator IS 'Идентификатор создателя';

COMMIT;
