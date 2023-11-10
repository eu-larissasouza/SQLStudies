-- (Query 1) Gênero dos leads
-- Colunas: gênero, leads (#)
SELECT CASE IBGE.GENDER
		  WHEN 'female' THEN 'mulheres'
		  WHEN 'male' THEN 'homens'
	   END AS "gênero",
	COUNT(*) AS "leads (#)"
FROM SALES.CUSTOMERS CUS
LEFT JOIN TEMP_TABLES.IBGE_GENDERS IBGE
ON UPPER(CUS.FIRST_NAME) = UPPER(IBGE.FIRST_NAME)
GROUP BY IBGE.GENDER;




-- (Query 2) Status profissional dos leads
-- Colunas: status profissional, leads (%)
SELECT PRO.STATUS_PROFISSIONAL AS "status profissional",
	COUNT(*)::FLOAT /
	(SELECT COUNT(*)
		FROM SALES.CUSTOMERS) AS "leads (%)"
FROM SALES.CUSTOMERS CUS
LEFT JOIN TEMP_TABLES.PROFISSOES PRO
ON CUS.PROFESSIONAL_STATUS = PRO.PROFESSIONAL_STATUS
GROUP BY PRO.STATUS_PROFISSIONAL
ORDER BY "leads (%)";




-- (Query 3) Faixa etária dos leads
-- Colunas: faixa etária, leads (%)
SELECT CASE
		  WHEN EXTRACT(YEAR
					   FROM AGE(BIRTH_DATE)) < 20 THEN '0-20'
		  WHEN EXTRACT(YEAR
					   FROM AGE(BIRTH_DATE)) < 40 THEN '20-40'
		  WHEN EXTRACT(YEAR
					   FROM AGE(BIRTH_DATE)) < 60 THEN '40-60'
		  WHEN EXTRACT(YEAR
					   FROM AGE(BIRTH_DATE)) < 80 THEN '60-80'
		  ELSE '80+'
	   END AS "faixa etária",
	COUNT(*)::FLOAT /
	(SELECT COUNT(*)
		FROM SALES.CUSTOMERS) AS "leads (%)"
FROM SALES.CUSTOMERS
GROUP BY "faixa etária"
ORDER BY "faixa etária";




-- (Query 4) Faixa salarial dos leads
-- Colunas: faixa salarial, leads (%), ordem
SELECT CASE
	      WHEN INCOME < 5000 THEN '0-5000'
		  WHEN INCOME < 10000 THEN '5000-10000'
		  WHEN INCOME < 15000 THEN '10000-15000'
		  WHEN INCOME < 20000 THEN '15000-20000'
		  ELSE '20000+'
	END AS "faixa salarial",
	COUNT(*)::FLOAT /
	(SELECT COUNT(*)
		FROM SALES.CUSTOMERS) AS "leads (%)",
	CASE
		WHEN INCOME < 5000 THEN 1
		WHEN INCOME < 10000 THEN 2
		WHEN INCOME < 15000 THEN 3
		WHEN INCOME < 20000 THEN 4
		ELSE 5
	END AS ORDEM
FROM SALES.CUSTOMERS
GROUP BY "faixa salarial", ordem
ORDER BY ordem;



-- (Query 5) Classificação dos veículos visitados
-- Colunas: classificação do veículo, veículos visitados (#)
-- Regra de negócio: Veículos novos tem até 2 anos e seminovos acima de 2 anos

WITH CLASSIFICACAO_VEICULOS AS (
		SELECT FUN.VISIT_PAGE_DATE,
			PRO.MODEL_YEAR,
			EXTRACT(YEAR FROM VISIT_PAGE_DATE) - PRO.MODEL_YEAR::INT AS IDADE_VEICULO,
			CASE
	 			WHEN (EXTRACT(YEAR FROM VISIT_PAGE_DATE) - PRO.MODEL_YEAR::INT) <= 2 THEN 'novo'
				ELSE 'seminovo'
			END AS "classificação do veículo"
		FROM SALES.FUNNEL AS FUN
		LEFT JOIN SALES.PRODUCTS AS PRO 
	 	ON FUN.PRODUCT_ID = PRO.PRODUCT_ID
)
SELECT "classificação do veículo",
	COUNT(*) AS "veículos visitados (#)"
FROM CLASSIFICACAO_VEICULOS
GROUP BY "classificação do veículo"




-- (Query 6) Idade dos veículos visitados
-- Colunas: Idade do veículo, veículos visitados (%), ordem

WITH IDADE_VEICULOS AS (
	SELECT FUN.VISIT_PAGE_DATE,
		PRO.MODEL_YEAR,
		EXTRACT(YEAR FROM VISIT_PAGE_DATE) - PRO.MODEL_YEAR::int AS IDADE_VEICULO,
		CASE WHEN (EXTRACT(YEAR FROM VISIT_PAGE_DATE) - PRO.MODEL_YEAR::INT) <= 2
				THEN 'até 2 anos'
			WHEN (EXTRACT(YEAR FROM VISIT_PAGE_DATE) - PRO.MODEL_YEAR::INT) <= 4
				THEN 'de 2 à 4 anos'
			WHEN (EXTRACT(YEAR FROM VISIT_PAGE_DATE) - PRO.MODEL_YEAR::INT) <= 6
				THEN 'de 4 à 6 anos'
			WHEN (EXTRACT(YEAR FROM VISIT_PAGE_DATE) - PRO.MODEL_YEAR::INT) <= 8
				THEN 'de 6 à 8 anos'
			WHEN (EXTRACT(YEAR FROM VISIT_PAGE_DATE) - PRO.MODEL_YEAR::INT) <= 10
				THEN 'de 8 à 10 anos' 
			ELSE 'acima de 10 anos' 
		END AS "classificação do veículo",
		CASE WHEN (EXTRACT(YEAR FROM VISIT_PAGE_DATE) - PRO.MODEL_YEAR::INT) <= 2
				THEN 1
			WHEN (EXTRACT(YEAR FROM VISIT_PAGE_DATE) - PRO.MODEL_YEAR::INT) <= 4
				THEN 2
			WHEN (EXTRACT(YEAR FROM VISIT_PAGE_DATE) - PRO.MODEL_YEAR::INT) <= 6
				THEN 3
			WHEN (EXTRACT(YEAR FROM VISIT_PAGE_DATE) - PRO.MODEL_YEAR::INT) <= 8
				THEN 4
			WHEN (EXTRACT(YEAR FROM VISIT_PAGE_DATE) - PRO.MODEL_YEAR::INT) <= 10
				THEN 5 
			ELSE 6 
		END AS ordem
	FROM SALES.FUNNEL FUN
	LEFT JOIN SALES.PRODUCTS PRO
	ON FUN.PRODUCT_ID = PRO.PRODUCT_ID
)
SELECT "classificação do veículo",
	COUNT(*)::FLOAT / (SELECT COUNT(*) FROM SALES.FUNNEL) AS "veículos visitados (%)",
	ORDEM
FROM IDADE_VEICULOS
GROUP BY "classificação do veículo", ordem
ORDER BY ORDEM;





-- (Query 7) Veículos mais visitados por marca
-- Colunas: brand, model, visitas (#)
SELECT PRO.BRAND,	
	PRO.MODEL,
	COUNT(*) AS "visitas (#)"
FROM SALES.FUNNEL FUN
LEFT JOIN SALES.PRODUCTS PRO
ON FUN.PRODUCT_ID = PRO.PRODUCT_ID
GROUP BY PRO.BRAND, PRO.MODEL
ORDER BY PRO.BRAND, PRO.MODEL;










