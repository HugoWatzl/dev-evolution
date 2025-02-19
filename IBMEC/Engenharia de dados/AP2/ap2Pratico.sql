/* GRUPO 3
INTEGRANTES:
1- João Gabriel Tasca
2- Hugo Faria
3- Miguel Veiga
4- João Batomarco
*/
USE ap2pratico;

-- DDL
CREATE TABLE cliente(
	codcliente int PRIMARY KEY,
    nomecliente varchar(50),
    cidadecliente varchar(50),
    estadocliente char(2),
    generocliente char(1),
    estadocivilcliente char(1),
    dtnascimentocliente date
);

CREATE TABLE funcionario(
	codfuncionario int PRIMARY KEY,
    nomefuncionario varchar(50),
    cidadefuncionario varchar(50),
    estadofuncionario char(2),
    generofuncionario char(1),
    estadocivilfuncionario char(1),
    cargo varchar(50)
);

CREATE TABLE fabricante(
	codfabricante int PRIMARY KEY,
    nomefabricante varchar(50),
    site varchar(50),
    email varchar(50)
);

CREATE TABLE produto(
	codproduto int PRIMARY KEY,
    nomeproduto varchar(50),
    descricao text,
    preco double,
    codfabricante int,
    FOREIGN KEY (codfabricante) REFERENCES fabricante(codfabricante)
);

CREATE TABLE compra(
	codcompra int PRIMARY KEY,
    hora time,
    dtcompra date,
    codcliente int,
    codfuncionario int,
    FOREIGN KEY (codcliente) REFERENCES cliente(codcliente),
    FOREIGN KEY (codfuncionario) REFERENCES funcionario(codfuncionario)
);

CREATE TABLE compra_produto(
	codcompra int,
    codproduto int,
    qtd int,
    valordesconto double,
    PRIMARY KEY (codcompra, codproduto),
    FOREIGN KEY (codcompra) REFERENCES compra(codcompra),
    FOREIGN KEY (codproduto) REFERENCES produto(codproduto)
);

-- DML
INSERT INTO cliente (codcliente, nomecliente, cidadecliente, estadocliente, generocliente, dtnascimentocliente, estadocivilcliente)
VALUES (1, 'Maria Silva', 'São Paulo', 'SP', 'F', '1990-05-10', 'S'),
       (2, 'João Oliveira', 'Rio de Janeiro', 'RJ', 'M', '1985-08-15', 'C'),
       (3, 'Carlos Pereira', 'Belo Horizonte', 'MG', 'M', '1992-02-25', 'S'),
       (4, 'Fernanda Lima', 'Porto Alegre', 'RS', 'F', '1988-11-30', 'C'),
       (5, 'Juliana Costa', 'Recife', 'PE', 'F', '1995-07-15', 'S');

INSERT INTO funcionario (codfuncionario, nomefuncionario, cidadefuncionario, estadofuncionario, generofuncionario, estadocivilfuncionario, cargo)
VALUES (1, 'Pedro Santos', 'São Paulo', 'SP', 'M', 'C', 'Vendedor'),
       (2, 'Ana Souza', 'Curitiba', 'PR', 'F', 'S', 'Gerente'),
       (3, 'Marcos Silva', 'Fortaleza', 'CE', 'M', 'C', 'Atendente'),
       (4, 'Bianca Oliveira', 'Manaus', 'AM', 'F', 'S', 'Supervisora'),
       (5, 'Roberto Lima', 'Brasília', 'DF', 'M', 'D', 'Vendedor');

INSERT INTO fabricante (codfabricante, nomefabricante, email, site)
VALUES (1, 'Fabrica ABC', 'contato@fabricaabc.com', 'www.fabricaabc.com'),
       (2, 'Fabrica XYZ', 'contato@fabricaxyz.com', 'www.fabricaxyz.com'),
       (3, 'Fabrica OPQ', 'contato@fabricaopq.com', 'www.fabricaopq.com'),
       (4, 'Fabrica LMN', 'contato@fabricalmn.com', 'www.fabricalmn.com'),
       (5, 'Fabrica DEF', 'contato@fabricadef.com', 'www.fabricadef.com');

