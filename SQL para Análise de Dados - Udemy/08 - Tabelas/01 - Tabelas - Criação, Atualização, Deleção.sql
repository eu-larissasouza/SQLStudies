-- CONTEÚDO ########################################################################
-- Criação de tabela a partir de uma query
-- Criação de tabela a partir do zero
-- Deleção de tabelas


-- EXEMPLOS ########################################################################

-- (Exemplo 1) Criação de tabela a partir de uma query
-- Crie uma tabela chamada customers_age com o id e a idade dos clientes. 
-- Chame-a de temp_tables.customers_age
SELECT customer_id,
       EXTRACT(YEAR FROM AGE(birth_date)) as age
	   into temp_tables.customers_age
from   sales.customers;

SELECT *
FROM TEMP_TABLES.CUSTOMERS_AGE
LIMIT 10;


-- (Exemplo 2) Criação de tabela a partir do zero
-- Crie uma tabela com a tradução dos status profissionais dos clientes. 
-- Chame-a de temp_tables.profissoes
SELECT DISTINCT PROFESSIONAL_STATUS
FROM   SALES.CUSTOMERS;

CREATE TABLE TEMP_TABLES.PROFISSOES (
	professional_status varchar,
	status_profissional varchar
);

INSERT INTO TEMP_TABLES.PROFISSOES (PROFESSIONAL_STATUS, STATUS_PROFISSIONAL)
VALUES ('freelancer', 'freelancer'),
	   ('retired', 'aposentado(a)'), 
	   ('clt', 'clt'),
	   ('self_employed', 'autônomo(a)'),
	   ('other', 'outro'),
	   ('businessman', 'empresário(a)'),
	   ('civil_servant', 'funcionário público(a)'),
	   ('student', 'estudante');

SELECT *
FROM TEMP_TABLES.PROFISSOES;

-- (Exemplo 3) Deleção de tabelas
-- Delete a tabela temp_tables.profissoes
DROP TABLE TEMP_TABLES.PROFISSOES;



-- RESUMO ##########################################################################
-- (1) Para criar tabelas a partir de uma query basta escrever a query normalmente e
-- colocar o comando INTO antes do FROM informando o schema e o nome da tabela 
-- a ser criada
-- (2) Para criar tabelas a partir do zero é necessário (a) criar uma tabela vazia 
-- com o comando CREATE TABLE (b) Informar que valores serão inseridos com o comando
-- INSERT INTO seguido do nome das colunas (c) Inserir os valores manualmente em forma 
-- de lista após o comando VALUES
-- (3) Para deletar uma tabela utiliza-se o comando DROP TABLe



