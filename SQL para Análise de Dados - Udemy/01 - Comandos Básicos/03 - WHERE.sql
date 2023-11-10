-- PARA QUE SERVE ##################################################################
-- Serve para filtrar linhas de acordo com uma condição
 -- SINTAXE #########################################################################

SELECT COLUNA_1,
	COLUNA_2,
	COLUNA_3
FROM SCHEMA_1.TABELA_1
WHERE CONDIÇÃO_X = TRUE;

-- EXEMPLOS ########################################################################
-- (Exemplo 1) Filtro com condição única
-- Liste os emails dos clientes da nossa base que moram no estado de Santa Catarina

SELECT EMAIL,
	STATE
FROM SALES.CUSTOMERS
WHERE STATE = 'SC';


SELECT DISTINCT STATE
FROM SALES.CUSTOMERS;

-- (Exemplo 2) Filtro com mais de uma condição
-- Liste os emails dos clientes da nossa base que moram no estado de Santa Catarina
-- ou Mato Grosso do Sul

SELECT EMAIL,
	STATE
FROM SALES.CUSTOMERS
WHERE STATE = 'SC'
	OR STATE = 'MS';

-- (Exemplo 3) Filtro de condição com data
-- Liste os emails dos clientes da nossa base que moram no estado de Santa Catarina
-- ou Mato Grosso do Sul e que tem mais de 30 anos

SELECT EMAIL,
	STATE,
	BIRTH_DATE
FROM SALES.CUSTOMERS
WHERE (STATE = 'SC' OR STATE = 'MS')
AND EXTRACT(YEAR FROM AGE(BIRTH_DATE)) > 30;

SELECT DISTINCT BIRTH_DATE
FROM SALES.CUSTOMERS;

SELECT CURRENT_DATE;

-- RESUMO ##########################################################################
-- (1) Comando utilizado para filtrar linhas de acordo com uma condição
-- (2) No PostgreSQL são utilizadas aspas simples para delimitar strings
-- (3) string = sequência de caracteres = texto
-- (4) Pode-se combinar mais de uma condição utilizando os operadores lógicos
-- (5) No PostgreSQL as datas são escritas no formato 'YYYY-MM-DD' ou 'YYYYMMDD'
