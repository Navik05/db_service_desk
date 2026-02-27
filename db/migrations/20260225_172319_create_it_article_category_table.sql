-- Migration: create_it_article_category_table
-- Created: Wed Feb 25 17:23:19     2026

BEGIN;

CREATE TABLE IF NOT EXISTS sd_core.it_article_category (
    id_article_category  SERIAL PRIMARY KEY,
    name                TEXT
);

-- Комментарии к таблице 
COMMENT ON TABLE sd_core.it_article_category IS 'Таблица для хранения категорей статей главной страницы';
COMMENT ON COLUMN sd_core.it_article_category.id_article_category IS 'Уникальный идентификатор категории';
COMMENT ON COLUMN sd_core.it_article_category.name IS 'Наименование';

COMMIT;
