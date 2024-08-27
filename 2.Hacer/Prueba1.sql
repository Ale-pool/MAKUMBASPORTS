-- Database: Commercesports
-- DROP DATABASE IF EXISTS "Commercesports";

CREATE DATABASE "Commercesports"
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Spanish_Colombia.1252'
    LC_CTYPE = 'Spanish_Colombia.1252'
    LOCALE_PROVIDER = 'libc'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

COMMENT ON DATABASE "Commercesports"
    IS 'Estara los diferentes tablas, entidades y atributos del proyecto de curso de Arquictectura de Software';