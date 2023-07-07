CREATE DATABASE market;
SHOW DATABASES;
USE market;
create table cliente (
id int primary key auto_increment,
nome varchar(255) not null,
endereco varchar(255) not null,
cidade varchar(255) not null,
cep varchar(9) not null,
uf varchar(2) not null,
cnpj varchar(16) not null,
ie varchar(4)
);


insert into cliente values 
(720,'ANA','RUA 17 N 19','NITEROI','24358310','RJ','1211323/0001-34',2134),
(870,'FLAVIO','AV.PRES. VARGAS 10','SÃO PAULO','22763931','SP','22534126/9387-9',4631),
(110,'JORGE','RUA CAIAPO, 13','CURITIBA','30078500','PR','14512764/9834-9',null),
(222,'LUCIA','RUA ITABIRA 123 LOJA 9','BELO HORIZONTE','22124391','MG','28315213/9348-8',2985),
(830,'MAURICIO','AV PAULISTA 1236 SL2345','SAO PAULO','3012683','SP','32816985/7465-6',9343),
(130,'EDMAR','RUA DA PRAIA SN','SALVADOR','30079300','BA','23463284/234-9',7121),
(410,'RODOLFO','LARGO DA LAPA, 27 - SOBRADO','RIO DE JANEIRO','30078900','RJ','12835128/2346-9',7431),
(20,'BETH','AV. CLIMERIO,45','SÃO PAULO','25679300','SP','32485126/7326/8',9280),
(157,'PAULO','TV. MORAES C/3','LONDRINA','25679301','PR','32848223/324-2',1923),
(180,'LIVIO','AV. BEIRA MAR N 1256','FLORIANOPOLIS','30077500','SC','12736571/2347-4',null),
(260,'SUSANA','RUA LOPES MENDES, 12','NITEROI','30046500','RJ','2176357/232-9','2530'),
(290,'RENATO','RUA MEIRELES, 123 BL.2 SL 345','SÃO PAULO','30225900','SP','13276571/1234-40','1820'),
(390,'SEBASTIÃO','RUA DA IGREJA 10','UBERABA','30438701','MG','3217654/213-3','9071'),
(234,'JOSÉ','QUADRA 3 BL 3 SL 1003','BRASILIA','22841650','DF','21763576/1232-3','2391')
;

create table vendedor (
id int primary key auto_increment,
nome varchar(255)not null,
salario float not null,
comissao varchar(2)
);

insert into vendedor values 
(209,'José',1800,'C'),
(111,'Carlos',2490,'A'),
(11,'João',2780,'C'),
(240,'Antônio',9500,'C'),
(720,'Felipe',4600,'A'),
(213,'Jonas',2300,'A'),
(101,'João',2650,'C'),
(310,'Josias',870,'B'),
(250,'Mauricio',2930,'B');

create table pedido (
id int primary key auto_increment,
prazo int,
idCliente int not null,
idVendedor int not null,
foreign key (idCliente) references cliente(id),
foreign key (idVendedor) references vendedor(id)
);

insert into pedido values 
(121,20,410,209),
(97,20,720,101),
(101,15,720,101),
(137,20,720,720),
(148,20,720,101),
(189,15,870,213),
(104,30,110,101),
(203,30,830,250),
(98,20,410,209),
(143,30,20,111),
(105,15,180,240),
(111,20,260,240),
(103,20,260,11),
(91,20,260,11),
(138,20,260,11),
(108,15,290,310),
(119,30,390,250),
(127,10,410,11);

create table produto (
id int primary key auto_increment,
unidade varchar(20) not null,
descricao varchar (255) not null,
valor float not null
);

INSERT INTO produto values 
(25,'KG','QUEIJO',0.97),
(31,'BAR','CHOCOLATE',0.87),
(78,'L','VINHO',2),
(22,'M','LINHO',0.11),
(30,'SAC','AÇUCAR',0.3),
(53,'M','LINHA',1.8),
(13,'G','OURO',6.18),
(45,'M','MADEIRA',0.25),
(87,'M','CANO',1.97),
(77,'M','PAPEL',1.05);


