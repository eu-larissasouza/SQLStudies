-- TIPOS ###########################################################################
-- CASE WHEN
-- COALESCE()


-- EXEMPLOS ########################################################################

-- (Exemplo 1) Agrupamento de dados com CASE WHEN
-- Calcule o nº de clientes que ganham abaixo de 5k, entre 5k e 10k, entre 10k e 
-- 15k e acima de 15k (coluna income = renda)

-- Fluxo da Query
-- Primeira parte: classificar a faixa de renda do cliente com CASE WHEN (Subquery WITH)
-- Segunda parte: fazer uma contagem agrupada pela coluna de classificacao

WITH INCOME_BRACKET AS (
	SELECT INCOME,
		CASE
			WHEN INCOME < 5000 
				THEN 'Abaixo de 5k'
			WHEN INCOME >= 5000 AND INCOME < 10000
				THEN 'Entre 5k E 10k'
			WHEN INCOME >= 10000 AND INCOME < 15000
				THEN 'Entre 10k e 15k'
			ELSE 'Maior que 15k'
		END AS RANGE_VALUE
	FROM SALES.CUSTOMERS
)
SELECT IB.RANGE_VALUE,
	COUNT(*)
FROM INCOME_BRACKET IB
GROUP BY IB.RANGE_VALUE;



-- (Exemplo 2) Tratamento de dados nulos com COALESCE
-- Crie uma coluna chamada populacao_ajustada na tabela temp_tables.regions e
-- preencha com os dados da coluna population, mas caso esse campo estiver nulo, 
-- preencha com a população média (geral) das cidades do Brasil

-- 01.  Case when
SELECT *,
	CASE 
		WHEN POPULATION IS NOT NULL THEN POPULATION
		ELSE (SELECT ROUND(AVG(POPULATION)) 
			  FROM TEMP_TABLES.REGIONS)
	END AS POPULACAO_AJUSTADA
FROM TEMP_TABLES.REGIONS;

-- 02. Coalesce (Primeiro valor não nulo)
SELECT *,
	COALESCE(POPULATION,
			 (SELECT ROUND(AVG(POPULATION))
			  FROM TEMP_TABLES.REGIONS)) AS POPULACAO_AJUSTADA
FROM TEMP_TABLES.REGIONS;




-- RESUMO ##########################################################################
-- (1) CASE WHEN é o comando utilizado para criar respostas específicas para 
-- diferentes condições e é muito utilizado para fazer agrupamento de dados
-- (2) COALESCE é o comando utilizado para preencher campos nulos com o primeiro
-- valor não nulo de uma sequência de valores.

