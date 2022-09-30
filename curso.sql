
/*  Criando Banco  */
CREATE DATABASE teste_tipo_dados;
USE teste_tipo_dados;


/*  Criando tabelas */
CREATE TABLE produtos(
nome VARCHAR(50),
sku CHAR(5),
informacoes MEDIUMTEXT
);

SHOW TABLES;

CREATE TABLE cadastro(
nome VARCHAR(100),
sobrenome VARCHAR(100)
);


/*  Inserindo Valores nas tabelas  */
SHOW TABLES;
INSERT INTO cadastro(nome,sobrenome) VALUES("Luis", "felipe");
INSERT INTO produtos(nome,sku,informacoes) VALUES("PS5","psps","VIDEO-GAME");
INSERT INTO produtos(nome,sku,informacoes) VALUES("caixa", "am58", "Armario Grande");

SELECT * FROM produtos;
SELECT * FROM cadastro;
SELECT * FROM produtos;


/*  Numericos  */
CREATE TABLE servidores (
nome VARCHAR(100),
espaco_disco INT(10),
ligado BOOL

);

INSERT INTO servidores(nome,espaco_disco,ligado) VALUES("Servidor 1", 123123123, 0);
SELECT * FROM servidores;
INSERT INTO servidores (nome,espaco_disco,ligado) VALUES ("Servidor 2",123123123,1);
SELECT * FROM servidores;


/*  Date  */ 
CREATE TABLE aniversarios(
nome VARCHAR(100),
data_nascimento DATE
);

INSERT INTO aniversarios(nome, data_nascimento) VALUES ("Luis Felipe","1996-10-18");
SELECT * FROM aniversarios;


/*  Adicionar (ADD COLUMN), Remover (DROP COLUMN) e Modificar uma coluna */

CREATE TABLE funcionarios (
nome VARCHAR(100)
);

ALTER TABLE funcionarios ADD COLUMN sobrenome VARCHAR(100);
SELECT * FROM funcionarios;
INSERT INTO funcionarios (nome,sobrenome) VALUES ("Luis","Felipe");
SELECT * FROM funcionarios;
ALTER TABLE funcionarios ADD COLUMN cpf CHAR(11);
ALTER TABLE funcionarios ADD COLUMN funcionario_ativo BOOL;
INSERT INTO funcionarios (nome,sobrenome,cpf,funcionario_ativo) VALUES ("Pedro", "Antonio", "43682573836",0);
SELECT * FROM funcionarios;

ALTER TABLE funcionarios DROP COLUMN sobrenome;
SELECT * FROM funcionarios;

ALTER TABLE funcionarios ADD COLUMN data_nascimento VARCHAR (100);
ALTER TABLE funcionarios MODIFY COLUMN data_nascimento DATE;
SELECT * FROM funcionarios;

DROP TABLE funcionarios;
DROP TABLE funcionarios;
DROP TABLE cadastro;



/*  Trabalhando com CRUD  */ 

CREATE DATABASE cadastro;
USE cadastro;

CREATE TABLE pessoas(
nome VARCHAR (100),
rg VARCHAR (7),
cpf VARCHAR(11),
limite INT(10)

);
SELECT * FROM pessoas;

INSERT INTO pessoas (nome,rg,cpf,limite) VALUES ("Luis","5653789","43682672836",10000);
INSERT INTO pessoas (nome,rg,cpf,limite) VALUES ("Maria","5653700","43682672836",15000);
INSERT INTO pessoas (nome,rg,cpf,limite) VALUES ("Pedro","5653789","43682672836",1000);
INSERT INTO pessoas (nome,rg,cpf,limite) VALUES ("Ricardo","5651289","43682672836",9000);
INSERT INTO pessoas (nome,rg,cpf,limite) VALUES ("Carmem","5678789","43682672836",25000);
 
SELECT * FROM pessoas;
SELECT nome,rg,limite FROM pessoas;
SELECT * FROM pessoas WHERE nome = "Pedro";

