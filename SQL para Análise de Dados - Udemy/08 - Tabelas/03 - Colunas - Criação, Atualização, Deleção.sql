-- CONTEÚDO ########################################################################
-- Inserção de colunas
-- Alteração de colunas
-- Deleção de colunas


-- EXEMPLOS ########################################################################

-- (Exemplo 1) Inserção de Colunas
-- Insira uma coluna na tabela sales.customers com a idade do cliente
ALTER TABLE SALES.CUSTOMERS ADD CUSTOMER_AGE integer;

UPDATE SALES.CUSTOMERS
SET CUSTOMER_AGE = EXTRACT(YEAR
						   FROM AGE(BIRTH_DATE));
						   
SELECT *
FROM SALES.CUSTOMERS
LIMIT 10;




-- (Exemplo 2) Alteração do tipo da coluna
-- Altere o tipo da coluna customer_age de inteiro para varchar
ALTER TABLE SALES.customers
ALTER COLUMN CUSTOMER_AGE TYPE VARCHAR;

SELECT *
FROM SALES.CUSTOMERS
LIMIT 10;



-- (Exemplo 3) Alteração do nome da coluna
-- Renomeie o nome da coluna "customer_age" para "age"
ALTER TABLE SALES.customers
RENAME COLUMN CUSTOMER_AGE TO AGE;

SELECT *
FROM SALES.CUSTOMERS
LIMIT 10;



-- (Exemplo 4) Deleção de coluna
-- Delete a coluna "age"
ALTER TABLE SALES.customers
DROP COLUMN AGE;

SELECT *
FROM SALES.CUSTOMERS
LIMIT 10;



-- RESUMO ##########################################################################
-- (1) Para fazer qualquer modificação nas colunas de uma tabela utiliza-se o comando 
-- ALTER TABLE seguido do nome da tabela
-- (2) Para adicionar colunas utiliza-se o comando ADD seguido do nome da coluna e da
-- unidade da nova coluna
-- (3) Para mudar o tipo de unidade de uma coluna utiliza-se o comando ALTER COLUMN 
-- (4) Para renomear uma coluna utiliza-se o comando RENAME COLUMN
-- (5) Para deletar uma coluna utiliza-se o comando DROP COLUMN
