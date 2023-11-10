-- EXERCÍCIOS ########################################################################

-- (Exercício 1) Identifique quais as marcas de veículo mais visitada na tabela sales.funnel
SELECT PROD.BRAND,
	COUNT(VISIT_PAGE_DATE) AS VISITAS
FROM SALES.FUNNEL AS FUN
LEFT JOIN SALES.PRODUCTS AS PROD
ON FUN.PRODUCT_ID = PROD.PRODUCT_ID
GROUP BY PROD.BRAND
ORDER BY VISITAS DESC;


-- (Exercício 2) Identifique quais as lojas de veículo mais visitadas na tabela sales.funnel
SELECT * FROM SALES.STORES;

SELECT STORE_NAME,
	COUNT(VISIT_PAGE_DATE) AS VISITAS
FROM SALES.FUNNEL AS FUN
LEFT JOIN SALES.STORES AS STO
ON FUN.STORE_ID = STO.STORE_ID
GROUP BY STO.STORE_ID
ORDER BY VISITAS DESC;

-- (Exercício 3) Identifique quantos clientes moram em cada tamanho de cidade (o porte da cidade
-- consta na coluna "size" da tabela temp_tables.regions)
SELECT * FROM TEMP_TABLES.REGIONS;

SELECT REG.SIZE,
	COUNT(*) AS CONTAGEM
FROM SALES.CUSTOMERS AS CUS
LEFT JOIN TEMP_TABLES.REGIONS AS REG
ON LOWER(CUS.CITY) = LOWER(REG.CITY)
AND LOWER(CUS.STATE) = LOWER(REG.STATE)
GROUP BY REG.SIZE
ORDER BY CONTAGEM DESC;