SET SQL_SAFE_UPDATES=0;
UPDATE pessoas SET limite =10000 WHERE nome = "Carmem";
UPDATE pessoas SET rg ="123", cpf ="321"  WHERE nome = "Pedro";
SELECT * FROM pessoas;
SET SQL_SAFE_UPDATES=1;

SET SQL_SAFE_UPDATES=0;
DELETE FROM pessoas WHERE nome = "Pedro";
SELECT * FROM pessoas;
SET SQL_SAFE_UPDATES=1;

SET SQL_SAFE_UPDATES=0;
DELETE FROM pessoas WHERE limite > 2000;
SELECT * FROM pessoas;
SET SQL_SAFE_UPDATES=1;

/*  Trabalhando com SELECT  */ 

USE employees;
SELECT * FROM employees WHERE emp_no = 491008;
SELECT * FROM salaries WHERE salary <= 65000;
SELECT * FROM salaries WHERE salary >= 150000;
SELECT * FROM titles WHERE emp_no >=11500;


SELECT DISTINCT gender FROM employees;
SELECT DISTINCT title FROM titles;


SELECT * FROM 	salaries  WHERE salary> 150000 AND from_date > "19918-12-12" AND emp_no > 10800;
SELECT * FROM titles WHERE title = "Senior Engineer" || title = "Staff" || emp_no > 12500 ORDER BY emp_no DESC;
SELECT * FROM titles WHERE NOT title = "Senior Engineer" AND NOT title = "Senior Staff";


SELECT * FROM salaries ORDER BY salary DESC;
SELECT * FROM salaries ORDER BY from_date ASC;

SELECT * FROM titles ORDER BY title DESC LIMIT 15;
SELECT * FROM salaries ORDER BY salary DESC LIMIT 10;

SELECT MIN(salary) AS menor_salario FROM salaries;
SELECT MAX(salary) AS maior_salario FROM salaries;

SELECT COUNT(*) FROM salaries WHERE salary > 100000;
SELECT COUNT(*) AS Homens FROM employees WHERE gender = "M";
SELECT COUNT(*) FROM departments;

SELECT AVG(salary) AS Media FROM salaries WHERE salary > 100000;
SELECT AVG(salary) AS Media FROM salaries;

SELECT SUM(salary) AS SOMA FROM salaries;
SELECT SUM(salary) AS SOMA FROM salaries WHERE salary< 50000;

SELECT * FROM employees WHERE first_name LIKE "%ber" AND gender = "F";
SELECT * FROM employees WHERE last_name LIKE "%Mc%";
SELECT * FROM titles WHERE title LIKE "%Engineer%";

SELECT * FROM dept_emp WHERE dept_no IN ("d004","d005","d006");
SELECT * FROM dept_emp WHERE dept_no IN ("d004","d005","d006") ORDER BY dept_no DESC;
SELECT * FROM employees WHERE last_name IN ("Facello","Peac") AND gender = "F";

SELECT * FROM dept_emp WHERE dept_no BETWEEN "d001" AND "d004";
SELECT * FROM dept_emp WHERE dept_no BETWEEN "d001" AND "d004" ORDER BY dept_no DESC;
SELECT * FROM salaries WHERE salary BETWEEN 150000 AND 225000; 



/*  Trabalhando com CONSTRAINTS  */ 

CREATE DATABASE constraints;
USE constraints;

CREATE TABLE pessoas (
	nome VARCHAR(100) NOT NULL,
	idade INT
);

INSERT INTO pessoas (nome,idade) VALUES ("Luis",25);
SELECT *FROM pessoas;
INSERT INTO pessoas (nome,idade) VALUES (NULL,25);

ALTER TABLE pessoas ADD COLUMN email VARCHAR (255) UNIQUE;
INSERT INTO pessoas VALUES ("Maria", 25, "maria@gmail.com");
SELECT * FROM pessoas;
INSERT INTO pessoas VALUES ("Maria Clara", 25, "maria@gmail.com");


CREATE TABLE produtos (
		id INT NOT NULL,
        nome VARCHAR (255),
        sku VARCHAR (10),
        PRIMARY KEY (id)
);