create table item_pedido (
idPedido int,
idProduto int,
qtde int,
foreign key(idPedido) references pedido (id),
foreign key(idProduto) references produto(id)
);

insert into item_pedido values (121,25,10),
(121,31,35),
(97,77,20),
(101,31,9),
(101,78,18),
(101,13,5),
(98,77,5),
(148,45,8),
(148,31,7),
(148,77,3),
(148,25,10),
(148,78,30),
(104,53,32),
(203,31,6),
(189,78,45),
(143,31,20),
(143,78,10),
(105,78,10),
(111,25,10),
(111,78,70),
(103,53,37),
(91,77,40),
(138,22,10),
(138,77,35),
(138,53,18),
(108,13,17),
(119,77,40),
(119,13,6),
(119,22,10),
(119,53,43),
(137,13,8);



-- 1) 
-- Listar todos os produtos com as respectivas descrições, unidades e 
-- valores unitários, obtendo o seguinte resultado 
-- (SELECT simples sem WHERE com especificação de todos os campos):

SELECT descricao AS Descrição , unidade AS Unidade, valor AS 'Valor Unitário'
FROM produto;

-- 2) Listar da tabela CLIENTE o CNPJ, o nome do cliente e seu endereço, obtendo o seguinte
-- resultado (idem com especificação de parte dos campos): 
SELECT cnpj AS CNPJ, nome AS "Nome do Cliente", endereco AS "Endereço" from  cliente;

-- 3) Listar todo o conteúdo de vendedor, obtendo o seguinte resultado
-- (SELECT sem a especificação de campos – coringa *):  
SELECT * FROM vendedor;

SELECT id, nome, FORMAT( salario , 2) AS salário , comissao AS comissão 
FROM vendedor;

-- 4) Problema: Listar o numero do pedido, o código do produto e a 
-- quantidade dos itens do pedido com a quantidade igual a 35 da tabela 
-- item de pedido, obtendo o seguinte resultado (SELECT com WHERE): 
SELECT idPedido AS 'Número do Pedido' , idProduto AS 'Código do Produto', qtde 
FROM item_pedido 
WHERE qtde = 35;

-- 5) Quais são os clientes que moram em Niterói
SELECT nome AS "Nome do Cliente" FROM cliente WHERE cidade = "niteroi";


-- 6) . Listar os produtos que tenham unidade igual a ‘M’ e valor unitário 
-- igual a R$ 1,05 da tabela produto, obtendo o seguinte resultado (operadores lógicos): 
SELECT * 
FROM produto 
WHERE unidade = 'M' AND ABS( valor - 1.05) < 0.01 ; 
-- WHERE unidade = 'M' AND (valor >= 1.04 OR valor <= 1.05) ;
-- WHERE unidade = 'M' AND valor = 1.05;
ALTER TABLE produto CHANGE valor 
valor FLOAT NOT NULL;

-- 7. Listar o código e a descrição dos produtos que tenham o 
-- valor unitário na faixa de R$ 0,32 até R$2,00, obtendo o 
-- seguinte resultado (operador between):
SELECT id AS "Código do Produto", descricao AS "Descrição", valor
FROM produto
WHERE valor BETWEEN 0.32 AND 2.0;

-- 8. Listar todos os produtos que tenham o seu nome começando por Q, 
-- obtendo o seguinte resultado (operador LIKE, com os coringas _ - um caractere - e % - vários caracteres): 
SELECT id, descricao
FROM produto
WHERE descricao LIKE 'Q%';

-- 9. Listar os vendedores que não começam por ‘Jo’, , obtendo o seguinte resultado (operador LIKE,
-- com os coringas _ - um caractere - e % - vários caracteres)
SELECT id, nome
FROM vendedor
WHERE nome NOT LIKE 'Jo%';

-- 10. Listar os vendedores que são da faixa de comissão A e B, obtendo o seguinte resultado
-- (operadores IN e um conjunto de valores): 
SELECT nome AS "Nome do Vendedor"
FROM vendedor
WHERE comissao IN ('A', 'B');

