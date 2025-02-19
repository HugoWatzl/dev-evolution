-- AULA 21/10

-- EX01
SELECT nomecliente,genero FROM cliente;
-- EX02
SELECT nomeproduto,preco FROM produto;
-- EX03
SELECT idcompra,dtcompra FROM compras;
-- EX04
SELECT nomecliente,cidade,estadocivil FROM cliente;
-- EX05
SELECT * FROM cliente;

-- EX06
SELECT nomecliente,estadocivil FROM cliente
  ORDER BY nomecliente ASC;
-- EX07
SELECT nomeproduto,preco FROM produto
 ORDER BY preco DESC;
-- EX08
SELECT nomecliente FROM cliente
 ORDER BY estado,cidade ASC;
 
-- EX09
SELECT DISTINCT estado FROM cliente;
-- EX10
SELECT DISTINCT dtcompra FROM compras;

-- EX11
SELECT nomeproduto FROM produto
 WHERE preco > 5;
-- EX12
SELECT nomecliente,estadocivil FROM cliente
 WHERE genero = 'F'
 ORDER BY nomecliente ASC;
 -- EX13
 SELECT nomecliente,cidade FROM cliente
  WHERE estado = 'Rio de Janeiro';
-- EX14
SELECT nomecliente FROM cliente
 WHERE dtnascimento < '2004-10-21';
 -- outro metodo de fazer!!
SELECT nomecliente, TIMESTAMPDIFF(YEAR, dtnascimento, CURDATE()) AS idade
 FROM cliente
 WHERE idade > 20
 ORDER BY idade;
-- EX15
SELECT DISTINCT idcliente FROM compras
 WHERE dtcompra BETWEEN '2021-01-01' AND '2021-12-31';
-- EX16
SELECT DISTINCT idcliente FROM compras
 WHERE EXTRACT(YEAR FROM dtcompra) = 2020;

-- EX17
SELECT nomecliente FROM cliente
WHERE nomecliente LIKE 'A%';
-- EX18
SELECT nomecliente FROM cliente
 WHERE nomecliente LIKE '%ana%';
-- EX19
SELECT nomecliente,estadocivil FROM cliente
 WHERE estado IN ('Rio de Janeiro','São Paulo','Minas Gerais','Espirito Santo');
 
-- EX20
SELECT nomecliente,
	CASE 
		WHEN estadocivil = 'D' THEN 'Divorciado'
		WHEN estadocivil = 'V' THEN 'Viuvo'
		WHEN estadocivil = 'C' THEN 'Casado'
		WHEN estadocivil = 'S' THEN 'Solteiro'
        ELSE 'Não localizado'
	END AS estadocivil
FROM cliente;

-- EX21
SELECT p.nomeproduto,m.nomemarca
	FROM produto AS p, marca AS m
  WHERE p.idmarca = m.idmarca;
  
-- EX22
SELECT c.nomecliente, p.nomeproduto
	FROM compras AS co, produto AS p, cliente AS c
  WHERE c.idcliente = co.idcliente
	AND co.idproduto = p.idproduto;
  
-- EX23
SELECT c.nomecliente,c.estado,l.nomeloja,l.uf,co.qtd,p.nomeproduto
	FROM cliente AS c, loja AS l, compras AS co,produto AS p
  WHERE c.idcliente = co.idcliente
  AND co.idloja = l.idloja
  AND co.idproduto = p.idproduto
  AND co.qtd > 40;
  
-- EX24
SELECT produto.nomeproduto, produto.preco,marca.nomemarca
	FROM produto INNER JOIN marca
      ON produto.idmarca = marca.idmarca;
      
-- EX25
SELECT marca.nomemarca, compras.dtcompra, compras.qtd
	FROM marca INNER JOIN produto
      ON marca.idmarca = produto.idmarca
	INNER JOIN compras
      ON compras.idproduto = produto.idproduto;
      
-- EX26
SELECT cliente.nomecliente, produto.nomeproduto, compras.qtd
	FROM produto INNER JOIN compras
      ON produto.idproduto = compras.idproduto
	INNER JOIN cliente
      ON cliente.idcliente = compras.idcliente;
     
     
-- EX27
INSERT INTO cliente
(idcliente,nomecliente,genero,estadocivil,dtnascimento,cidade,estado)
VALUES
(501, 'Alba', 'F', 'V', '1982/10/25', 'Duque de Caxias','Rio de Janeiro'),
(502, 'Solimar', 'F', 'V', '1972/11/25', 'Niterói','Rio de Janeiro'),
(503, 'Pablo', 'M', 'C', '1999/03/01', 'Nova Iguaçu','Rio de Janeiro'),
(504, 'Solange', 'F', 'S', '1979/06/05', 'Salvador', 'Bahia'),
(505, 'Mário', 'M', 'S', '1985/07/22', 'Bragança Paulista', 'São Paulo');

SELECT cliente.nomecliente, compras.idcompra
	FROM cliente LEFT JOIN compras
      ON cliente.idcliente = compras.idcliente
  ORDER BY compras.idcompra;
  
  
-- EX28
INSERT INTO marca (idmarca,nomemarca)
VALUES
(6,'Delícia de Prato'),
(7,'Pajé');

SELECT marca.nomemarca,produto.nomeproduto
	FROM produto RIGHT JOIN marca
      ON marca.idmarca = produto.idmarca;
      
-- EX29
SELECT cliente.nomecliente, marca.nomemarca
	FROM cliente FULL OUTER JOIN compras
      ON cliente.idcliente = compras.idcliente
	FULL OUTER JOIN produto
      ON produto.idproduto = compras.idproduto
	FULL OUTER JOIN marca
      ON produto.idmarca = marca.idmarca;
      
-- EX30
SELECT produto.nomeproduto, marca.nomemarca
	FROM produto NATURAL JOIN marca;