-- PARA QUE SERVE ##################################################################
-- Usados para unir expressões simples em uma composta

-- TIPOS ###########################################################################
-- AND
-- OR
-- NOT
-- BETWEEN
-- IN
-- LIKE
-- ILIKE
-- IS NULL


-- EXEMPLOS ########################################################################

-- (Exemplo 1) Uso do comando BETWEEN 
-- Selecione veículos que custam entre 100k e 200k na tabela products
SELECT *
FROM SALES.PRODUCTS
WHERE PRICE >= 100000
	AND PRICE <= 200000;

SELECT *
FROM SALES.PRODUCTS
WHERE PRICE BETWEEN 100000 AND 200000;

-- (Exemplo 2)  Uso do comando NOT
-- Selecione veículos que custam abaixo de 100k ou acima 200k 
SELECT *
FROM SALES.PRODUCTS
WHERE PRICE < 100000
	OR PRICE > 200000;

SELECT *
FROM SALES.PRODUCTS
WHERE PRICE NOT BETWEEN 100000 AND 200000;


-- (Exemplo 3) Uso do comando IN
-- Selecionar produtos que sejam da marca HONDA, TOYOTA ou RENAULT
SELECT *
FROM SALES.PRODUCTS
WHERE BRAND = 'HONDA'
	OR BRAND = 'TOYOTA'
	OR BRAND = 'RENAULT';

SELECT *
FROM SALES.PRODUCTS
WHERE BRAND IN ('HONDA', 'TOYOTA','RENAULT');


-- (Exemplo 4) Uso do comando LIKE (matchs imperfeitos)
-- Selecione os primeiros nomes distintos da tabela customers que começam
-- com as iniciais ANA
SELECT DISTINCT FIRST_NAME
FROM SALES.CUSTOMERS
WHERE FIRST_NAME = 'ANA';

-- Começam
SELECT DISTINCT FIRST_NAME
FROM SALES.CUSTOMERS
WHERE FIRST_NAME LIKE 'ANA%';

-- Terminam
SELECT DISTINCT FIRST_NAME
FROM SALES.CUSTOMERS
WHERE FIRST_NAME LIKE '%ANA';


-- (Exemplo 5) Uso do comando ILIKE (ignora letras maiúsculas e minúsculas)
-- Selecione os primeiros nomes distintos com iniciais 'ana'
SELECT DISTINCT FIRST_NAME
FROM SALES.CUSTOMERS
WHERE FIRST_NAME LIKE 'ana%';


SELECT DISTINCT FIRST_NAME
FROM SALES.CUSTOMERS
WHERE FIRST_NAME ILIKE 'ana%';


-- (Exemplo 6) Uso do comando IS NULL
-- Selecionar apenas as linhas que contém nulo no campo "population" na tabela
-- temp_tables.regions
SELECT *
FROM TEMP_TABLES.REGIONS;

SELECT *
FROM TEMP_TABLES.REGIONS
WHERE POPULATION = NULL;

SELECT *
FROM TEMP_TABLES.REGIONS
WHERE POPULATION IS NULL;


-- RESUMO ##########################################################################
-- (1) Usados para unir expressões simples em uma composta
-- (2) AND: Verifica se duas comparações são simultaneamente verdadeiras
-- (3) OR: Verifica se uma ou outra comparação é verdadeiras
-- (4) BETWEEN: Verifica quais valores estão dentro do range definido
-- (5) IN: Funciona como multiplos ORs
-- (6) LIKE e ILIKE: Comparam textos e são sempre utilizados em conjunto com o 
-- operador %, que funciona como um coringa, indicando que qualquer texto pode 
-- aparecer no lugar do campo
-- (7) ILIKE ignora se o campo tem letras maiúsculas ou minúsculas na comparação
-- (8) IS NULL: Verifica se o campo é nulo
-- (9) Utilize o Guia de comandos para consultar os operadores utilizados no SQL