-- 11. Mostrar os clientes que não tenham inscrição estadual, obtendo o seguinte resultado (IS NULL):
SELECT *
FROM cliente
WHERE ie is null;

-- 12. Mostrar em ordem alfabética a lista de vendedores e seus respectivos salários fixos, obtendo o
-- seguinte resultado (ORDER BY [ASC/DESC]): 
SELECT salario
FROM vendedor
ORDER BY salario DESC;

-- 13.Listar os nomes, cidades e estados de todos os clientes, ordenados por estado e cidade de forma
-- descendente, obtendo o seguinte resultado (operador ORDER BY com mais de um campo
-- especificado): 
SELECT nome, cidade, uf
FROM cliente
ORDER BY uf, cidade, nome ASC;

-- 14. Mostrar a descrição e o valor unitário de todos os produtos que tenham 
-- a unidade ‘KG’, em ordem de valor unitário ascendente, obtendo o seguinte resultado (ORDER BY)
SELECT descricao, valor
FROM produto 
WHERE unidade = 'M' 
ORDER BY valor ASC;

-- 15. Mostrar o novo salário fixo dos vendedores, de faixa de 
-- comissão ‘C’, calculado com base no reajuste de 75% acrescido 
-- de R$ 120,00 de bonificação. 
-- Ordenar pelo nome do vendedor, obtendo
-- o seguinte resultado (coluna calculda): 
USE market;
SELECT id, nome, ( (salario * 1.75) + 120.00 ) AS novoSalario , 
		comissao
FROM vendedor
WHERE comissao = 'C'
ORDER BY nome, salario;

-- 16. Mostrar o menor e o maior salários da tabela vendedores,
--  obtendo o seguinte resultado (funções MAX() e MIN()): 
SELECT 	MIN( salario ) AS 'Menor Salário' , 
		MAX( salario ) AS 'Maior Salario'
FROM vendedor;

-- 16.2 Montrar o nome e o salário dos vendedores que recebem 
-- o mínimo e o máximo 
SELECT 	nome, salario
FROM vendedor
WHERE 	salario = ( SELECT MIN(salario) FROM vendedor ) 
			OR 
		salario = ( SELECT MAX(salario) FROM vendedor );
        

-- Quais clientes realizaram pedidos
SELECT c.id, c.nome
FROM cliente c
WHERE  EXISTS ( SELECT * FROM pedido p WHERE p.idCliente = c.id);

SELECT DISTINCT c.id, c.nome
FROM cliente c
INNER JOIN pedido p ON c.id = p.idCliente;
-- WHERE  EXISTS ( SELECT * FROM pedido p WHERE p.idCliente = c.id);

-- Quantos clientes realizaram pedidos
SELECT COUNT(c.id)
FROM cliente c
WHERE  EXISTS ( SELECT * FROM pedido p WHERE p.idCliente = c.id);


-- 17)  Mostrar a quantidade total pedida para o produto ‘VINHO’ 
-- de código ‘78’ na tabela item de pedido, obtendo o seguinte 
-- resultado (função SUM() com cláusula WHERE): 

SELECT SUM( qtde ) AS "Vinhos vendidos"
FROM item_pedido
WHERE idProduto = 78;


SELECT * FROM vendedor order by salario;

-- 20. Quais são as unidades de produtos, diferentes, na tabela produto (cláusula DISTINCT)
SELECT DISTINCT unidade
FROM produto;

-- 21) Listar a quantidade de produtos que cada pedido contém.
SELECT  COUNT(*), idPedido
FROM item_pedido
GROUP BY idPedido;

-- 21.2) Listar a quantidade de produtos que cada pedido contém, 
-- retornando o nome do cliente
SELECT COUNT(*), ip.idPedido, c.nome
FROM item_pedido ip
INNER JOIN pedido p ON p.id = ip.idPedido
INNER JOIN cliente c ON c.id = p.idCliente
GROUP BY ip.idPedido;

