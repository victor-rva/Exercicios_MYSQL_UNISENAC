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
-- 1) Analise o diagrama ER e construa uma VIEW que possua uma consulta que retorna o id do funcionário, seu nome, sua cidade e o setor que trabalha
CREATE VIEW funcionarios_viewww AS
SELECT f.id, f.nome
FROM funcionarios f
LEFT JOIN cidades c ON f.codCidade = c.id
LEFT JOIN setores s ON s.id = f.id;

-- 2) Analise o diagrama ER e construa uma consulta que retorno os nomes dos setores em ordem crescente pelo nome, e, a quantidade de funcionários de cada setor.
SELECT s.nome
FROM setores s
LEFT JOIN funcionarios f ON f.id = s.id
ORDER BY nome ASC;

-- 3) Analise o diagrama ER e construa uma consulta que retorne os funcionários ordenados pelo nome, apresentando o nome e endereço do funcionário, juntamente
-- com o nome do setor em que cada funcionário trabalha.
SELECT f.nome, f.endereco
FROM funcionarios f
LEFT JOIN setores s ON f.id = s.nome
ORDER BY nome ASC;

-- Correção 
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
codCidade int,
FOREIGN KEY (codCidade) REFERENCES cidade(id)
);

CREATE TABLE cidades (
id int primary key auto_increment,
nome varchar (100)
);

create table funcionarios_setores (
codSetor int primary key auto_increment,
codFuncionario int primary key auto_increment,
FOREIGN KEY (codSetor) REFERENCES setores(id),
FOREIGN KEY (codFuncionario) REFERENCES funcionarios(id),
funcao varchar(100) 
);

CREATE VIEW funcionarios_view AS
SELECT f.id AS funcionario_id, f.nome AS funcionario_nome, c.nome AS cidade_nome, s.nome AS setor_nome
FROM funcionarios f
JOIN cidades c ON f.codCidade = c.id
JOIN funcionarios_setores fs ON f.id = fs.codFuncionario
JOIN setores s ON fs.codSetor = s.id;

SELECT s.nome AS nome_setor, COUNT(fs.codFuncionario) AS quantidade_funcionarios
FROM setores s
LEFT JOIN funcionarios_setores fs ON s.id = fs.codSetor
GROUP BY s.id
ORDER BY s.nome ASC;

SELECT f.nome AS nome_funcionario, f.endereco AS endereco_funcionario, s.nome AS nome_setor
FROM funcionarios f
JOIN funcionarios_setores fs ON f.id = fs.codFuncionario
JOIN setores s ON fs.codSetor = s.id
ORDER BY f.nome ASC;



