CREATE DATABASE exercicio_04;
USE exercicio_04;

CREATE TABLE estado (
codigo int primary key auto_increment,
nome varchar (100)
);

CREATE TABLE cidades (
codigo int primary key auto_increment,
nome varchar (100),
codEstado int,
FOREIGN KEY (codEstado) REFERENCES estado(codigo)
);

CREATE TABLE pessoas (
codigo int primary key auto_increment,
nome varchar (100),
altura float,
nascimento int,
codCidade int,
FOREIGN KEY (codCidade) REFERENCES cidades(codigo)
);

CREATE TABLE pedidos(
codigo int primary key auto_increment,
horario datetime default now(),
endereco varchar(100) not null,
codCliente int,
FOREIGN KEY (codCliente) REFERENCES pessoas(codigo)
);

-- 1) Construa uma consulta que retorna a quantidade de pessoas de cada cidade e
-- o nome da cidade, independente se a cidade possui moradores.

SELECT c.nome AS nome_cidade, COUNT(p.codigo) AS quantidade_pessoas
FROM cidades c
LEFT JOIN pessoas p ON c.codigo = p.codCidade
GROUP BY c.codigo;

-- 2) Construa uma consulta que retorna a quantidade de pessoas de cada cidade e
-- o nome da cidade, apenas das cidades que possuem moradores.
SELECT c.nome AS nome_cidade, COUNT(p.codigo) AS quantidade_pessoas
FROM cidades c
INNER JOIN pessoas p ON c.codigo = p.codCidade
GROUP BY c.codigo;

-- 3)Construa uma consulta que retorna a quantidade de pessoas de cada cidade e
-- o nome da cidade, mas apenas das cidades que possuem mais de 10
-- moradores.
SELECT c.nome AS nome_cidade, COUNT(p.codigo) AS quantidade_pessoas
FROM cidades c
INNER JOIN pessoas p ON c.codigo = p.codCidade
GROUP BY c.codigo
HAVING COUNT(p.codigo) > 10;

-- 4) Construa uma consulta que retorna a quantidade de pessoas de cada cidade e
-- o nome da cidade, mas apenas das cidades que pertencem ao estado com
-- código = 1 e com mais de 1000 moradores.
SELECT c.nome AS nome_cidade, COUNT(p.codigo) AS quantidade_pessoas
FROM cidades c
INNER JOIN pessoas p ON c.codigo = p.codCidade
WHERE c.codEstado = 1
GROUP BY c.codigo
HAVING COUNT(p.codigo) > 1000;

-- 5) Construa uma consulta que retorna os nomes cada pessoa, que já fez pelo
-- menos um pedido.
SELECT p.nome
FROM pessoas p
INNER JOIN pedidos pd ON pd.codCliente = p.codigo;
