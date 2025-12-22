-- Service Desk Database Initial Schema
-- Migration: 001_init_schema

-- Включаем расширения
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE EXTENSION IF NOT EXISTS "pgcrypto";

-- Создание схем
CREATE SCHEMA IF NOT EXISTS sd_core;
CREATE SCHEMA IF NOT EXISTS sd_audit;
CREATE SCHEMA IF NOT EXISTS sd_reference;

-- Создание ролей
DO $$
BEGIN
    -- Создаем роль read_it если не существует
    IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'read_it') THEN
        CREATE ROLE read_it;
    END IF;
    
    -- Создаем роль write_it если не существует
    IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'write_it') THEN
        CREATE ROLE write_it;
    END IF;

    -- Создаем роль bkp если не существует
    IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'bkp') THEN
        CREATE ROLE bkp;
    END IF;
END $$;

-- Устанавливаем путь поиска
ALTER DATABASE service_desk SET search_path TO sd_core, sd_reference, public;