INSERT INTO produto (codproduto, nomeproduto, descricao, preco, codfabricante)
VALUES (1, 'Produto A', 'Descrição do Produto A', 100.00, 1),
       (2, 'Produto B', 'Descrição do Produto B', 200.00, 2),
       (3, 'Produto C', 'Descrição do Produto C', 150.00, 3),
       (4, 'Produto D', 'Descrição do Produto D', 300.00, 4),
       (5, 'Produto E', 'Descrição do Produto E', 250.00, 5),
       (6, 'Produto F', 'Descrição do Produto F', 120.00, 1);

INSERT INTO compra (codcompra, dtcompra, hora, codcliente, codfuncionario)
VALUES (1, '2024-11-11', '10:00:00', 1, 1),
       (2, '2024-11-12', '15:30:00', 2, 2),
       (3, '2024-11-13', '09:30:00', 3, 2),
       (4, '2024-11-14', '14:00:00', 4, 4),
       (5, '2024-11-15', '17:45:00', 5, 3),
       (6, '2024-11-16', '11:20:00', 1, 5);

INSERT INTO compra_produto (codcompra, codproduto, qtd, valordesconto)
VALUES (1, 1, 2, 10.00),
       (1, 2, 1, 20.00),
       (2, 3, 2, 15.00),
       (3, 2, 1, 10.00),
       (3, 4, 2, 25.00),
       (4, 1, 1, 5.00),
       (5, 5, 4, 30.00),
       (5, 6, 3, 20.00),
       (6, 3, 5, 40.00),
       (6, 1, 2, 10.00);

-- DQL       
SELECT * FROM cliente;
SELECT * FROM funcionario;
SELECT * FROM fabricante;
SELECT * FROM produto;
SELECT * FROM compra;
SELECT * FROM compra_produto;

-- a)	Recupere o nome, a cidade e o estado dos clientes da região sudeste
Select nomecliente, cidadecliente, estadocliente
from cliente
where estadocliente IN('RJ','MG','SP','ES');

-- b)	Recupere o nome dos clientes que possuem “Maria” no nome
Select nomecliente
from cliente
where nomecliente like '%maria%';

-- c)	Recupere o nome dos clientes que realizaram compras no ano de 2024
select nomecliente
from cliente as cl
join compra as cm
on cm.codcliente = cl.codcliente
where dtcompra between '2024-01-01' and '2024-12-31';

-- d)	Recupere o nome do cliente, o nome do funcionário e o produto que ele comprou
select cl.nomecliente, fu.nomefuncionario, pr.nomeproduto
from compra as cm
join funcionario as fu
on fu.codfuncionario = cm.codfuncionario
join compra_produto as cp
on cp.codcompra = cm.codcompra
join produto as pr
on pr.codproduto = cp.codproduto
join cliente as cl
on cm.codcliente = cl.codcliente;

-- e)	Recupere o total de funcionários por cidade
select count(*) as totalfunc, cidadefuncionario
from funcionario
group by cidadefuncionario
order by totalfunc desc;

-- f)	Recupere os 5 clientes que realizaram mais compras
select c.nomecliente, c.codcliente, count(*) as totalcompras
from compra as cm
join cliente as c
on c.codcliente = cm.codcliente
group by c.codcliente
order by totalcompras desc
limit 5;

-- g)	Recupere o total de produtos por fabricante
select f.nomefabricante, count(*) as totalprodutos
from compra_produto as cp
join produto as p
on cp.codproduto = p.codproduto
join fabricante as f
on f.codfabricante = p.codfabricante
group by f.nomefabricante
order by totalprodutos desc;

-- h)	Recupere a lista de produtos que nunca foram vendidos
-- INSERT INTO produto VALUES(7,'Produto G','Descrição do Produto G', 66.66, 4);
-- Foi inserido para ele exibir um produto que não foi vendido
select p.nomeproduto
from compra as cm
join compra_produto as cp
on cp.codcompra = cm.codcompra
right join produto as p
on cp.codproduto = p.codproduto
where cp.codcompra is null;

-- i)	Recupere a quantidade de compras realizadas por cada cliente
select c.nomecliente, count(*) as qntcompra
from compra as cm
join cliente as c
on c.codcliente = cm.codcliente
group by c.nomecliente
order by qntcompra desc;

-- j)	Recupere o valor total de descontos aplicados
select sum(cp.valordesconto*cp.qtd) as totaldesconto
from compra_produto as cp
join produto as p
on cp.codproduto = p.codproduto;
