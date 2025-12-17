-- Service Desk Database Initial Schema
-- Migration: 001_init_schema

-- Включаем расширения
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE EXTENSION IF NOT EXISTS "pgcrypto";

-- Создание схем
CREATE SCHEMA IF NOT EXISTS sd_core;
CREATE SCHEMA IF NOT EXISTS sd_audit;
CREATE SCHEMA IF NOT EXISTS sd_reference;

-- Устанавливаем путь поиска
ALTER DATABASE service_desk SET search_path TO sd_core, sd_reference, public;