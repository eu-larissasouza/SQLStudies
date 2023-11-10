-- PARA QUE SERVE ##################################################################
-- Servem para executar operações matemáticas
-- Muito utilizados para criar colunas calculadas

-- TIPOS ###########################################################################
-- + SOMA
-- - SUBTRAÇÃO
-- * MULTIPLICAÇÃO
-- / DIVISÃO
-- ^ EXPONENCIAL
-- % MÓDULO
-- || --> não é um operador aritmético (CONCATENAR)

-- EXEMPLOS ########################################################################

-- (Exemplo 1) Criação de coluna calculada
-- Crie uma coluna contendo a idade do cliente da tabela sales.customers

SELECT *
FROM SALES.CUSTOMERS
LIMIT 10;

--RRENT_DATE: RETORNA DATA ATUAL 
SELECT EMAIL,
	BIRTH_DATE,
	(CURRENT_DATE - BIRTH_DATE) / 365 AS AGE_CUSTOMER
FROM SALES.CUSTOMERS;

SELECT EMAIL,
	BIRTH_DATE,
	(CURRENT_DATE - BIRTH_DATE) / 365 AS "AGE CUSTOMER"
FROM SALES.CUSTOMERS;

-- (Exemplo 2) Utilização da coluna calculada nas queries
-- Liste os 10 clientes mais novos da tabela customers
SELECT EMAIL,
	BIRTH_DATE,
	(CURRENT_DATE - BIRTH_DATE) / 365 AS AGE_CUSTOMER
FROM SALES.CUSTOMERS
ORDER BY AGE_CUSTOMER
LIMIT 10;

-- (Exemplo 3) Criação de coluna calculada com strings
-- Crie a coluna "nome_completo" contendo o nome completo do cliente
SELECT FIRST_NAME || ' ' || LAST_NAME AS FULL_NAME
FROM SALES.CUSTOMERS;

-- RESUMO ##########################################################################
-- (1) Servem para executar operações matemáticas
-- (2) Muito utilizado para criar colunas calculadas
-- (3) Alias (pseudônimos) são muito utilizados para dar nome as colunas calculadas.
-- (4) Para criar pseudônimos que contém espaços no nome são utilizadas aspas duplas
-- (5) No caso de strings o operador de adição (||) irá concatenar as strings
-- (6) Utilize o Guia de comandos para consultar os operadores utilizados no SQL
