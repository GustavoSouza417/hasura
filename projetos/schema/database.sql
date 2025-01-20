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



CREATE TYPE ENUM_EMP_STATUS AS ENUM('pendente', 'em andamento', 'confirmada', 'cancelada');
CREATE TYPE ENUM_RES_STATUS AS ENUM('emprestado', 'devolvido', 'atrasado');



CREATE TABLE categoria (
    cat_id SERIAL PRIMARY KEY NOT NULL,
    cat_nome VARCHAR(50) NOT NULL
);

SELECT setval('categoria_cat_id_seq', 3, false);



CREATE TABLE livro (
    liv_id SERIAL PRIMARY KEY NOT NULL,
    liv_titulo VARCHAR(50) NOT NULL,
    liv_autor VARCHAR(50) NOT NULL,
    liv_ano_publicacao VARCHAR(4) NOT NULL
);



CREATE TABLE categoria_livro (
    liv_id INT NOT NULL,
    cat_id INT NOT NULL,

    PRIMARY KEY (liv_id, cat_id),
    CONSTRAINT fk_liv_id FOREIGN KEY (liv_id) REFERENCES livro (liv_id),
    CONSTRAINT fk_cat_id FOREIGN KEY (cat_id) REFERENCES categoria (cat_id)
);



CREATE TABLE usuario (
    usu_id SERIAL PRIMARY KEY NOT NULL,
    usu_email VARCHAR(50) NOT NULL UNIQUE,
    usu_telefone VARCHAR(20) NOT NULL UNIQUE
);



CREATE TABLE emprestimo (
    emp_id SERIAL PRIMARY KEY NOT NULL,
    emp_data_retirada DATE NOT NULL,
    emp_data_devolucao DATE NOT NULL,
    emp_status ENUM_EMP_STATUS NOT NULL,
    usu_id INT NOT NULL,
    liv_id INT NOT NULL,

    CONSTRAINT fk_usu_id FOREIGN KEY (usu_id) REFERENCES usuario (usu_id),
    CONSTRAINT fk_liv_id FOREIGN KEY (liv_id) REFERENCES livro (liv_id)
);



CREATE TABLE reserva (
    res_id SERIAL PRIMARY KEY NOT NULL,
    res_data_reserva DATE NOT NULL,
    res_data_disponivel DATE NOT NULL,
    res_status ENUM_RES_STATUS NOT NULL,
    usu_id INT NOT NULL,
    liv_id INT NOT NULL,

    CONSTRAINT fk_usu_id FOREIGN KEY (usu_id) REFERENCES usuario (usu_id),
    CONSTRAINT fk_liv_id FOREIGN KEY (liv_id) REFERENCES livro (liv_id)
);