INSERT INTO produtos VALUES (1,"Batedeira", "PMR$");
INSERT INTO produtos VALUES (NULL,"Fogão", "KJL$");
INSERT INTO produtos VALUES (1,"Fogão", "KJL$");
INSERT INTO produtos VALUES (2,"Fogão", "KJL$");
SELECT * FROM produtos;
INSERT INTO produtos VALUES (3,"TV", "TVL4");
UPDATE produtos SET sku = "123456" WHERE id=2;
SELECT * FROM produtos;


CREATE TABLE frutas(
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	nome VARCHAR (100)

);
INSERT INTO frutas (nome) VALUES ("manga");
SELECT * FROM frutas;
INSERT INTO frutas (nome) VALUES ("laranja");
INSERT INTO frutas (nome) VALUES ("morango");
SELECT * FROM frutas;
DELETE FROM frutas WHERE id =1;
SELECT * FROM frutas;


DROP TABLE pessoas;
CREATE TABLE pessoas (
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	nome VARCHAR (100) NOT NULL,
	idade INT
);

CREATE TABLE enderecos (
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	rua VARCHAR(100),
    numero VARCHAR(10),
    pessoa_id INT NOT NULL,
    FOREIGN KEY (pessoa_id) REFERENCES pessoas (id)
);

INSERT INTO pessoas (nome,idade) VALUES ("Luis", 25);
INSERT INTO enderecos (rua,numero,pessoa_id) Values ("Rua teste", "1001", 1);
SELECT * FROM enderecos;

DROP TABLE pessoas;

CREATE INDEX index_nome
ON pessoas(nome);
USE constraints;
DROP INDEX index_nome ON pessoas;

USE employees;
SELECT * FROM employees WHERE first_name = "Georgi";
CREATE INDEX index_nome
ON employees(first_name);


CREATE DATABASE banco;
USE banco;
 
CREATE TABLE contas (
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nome VARCHAR (255),
    sobrenome  VARCHAR (255),
    saldo INT,
    data_nascimento DATE
);


CREATE INDEX index_saldo
ON contas(saldo);

INSERT INTO contas (nome,sobrenome,saldo,data_nascimento) VALUES ("Luis", "Felipe", 1000,"1996-10-18" );
INSERT INTO contas (nome,sobrenome,saldo,data_nascimento) VALUES ("Paulo", "Felipe", 10000,"1997-10-18");
INSERT INTO contas (nome,sobrenome,saldo,data_nascimento) VALUES ("Lucas", "Felipe", 100000,"1998-10-18");

SELECT * FROM contas;


/*  Trabalhando com JOIN */ 

USE employees;

SELECT employees.first_name AS nome, employees.last_name AS sobrenome, salaries.salary AS salario
FROM employees
INNER JOIN salaries
ON employees.emp_no = salaries.emp_no
WHERE salaries.salary >= 120000
ORDER BY salaries.salary DESC;

SELECT employees.first_name AS Nome, employees.gender AS Genero, titles.title AS Cargo
FROM employees
INNER JOIN titles
ON employees.emp_no = titles.emp_no
WHERE employees.gender ="F"
ORDER BY titles.title DESC;

USE constraints;

INSERT INTO pessoas (nome,idade) VALUES ("José",70);
INSERT INTO pessoas (nome,idade) VALUES ("Gomes",90);
SELECT * FROM pessoas;

SELECT pessoas.nome, enderecos.*
FROM pessoas
LEFT JOIN enderecos
ON pessoas.id= enderecos.pessoa_id;

USE employees;
SELECT employees.first_name AS nome, employees.last_name AS sobrenome, salaries.salary AS salario
FROM employees
LEFT JOIN salaries
ON employees.emp_no = salaries.emp_no;

USE constraints;
SELECT pessoas.nome, enderecos.*
FROM pessoas
RIGHT JOIN enderecos
ON pessoas.id= enderecos.pessoa_id;

USE employees;

