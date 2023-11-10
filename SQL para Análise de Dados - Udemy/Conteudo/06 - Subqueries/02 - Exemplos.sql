-- EXEMPLOS ########################################################################
-- Utilizando subquerys com WITH.

-- (Exemplo 1) Análise de recorrência dos leads (interesse dos clientes)
-- Calcule o volume de visitas por dia ao site separado por 1ª visita e demais visitas
-- Data da visita, coluna que define se é um interesse recorrente ou primeira vez e contagem pra cada tipo de interesse

-- Fluxo da query:
-- Subquery no WITH define qual a primeira visita (menor valor) por customer_id
-- Depois cruza as informações de cada data de visita com dados de cada cliente
-- Por fim faz a contagem agregada pela data e coluna que define interesse.

WITH FIRST_VISIT AS
	(SELECT CUSTOMER_ID,
			MIN(VISIT_PAGE_DATE) AS VISIT_DATE
		FROM SALES.FUNNEL
		GROUP BY CUSTOMER_ID)
SELECT FUN.VISIT_PAGE_DATE,
	(FUN.VISIT_PAGE_DATE <> FV.VISIT_DATE) AS LEAD_RECORRENTE,
	COUNT(*)
FROM SALES.FUNNEL FUN
LEFT JOIN FIRST_VISIT FV ON FUN.CUSTOMER_ID = FV.CUSTOMER_ID
GROUP BY FUN.VISIT_PAGE_DATE,
	LEAD_RECORRENTE
ORDER BY FUN.VISIT_PAGE_DATE DESC,
	LEAD_RECORRENTE;





-- (Exemplo 2) Análise do preço versus o preço médio
-- Calcule, para cada visita ao site, quanto o preço do um veículo visitado pelo cliente
-- estava acima ou abaixo do preço médio dos veículos daquela marca 
-- (levar em consideração o desconto dado no veículo - coluna discount)

-- Colunas da query: 
-- Visit id
-- Data da visita
-- Marca do carro
-- Preco final (com desconto)
-- Preco medio da marca
-- Diferença entre preço medio da marca e preço final

-- Fluxo da Query:
-- Subquery no WITH define o preco medio de cada marca
-- Depois cruzar as informações com os dados da tabela funnel

WITH MEDIUM_PRICE AS (
	SELECT BRAND,
		   AVG(PRICE) AS BRAND_AVG_PRICE
	FROM SALES.PRODUCTS
	GROUP BY BRAND
)
SELECT FUN.VISIT_ID,
	   FUN.VISIT_PAGE_DATE,
	   MP.BRAND,
	   (PRO.PRICE * (1 + FUN.DISCOUNT)) AS PRECO_FINAL,
	   MP.BRAND_AVG_PRICE AS PRECO_MEDIO_MARCA,
	   ((PRO.PRICE * (1 + FUN.DISCOUNT)) - MP.BRAND_AVG_PRICE) AS PRECO_VS_MARCA
FROM SALES.FUNNEL FUN
LEFT JOIN SALES.PRODUCTS PRO 
ON FUN.PRODUCT_ID = PRO.PRODUCT_ID
LEFT JOIN MEDIUM_PRICE MP 
ON PRO.BRAND = MP.BRAND;


SELECT *
FROM SALES.FUNNEL
LIMIT 10;