-- 22. Listar os pedidos que tem mais de três produtos. 
SELECT  COUNT(*) AS cont, idPedido
FROM item_pedido
-- WHERE idPedido > 100
GROUP BY idPedido
HAVING cont > 3 AND idPedido > 100;


SELECT * FROM CLIENTE;
-- consultar os nomes dos clientes 1, 20, 157, 250, 290
SELECT * 
FROM cliente 
-- WHERE id = 1 OR id = 20 OR id = 157 ...
WHERE id IN ( 1, 20, 157, 250, 290 );


-- Criar uma VIEW que liste os pedidos, retornando também o nome do 
-- cliente, o nome do vendedor e a quantidade de produtos do pedido
CREATE OR REPLACE VIEW listarPedidos AS
SELECT p.id, p.prazo, c.nome AS cliente, COUNT(*) AS cont, v.nome AS vendedor, 
-- 		CONCAT( "R$ " , FORMAT( SUM( pr.valor * ip.qtde) , 2 ) ) AS Total
		FORMAT( SUM( pr.valor * ip.qtde) , 2 )  AS Total
FROM item_pedido ip
INNER JOIN pedido p ON p.id = ip.idPedido
INNER JOIN cliente c ON c.id = p.idCliente
INNER JOIN vendedor v ON v.id = p.idVendedor
INNER JOIN produto pr ON pr.id = ip.idProduto
GROUP BY ip.idPedido;


SELECT * FROM listarPedidos;


-- 23.Ver os pedidos de cada cliente, listando nome do cliente e número do pedido (INNER JOIN)
SELECT c.nome AS nome_cliente, p.id AS numero_pedido
FROM cliente c 
INNER JOIN pedido p ON c.id = p.idCliente;

-- 24.. Listar a junção de clientes com pedidos (CROSS JOIN). 
SELECT c.nome AS nome_cliente, p.id AS numero_pedido
FROM cliente c
CROSS JOIN pedido p;

-- 25. . Listar todos os clientes com seus respectivos pedidos. Os clientes que não têm pedidos também
-- devem ser apresentados (OUTER JOIN)
SELECT c.nome AS nome_cliente, p.id AS numero_pedido
FROM cliente c
LEFT OUTER JOIN pedido p ON c.id = p.idCliente;

-- 26. Clientes com prazo de entrega superior a 15 dias e que pertençam aos estados de São Paulo ou Rio
-- de Janeiro (INNER JOIN com WHERE)
SELECT c.nome AS nome_cliente, p.prazo
FROM cliente c
INNER JOIN pedido p ON c.id = p.idCliente
WHERE p.prazo > 15
  AND c.uf IN ('SP', 'RJ');
  
-- 33. Quais os clientes da cidade Rio de Janeiro e Niterói que tiveram seus pedidos tirados pelo
-- vendedor João? 
SELECT c.nome AS nome_cliente
FROM cliente c
INNER JOIN pedido p ON c.id = p.idCliente
INNER JOIN vendedor v ON p.idVendedor = v.id
WHERE (c.cidade = 'Rio de Janeiro' OR c.cidade = 'Niterói')
  AND v.nome = 'João';

-- 35. Quais os vendedores ganham um salário fixo abaixo da média? 
SELECT nome 
FROM vendedor
WHERE salario < (
					SELECT AVG( salario ) FROM vendedor
				);




 -- CREATE TABLE pessoa (
-- 	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT ,
--     nome VARCHAR(100) NOT NULL ,
--     altura DOUBLE DEFAULT 1.5 ,
--     nascimento DATE DEFAULT '1980-01-20' ,
--     cidade_id INT NOT NULL ,
--     FOREIGN KEY (cidade_id) REFERENCES cidade(id)
-- );

-- ALTER TABLE pessoa CHANGE nome 
-- nome VARCHAR(100) NULL;

-- ALTER TABLE pessoa CHANGE nome 
-- nomePessoa VARCHAR(100) NULL;

-- ALTER TABLE pessoa ADD COLUMN peso DOUBLE ;