SELECT employees.first_name AS Nome, salaries.salary AS Salario,titles.title AS Cargo
FROM employees
INNER JOIN salaries
ON employees.emp_no = salaries.emp_no
INNER JOIN titles
ON employees.emp_no = titles.emp_no;


/*  Trabalhando com Agrupamento e Subqueries*/ 

SELECT dept_no AS Departamento FROM departments
UNION SELECT dept_no FROM dept_emp;

SELECT dept_no AS Departamento FROM departments
UNION ALL SELECT dept_no FROM dept_emp;

SELECT gender, COUNT(gender) AS "QTS por gênero"
FROM employees
GROUP BY gender;

SELECT hire_date, COUNT(hire_date) AS "Data de Contratação"
FROM employees
GROUP BY hire_date
ORDER BY COUNT(hire_date) DESC;


SELECT hire_date, COUNT(hire_date) AS "Data de Contratação"
FROM employees
GROUP BY hire_date
HAVING COUNT(hire_date) > 80
ORDER BY COUNT(hire_date) DESC;

SELECT title, COUNT(title) AS "Titulos"
FROM titles
GROUP BY title
HAVING COUNT(title) > 10000;


SELECT hire_date, COUNT(hire_date) AS "Data de Contratação"
FROM employees
GROUP BY hire_date
HAVING COUNT(hire_date) <= 50
ORDER BY COUNT(hire_date) DESC;

SELECT emp_no,first_name,(
	SELECT SUM(salary)
    FROM salaries
    WHERE employees.emp_no = salaries.emp_no
)AS soma_salario
FROM employees
ORDER BY emp_no DESC;

SELECT emp_no, first_name, last_name, (
	SELECT SUM(salary)
	FROM salaries
	WHERE employees.emp_no = salaries.emp_no
) AS soma_salarios
FROM employees
WHERE EXISTS(
	SELECT salary
	FROM salaries
	WHERE employees.emp_no = salaries.emp_no
	HAVING SUM(salary)> 2000000
);

SELECT first_name
FROM employees
WHERE emp_no = ANY(
	SELECT emp_no
    FROM salaries
    WHERE salary> 150000
);



/*  Funções de String*/

USE sakila;
SELECT first_name, CHAR_LENGTH(first_name) AS qts_chars FROM actor
WHERE CHAR_LENGTH(first_name) > 10;

SELECT address_id,address, CHAR_LENGTH(postal_code)
FROM address
ORDER BY address_id DESC;

USE empresa;
SELECT CONCAT(nome, " tem ", idade, " anos de idade!") AS nome_e_idade
FROM funcionarios;

USE sakila;
SELECT actor_id, CONCAT(first_name, " ", last_name ) AS "Nome e Sobrenome"
FROM actor;

SELECT actor_id, CONCAT_WS(" ", first_name, last_name ) AS "Nome e Sobrenome"
FROM actor;

SELECT customer_id,amount, FORMAT (amount, 1) AS Arrendondado FROM payment;

SELECT email, INSTR(email, "@")FROM customer;

SELECT email, LCASE(email) AS "Caixa Baixa" FROM customer;
SELECT first_name,last_name, LCASE(CONCAT_WS("",first_name,last_name)) AS "Nome Completo"
FROM customer;

SELECT title, LEFT(title, 8) FROM film WHERE film_id =1;
SELECT address_id, LEFT(last_update, 10) AS "DATA"
FROM address
WHERE address_id > 150;

SELECT REPLACE(name,"Action","Action & Adventure")AS "name" FROM category;

SELECT  REPLACE(first_name,"MARY","Mary") AS "Nome",
REPLACE(last_name,"SMITH","Smith") AS "Sobrenome"
FROM customer
WHERE last_name= "SMITH";

SELECT title, RIGHT(title, 8) FROM film WHERE film_id =1;
SELECT RIGHT(last_update, 8)AS horario FROM category;

SELECT last_update, 
SUBSTR(last_update, 9, 2)AS "Mês", 
SUBSTR(last_update, 6, 2)AS "Dia",
SUBSTR(last_update, 1, 4)AS "Ano"
FROM actor;

