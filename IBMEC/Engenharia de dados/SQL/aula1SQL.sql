-- Aula01
USE escola;
-- 01
CREATE TABLE aluno(
	matricula int PRIMARY KEY,
    nomealuno varchar(30),
    sexo char(1),
    dtNascimento date
);

-- 02
CREATE TABLE departamento(
	codDepto int PRIMARY KEY,
    nomeDepto varchar(30)
);

-- 03
CREATE TABLE curso(
codCurso int PRIMARY KEY,
nomeCurso varchar(30),
cargaHoraria int,
preco real,
codDepto int,
FOREIGN KEY (codDepto) REFERENCES departamento(codDepto)
);

-- 04
CREATE TABLE matricula(
matricula int,
codCurso int,
dtMatricula date,
PRIMARY KEY (matricula,codCurso),
FOREIGN KEY (matricula) REFERENCES aluno(matricula),
FOREIGN KEY (codCurso) REFERENCES curso(codCurso)
);

-- 05
CREATE TABLE func(
codfunc int PRIMARY KEY,
nomefunc varchar(20),
city varchar(20),
CBO int,
UF char(2),
codDepto int,
FOREIGN KEY (codDepto) REFERENCES departamento(codDepto)
);
-- 06
ALTER TABLE func RENAME COLUMN city TO cidade;
-- 07
ALTER TABLE func ADD COLUMN sexo char(1);
-- 08
ALTER TABLE func MODIFY COLUMN nomefunc varchar(30);
-- 09
ALTER TABLE func DROP COLUMN CBO;
-- 10
ALTER TABLE func ALTER COLUMN UF SET DEFAULT 'RJ';
-- 11
ALTER TABLE func RENAME TO funcionario;
-- 12
ALTER TABLE funcionario MODIFY COLUMN nomefunc varchar(30) NOT NULL;
-- 13
ALTER TABLE funcionario MODIFY COLUMN codfunc int AUTO_INCREMENT;

-- 14
CREATE TABLE telefone(
codtel int auto_increment PRIMARY KEY,
ddd int,
numero varchar(13),
codfunc int,
FOREIGN KEY (codfunc) REFERENCES funcionario(codfunc)
);
-- 15
DROP TABLE funcionario;
-- 16
DROP TABLE telefone;


-- Aula02

-- 17
INSERT INTO aluno (matricula,nomealuno,sexo,dtNascimento) 
VALUES(1,'Ana','F','1979-01-23'),
(2,'André','M','1980-11-20'),
(3,'Andreia','F','1985-05-09'),
(4,'Bruna','F','1980-11-20'),
(5,'Bruno','M','1982-01-12');

SELECT * FROM aluno;

SELECT nomealuno
FROM aluno
WHERE sexo = 'F';

-- 18
INSERT INTO departamento(codDepto,nomeDepto) 
VALUES(1,'TI'),
(2,'ADM');

SELECT * FROM departamento;

-- 19
INSERT INTO curso(codCurso,nomeCurso,cargaHoraria,preco,codDepto)
VALUES(1,'Python',40,1200,1),
(2, 'Power BI', 20, 900, 1),
(3, 'Pentaho', 40, 1200, 1),
(4, 'Recursos Humanos', 60, 2000, 2),
(5, 'Marketing', 80, 2500, 1);

SELECT * FROM curso;

SELECT nomecurso,preco 
FROM curso 
WHERE preco>1200;

-- 20
INSERT INTO matricula(matricula,codCurso,dtMatricula)
VALUES
(1,1,'2019-04-01'),
(2,1,'2019-04-01'),
(4,1,'2019-04-01'),
(4,2,'2019-04-02'),
(5,2,'2019-04-02'),
(1,2,'2019-04-02'),
(1,3,'2019-04-03'),
(5,3,'2019-04-03'),
(3,3,'2019-04-03'),
(2,3,'2019-04-03'),
(4,3,'2019-04-03'),
(5,4,'2019-04-04'),
(3,4,'2019-04-04'),
(5,5,'2019-04-06'),
(3,5,'2019-04-06'),
(2,5,'2019-04-06');

SELECT COUNT(*) FROM matricula;

-- 21
INSERT INTO funcionario(codfunc,nomefunc,cidade,UF,codDepto,sexo)
VALUES
(1, 'Paulo', 'Duque de Caxias', 'RJ', 1, 'M'),
(2, 'Paula', 'Rio de Janeiro', 'RJ', 2,'F'),
(3, 'José', 'Rio de Janeiro', 'RJ', 1, 'M');

SELECT * FROM funcionario;

-- 22
SELECT nomefunc,sexo FROM funcionario WHERE cidade='Rio de Janeiro';

-- 23
UPDATE curso SET preco = 1000
 WHERE nomeCurso = 'Power BI';

-- 24
UPDATE curso SET codDepto = 2
 WHERE nomeCurso = 'Marketing';
 
-- 25
UPDATE curso SET cargaHoraria = 80
 WHERE nomeCurso = 'Recursos Humanos';
 
-- 26
UPDATE curso SET preco = preco*1.2
 WHERE codDepto = 1;
SELECT * FROM curso;

-- 27
UPDATE curso SET preco = preco - 50
 WHERE codDepto = 1;
 
-- 28
UPDATE curso SET preco = preco*0.9
 WHERE cargaHoraria < 80 AND preco > 1000;
 
-- 29
DELETE FROM funcionario;

-- 30
DELETE FROM matricula
 WHERE dtMatricula > '2019-04-04' AND matricula = 3;
