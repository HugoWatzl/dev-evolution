-- EX01
SELECT MAX(preco) FROM produto;

-- EX02
SELECT MIN(qtd) FROM compras;

-- EX03
SELECT ROUND(AVG(qtd),2) FROM compras;

-- EX04
SELECT COUNT(*) FROM cliente
  WHERE estado = 'Rio de Janeiro';
  
-- EX05
SELECT ROUND(AVG(preco),2) AS precomedio 
  FROM produto;

-- EX06
SELECT COUNT(*) FROM compras
	JOIN produto
      ON produto.idproduto = compras.idproduto
	JOIN marca
      ON marca.idmarca = produto.idmarca
	WHERE marca.nomemarca = 'Bom prato';
    
-- EX07
SELECT SUM(compras.qtd) FROM compras
	JOIN loja 
      ON loja.idloja = compras.idloja
  WHERE loja.nomeloja = 'Vale Verde';

-- EX08
SELECT SUM(compras.qtd) FROM compras
	JOIN loja
      ON loja.idloja = compras.idloja
  WHERE loja.uf = 'MG';

-- EX09
SELECT SUM(compras.qtd) FROM compras
	JOIN produto
      ON compras.idproduto = produto.idproduto
  WHERE produto.nomeproduto = 'Macarrão';
  
-- EX10
SELECT SUM(qtd) FROM compras;

-- DQL IMPORTANTE!!

-- EX11
SELECT COUNT(*) AS qtdclientes,cliente.estado FROM cliente
  GROUP BY estado
    ORDER BY estado;
  
-- EX12
SELECT COUNT(*) AS qtdlojas,loja.uf FROM loja
  GROUP BY loja.uf;
  
-- EX13
SELECT COUNT(*) AS qtdprodutos,marca.nomemarca FROM marca
  JOIN produto
    ON produto.idmarca = marca.idmarca
  GROUP BY marca.nomemarca;
  
-- EX14
SELECT SUM(compras.qtd * produto.preco) AS valor, marca.nomemarca FROM marca
	JOIN produto
      ON produto.idmarca = marca.idmarca
	JOIN compras
	  ON compras.idproduto = produto.idproduto
  GROUP BY marca.nomemarca;
  
-- EX15
SELECT ROUND(AVG(compras.qtd),2) AS media,produto.nomeproduto FROM compras
    JOIN produto
      ON compras.idproduto = produto.idproduto
  GROUP BY produto.nomeproduto
  ORDER BY media DESC;
  
-- EX16
SELECT SUM(compras.qtd * produto.preco) AS faturamento,loja.nomeloja
  FROM compras
    JOIN produto
      ON compras.idproduto = produto.idproduto
	JOIN loja
      ON loja.idloja = compras.idloja
  GROUP BY loja.nomeloja
  ORDER BY faturamento DESC;
  
-- EX17
SELECT SUM(compras.qtd) AS qtdporcliente,cliente.nomecliente
  FROM cliente
    JOIN compras
      ON compras.idcliente = cliente.idcliente
  GROUP BY cliente.nomecliente
  ORDER BY qtdporcliente DESC;
  
-- EX18
SELECT COUNT(*) AS qtdcliente, cliente.cidade
  FROM cliente
  GROUP BY cliente.cidade
  ORDER BY qtdcliente DESC
  LIMIT 5;
  
-- EX19
SELECT SUM(compras.qtd) AS qtdprodutos,produto.nomeproduto
  FROM produto
    JOIN compras
      ON compras.idproduto = produto.idproduto
  GROUP BY produto.nomeproduto
  ORDER BY qtdprodutos DESC; 
  
-- EX20 
SELECT SUM(produto.preco * compras.qtd) AS valor, cliente.nomecliente
  FROM cliente
    JOIN compras
      ON compras.idcliente = cliente.idcliente
	JOIN produto
      ON produto.idproduto = compras.idproduto
  GROUP BY cliente.nomecliente
  ORDER BY valor DESC
  LIMIT 5;
  
-- HAVING --
-- EX21
SELECT COUNT(*) AS qtdcliente,cliente.estado
  FROM cliente
  GROUP BY cliente.estado
  HAVING qtdcliente > 50;
  
-- EX22
SELECT SUM(compras.qtd * produto.preco) AS valor, marca.nomemarca FROM marca
	JOIN produto
      ON produto.idmarca = marca.idmarca
	JOIN compras
	  ON compras.idproduto = produto.idproduto
  GROUP BY marca.nomemarca
  HAVING valor>25000;
  
-- EX23
SELECT COUNT(*) AS qtdporcliente,cliente.nomecliente
  FROM cliente
    JOIN compras
      ON compras.idcliente = cliente.idcliente
  GROUP BY cliente.nomecliente
  HAVING qtdporcliente>5;
  
-- EX24
SELECT nomeproduto FROM produto
WHERE preco = 
	(SELECT MAX(preco)
		FROM produto);
        
-- EX25
SELECT nomecliente FROM cliente
  WHERE cliente.idcliente NOT IN (
	SELECT DISTINCT idcliente FROM compras
);

-- EX26!!
SELECT nomeproduto FROM produto
  WHERE produto.idproduto NOT IN (
	SELECT DISTINCT idproduto FROM compras
	  WHERE dtcompra BETWEEN '2021-01-01' AND'2021-12-31'
  );
  
-- EX27
CREATE VIEW vw_produtomarca AS 
SELECT nomeproduto,preco,nomemarca FROM produto
  JOIN marca
    ON marca.idmarca = produto.idmarca
    ORDER BY nomeproduto;
    
-- EX28
CREATE OR REPLACE VIEW vw_compra AS
SELECT co.idcompra
	   ,cl.nomecliente
       ,pr.nomeproduto
       ,ma.nomemarca
       ,lo.nomeloja
       ,co.dtcompra
       ,co.qtd
       ,pr.preco
       ,pr.preco * co.qtd AS valortotal
  FROM cliente AS cl JOIN compras AS co ON co.idcliente = cl.idcliente
    JOIN produto AS pr ON pr.idproduto = co.idproduto
    JOIN loja AS lo ON co.idloja = lo.idloja
    JOIN marca AS ma ON ma.idmarca = pr.idmarca
    ORDER BY co.idcompra;
    
SELECT * FROM vw_compra;

	
	


