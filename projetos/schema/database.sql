DROP DATABASE IF EXISTS biblioteca;

CREATE DATABASE biblioteca
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Portuguese_Brazil.1252'
    LC_CTYPE = 'Portuguese_Brazil.1252'
    LOCALE_PROVIDER = 'libc'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

CREATE TABLE categorias

CREATE TABLE livro (
    liv_id SERIAL PRIMARY KEY NOT NULL,
    liv_titulo VARCHAR(50) NOT NULL,
    liv_autor VARCHAR(50) NOT NULL,
    liv_ano_publicacao VARCHAR(4) NOT NULL
);

CREATE TABLE usuario (
    usu_id SERIAL PRIMARY KEY NOT NULL,
    usu_email VARCHAR(50) NOT NULL,
    usu_telefone VARCHAR(20) NOT NULL
);

CREATE TABLE emprestimo (

);