SELECT city_id, UCASE(city)AS city FROM city;


/*  Funções de Number*/

SELECT amount, CEIL(amount) AS arrendondado FROM payment;  /*arredonda para cima*/
SELECT amount, FLOOR(amount) AS arrendondado FROM payment; /*arredonda para baixo*/
SELECT amount, CEIL(amount), FLOOR(amount) FROM payment;

SELECT COUNT(*) FROM payment;
SELECT COUNT(*) AS "Contagem de Clientes" FROM customer;

USE employees;
SELECT MAX(salary)AS "Maior Salário", MIN(salary)AS "Menor Salário" FROM salaries;
USE sakila;
SELECT MAX(amount) AS "Maior Pagamento" FROM payment;
SELECT MIN(amount) AS "Menor Pagamento" FROM payment;
SELECT AVG(amount) AS "Média Pagamento" FROM payment;
SELECT SUM(amount) AS "Soma dos Pagamentos" FROM payment;

/*  Funções de Datas*/

SELECT last_update, ADDDATE(last_update, "5 DAYS"),
ADDDATE(last_update, INTERVAL 2 MONTH),
ADDDATE(last_update, INTERVAL -3 YEAR)
FROM actor;

SELECT DATEDIFF(ADDDATE(last_update, INTERVAL 1 YEAR),last_update) FROM actor;

SELECT *, ADDTIME(last_update, " 5 03:00:00") FROM actor;

SELECT DATE_FORMAT(last_update, "%Y")AS "Ano",
DATE_FORMAT(last_update, "%d/%m/%Y")AS "Data formatada"
FROM actor;

SELECT last_update, DAY(last_update)AS Dia,
DAY(ADDTIME(last_update, "5 00:00:00")) AS "Após 5 dias" 
FROM actor;


SELECT last_update, DAYOFWEEK(last_update)AS "Dias da Semana" FROM actor;
SELECT last_update, DAYOFWEEK(last_update)AS "Dias da Semana",
DAYOFWEEK(ADDTIME(last_update, "5 00:00:00")) AS "Após 5 dias"
FROM actor;

SELECT last_update, DAYOFYEAR(last_update) FROM actor;
SELECT last_update, DAYOFYEAR(last_update),
DAYOFYEAR(ADDTIME(last_update, "5 00:00:00"))AS "Adicionado 5 DIas"
FROM actor;

SELECT last_update, WEEKOFYEAR(last_update) FROM actor;
SELECT last_update, WEEKOFYEAR(last_update),
 WEEKOFYEAR(ADDTIME(last_update, "38 00:00:00"))AS "Adicionado 38 Dias"
FROM actor;

SELECT last_update, YEAR(last_update)AS "Ano" FROM actor;
SELECT last_update, MONTH(last_update)AS "Mês"FROM actor;
SELECT last_update, WEEK(last_update)AS "Semana" FROM actor;
SELECT last_update, DAY(last_update)AS "Dia" FROM actor;
SELECT last_update, TIME(last_update)AS "Horas" FROM actor;



/*  Relação entre tabelas*/


/*  One to One*/


CREATE DATABASE relacoes;
USE relacoes;

CREATE TABLE estudantes (
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nome VARCHAR(100),
    turma VARCHAR(5)
);

CREATE TABLE contatos(
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    telefone VARCHAR(20),
    estudante_id INT NOT NULL,
    FOREIGN KEY (estudante_id) REFERENCES estudantes(id)
);

INSERT INTO estudantes (nome, turma) VALUES ("Mateus","1A");
INSERT INTO estudantes (nome, turma) VALUES ("Lucas","1A");
INSERT INTO estudantes (nome, turma) VALUES ("Otavio","1B");

INSERT INTO contatos (telefone,estudante_id) VALUES ("(19)9999-9999",1);
INSERT INTO contatos (telefone,estudante_id) VALUES ("(18)9999-9999",2);
INSERT INTO contatos (telefone,estudante_id) VALUES ("(17)9999-9999",3);

