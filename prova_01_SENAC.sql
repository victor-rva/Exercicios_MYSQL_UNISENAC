-- PROVA 

CREATE DATABASE prova;
USE prova;

CREATE TABLE setores (
id int primary key auto_increment,
nome varchar (100)
);

CREATE TABLE funcionarios(
id int primary key auto_increment,
nome varchar (100),
endereco varchar(200),
codCidade int
);

CREATE TABLE cidades (
id int primary key auto_increment,
nome varchar (100)
);

create table funcionarios_setores (
codSetor int,
codFuncionario int,
funcao varchar(100)
);

CREATE VIEW funcionarios_viewww AS
SELECT f.id, f.nome
FROM funcionarios f
LEFT JOIN cidades c ON f.codCidade = c.id
LEFT JOIN setores s ON s.id = f.id;

SELECT s.nome
FROM setores s
LEFT JOIN funcionarios f ON f.id = s.id
ORDER BY nome ASC;

SELECT f.nome, f.endereco
FROM funcionarios f
LEFT JOIN setores s ON f.id = s.nome
ORDER BY nome ASC;