-- PARA QUE SERVE ##################################################################
-- Servem para combinar colunas de uma ou mais tabelas


-- SINTAXE #########################################################################
SELECT T1.COLUNA_1,
	T1.COLUNA_1,
	T2.COLUNA_1,
	T2.COLUNA_2
FROM SCHEMA.TABELA_1 AS T1
ALGUM JOIN SCHEMA.TABELA_2 AS T2 
ON CONDIÇÃO_DE_JOIN;


-- EXEMPLOS ########################################################################

-- (Exemplo 1) Utilize o LEFT JOIN para fazer join entre as tabelas
-- temp_tables.tabela_1 e temp_tables.tabela_2
SELECT T1.CPF,
	T1.NAME,
	T2.STATE
FROM TEMP_TABLES.TABELA_1 AS T1
LEFT JOIN TEMP_TABLES.TABELA_2 AS T2 ON T1.CPF = T2.CPF;


-- (Exemplo 2) Utilize o INNER JOIN para fazer join entre as tabelas
-- temp_tables.tabela_1 e temp_tables.tabela_2
SELECT T1.CPF,
	T1.NAME,
	T2.STATE
FROM TEMP_TABLES.TABELA_1 AS T1
INNER JOIN TEMP_TABLES.TABELA_2 AS T2 ON T1.CPF = T2.CPF;

-- (Exemplo 3) Utilize o RIGHT JOIN para fazer join entre as tabelas
-- temp_tables.tabela_1 e temp_tables.tabela_2
SELECT T2.CPF,
	T1.NAME,
	T2.STATE
FROM TEMP_TABLES.TABELA_1 AS T1
RIGHT JOIN TEMP_TABLES.TABELA_2 AS T2 ON T1.CPF = T2.CPF;

-- (Exemplo 4) Utilize o FULL JOIN para fazer join entre as tabelas
-- temp_tables.tabela_1 e temp_tables.tabela_2
SELECT COALESCE(T1.CPF, T2.CPF) CPF,
	T1.NAME,
	T2.STATE
FROM TEMP_TABLES.TABELA_1 AS T1
FULL JOIN TEMP_TABLES.TABELA_2 AS T2 ON T1.CPF = T2.CPF
ORDER BY CPF;


-- RESUMO ##########################################################################
-- (1) Servem para combinar colunas de uma ou mais tabelas
-- (2) Pode-se chamar todas as colunas com o asterisco (*), mas não é recomendado
-- (3) É uma boa prática criar aliases para nomear as tabelas utilizadas 
-- (4) O JOIN sozinho funciona como INNER JOIN