SELECT * FROM contatos;
SELECT * FROM estudantes;

SELECT estudantes.nome, estudantes.turma, contatos.telefone
FROM estudantes
JOIN contatos ON contatos.estudante_id = estudantes.id;


/*  One to Many*/


CREATE TABLE clientes(
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nome VARCHAR(100),
    data_nascimento DATE
); 

CREATE TABLE pedidos (
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    qtd_itens INT(10),
    total FLOAT,
    cliente_id INT NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

INSERT INTO clientes (nome, data_nascimento) VALUES ("Mateus","1991-05-01");
INSERT INTO clientes (nome, data_nascimento) VALUES ("Otavio","1999-05-01");
INSERT INTO clientes (nome, data_nascimento) VALUES ("Fernando","1995-05-01");

INSERT INTO pedidos (qtd_itens,total, cliente_id) VALUES (5,214.01,1);
INSERT INTO pedidos (qtd_itens,total, cliente_id) VALUES (4,210.01,1);
INSERT INTO pedidos (qtd_itens,total, cliente_id) VALUES (1,230.01,1);
INSERT INTO pedidos (qtd_itens,total, cliente_id) VALUES (10,805.05,2);

SELECT clientes.nome,pedidos.id AS pedido_id, pedidos.total AS Valor
FROM clientes
JOIN pedidos ON pedidos.cliente_id = clientes.id
WHERE clientes.id=1;


/*  Many to Many*/


CREATE TABLE materias (
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nome VARCHAR (100)
);

CREATE TABLE estudante_materia(
	estudante_id INT NOT NULL,
    materia_id INT NOT NULL,
    FOREIGN KEY (estudante_id) REFERENCES estudantes(id),
    FOREIGN KEY (materia_id) REFERENCES materias(id)
);

INSERT INTO materias (nome) VALUES ("Matemática");
INSERT INTO materias (nome) VALUES ("Portugues");
INSERT INTO materias (nome) VALUES ("Quimica");
INSERT INTO materias (nome) VALUES ("Inglês");

SELECT * FROM estudantes;

INSERT INTO estudante_materia(estudante_id,materia_id) VALUES (1,1);
INSERT INTO estudante_materia(estudante_id,materia_id) VALUES (1,2);
INSERT INTO estudante_materia(estudante_id,materia_id) VALUES (1,3);
INSERT INTO estudante_materia(estudante_id,materia_id) VALUES (1,4);
INSERT INTO estudante_materia(estudante_id,materia_id) VALUES (2,1);
INSERT INTO estudante_materia(estudante_id,materia_id) VALUES (2,3);
INSERT INTO estudante_materia(estudante_id,materia_id) VALUES (3,3);
INSERT INTO estudante_materia(estudante_id,materia_id) VALUES (3,4);

SELECT * FROM estudantes
JOIN estudante_materia ON estudante_materia.estudante_id = estudantes.id
AND estudante_materia.materia_id =3;

/*  PROCEDURE */

USE employees;
SHOW PROCEDURE STATUS;
SHOW CREATE PROCEDURE fullName;
DROP PROCEDURE fullName;


DELIMITER //
CREATE PROCEDURE  fullName()
BEGIN
	SELECT CONCAT(first_name," ", last_name) AS full_name FROM employees;
END//
CALL fullName;


DELIMITER //
CREATE PROCEDURE employeesNameAndSalaries()
BEGIN
	SELECT ep.first_name, sa.salary FROM employees AS ep
    JOIN salaries AS sa ON ep.emp_no = sa.emp_no;
END//
CALL employeesNameAndSalaries;


DELIMITER //
CREATE PROCEDURE employeesWithHighSalary(
	IN highSalary INT)
BEGIN
	SELECT ep.first_name, sa.salary FROM employees AS ep
    JOIN salaries AS sa ON ep.emp_no = sa.emp_no
    WHERE sa.salary > highSalary;
END//
CALL employeesWithHighSalary(150000);

