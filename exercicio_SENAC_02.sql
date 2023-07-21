create database exercicio;
use exercicio;

CREATE TABLE estados (
codigo INT NOT NULL PRIMARY KEY AUTO_INCREMENT ,
nome VARCHAR(100) NOT NULL
);
CREATE TABLE cidades (
codigo INT NOT NULL PRIMARY KEY AUTO_INCREMENT ,
nome VARCHAR(100) NOT NULL,
codEstado INT DEFAULT 1 ,
FOREIGN KEY (codEstado) REFERENCES estados(codigo)
);
CREATE TABLE pessoas (
codigo INT NOT NULL PRIMARY KEY AUTO_INCREMENT ,
nome VARCHAR(100) NOT NULL ,
altura DOUBLE ,
nascimento DATE DEFAULT '1970-12-25' ,
codCidade INT ,
FOREIGN KEY (codCidade) REFERENCES cidades(codigo)
);
CREATE TABLE pedidos (
codigo INT NOT NULL PRIMARY KEY AUTO_INCREMENT ,
endereco VARCHAR(100) NOT NULL ,
horario DATETIME ,
codCliente INT ,
FOREIGN KEY (codCliente) REFERENCES pessoas(codigo)
);

-- Retornar o horário do pedido, o endereço, nome do cliente, nome da Cidade do
-- cliente e o nome do estado
SELECT p.horario AS "Hórario do pedido", p.endereco AS "Endereço", pe.nome AS "Nome do cliente", c.nome AS "Nome da cidade do cliente", e.nome AS "Nome do Estado"
FROM pedidos p
INNER JOIN pessoas pe ON p.codCliente = pe.codigo
INNER JOIN cidades c ON pe.codCidade = c.codigo
INNER JOIN estados e ON c.codEstado = e.codigo; 