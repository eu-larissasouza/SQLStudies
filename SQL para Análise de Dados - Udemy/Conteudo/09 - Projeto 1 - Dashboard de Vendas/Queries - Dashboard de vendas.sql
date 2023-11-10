-- (Query 1) Receita, leads, conversão e ticket médio mês a mês
-- Colunas: mês, leads (#), vendas (#), receita (k, R$), conversão (%), ticket médio (k, R$)

-- Fluxo da Query:

-- Parte 01: Leads --
-- Definição dos leads por mês, usando a data da visita.

-- Parte 02: Dados de pagamento --
-- OBS: Utilizar apenas registro que tenham data de pagamento definida.

-- Definição das vendas por mês: usando a data de pagamento
-- Definição da receita por mês: usando os dados do pagamento e do produto 
   -- Função agregada para calcular a soma dos preços de todos os produtos
   -- Considerar também o desconto dado aos produtos
   
-- Parte 03: Dados clculados com informações anteriores  

WITH LEADS AS (
		SELECT DATE_TRUNC('month', 
					   VISIT_PAGE_DATE)::DATE AS VISIT_PAGE_MONTH,
			COUNT(*) LEADS_COUNT
		FROM SALES.FUNNEL
		GROUP BY VISIT_PAGE_MONTH
		ORDER BY VISIT_PAGE_MONTH
	),
	PAYMENTS AS (
		SELECT DATE_TRUNC('month',
						  FUN.PAID_DATE)::DATE AS PAID_DATE_MONTH,
			COUNT(*) AS SALES_COUNT,
			SUM(PRO.PRICE * (1 + FUN.DISCOUNT)) AS REVENUE
		FROM SALES.FUNNEL FUN
		LEFT JOIN SALES.PRODUCTS PRO ON FUN.PRODUCT_ID = PRO.PRODUCT_ID
		WHERE PAID_DATE IS NOT NULL
		GROUP BY PAID_DATE_MONTH
		ORDER BY PAID_DATE_MONTH
	)
SELECT LD.VISIT_PAGE_MONTH AS "mês",
	LD.LEADS_COUNT AS "leads (#)",
	PT.SALES_COUNT AS "vendas (#)",
	(PT.REVENUE / 1000) AS "receita (k, R$)",
	((PT.SALES_COUNT::FLOAT / LD.LEADS_COUNT::FLOAT) * 100) AS "conversão (%)",
	((PT.REVENUE / PT.SALES_COUNT) / 1000) AS "ticket Médio (k, R$)"
FROM LEADS LD
LEFT JOIN PAYMENTS PT
ON LD.VISIT_PAGE_MONTH = PT.PAID_DATE_MONTH
ORDER BY LD.VISIT_PAGE_MONTH;




-- (Query 2) Estados que mais venderam
-- Colunas: país, estado, vendas (#)
SELECT 'Brasil' AS PAÍS,
	CUS.STATE AS ESTADO,
	COUNT(*) AS "vendas (#)"
FROM SALES.FUNNEL AS FUN
LEFT JOIN SALES.CUSTOMERS AS CUS
ON FUN.CUSTOMER_ID = CUS.CUSTOMER_ID
WHERE FUN.PAID_DATE BETWEEN '2021-08-01' and '2021-08-31'
GROUP BY PAÍS,
	ESTADO
ORDER BY "vendas (#)" DESC
LIMIT 5;


-- (Query 3) Marcas que mais venderam no mês
-- Colunas: marca, vendas (#)
SELECT PRO.BRAND AS marca,
	COUNT(*) AS "vendas (#)"
FROM SALES.FUNNEL AS FUN
LEFT JOIN SALES.PRODUCTS PRO
ON FUN.PRODUCT_ID = PRO.PRODUCT_ID
WHERE FUN.PAID_DATE BETWEEN '2021-08-01' and '2021-08-31'
GROUP BY PRO.BRAND
ORDER BY "vendas (#)" DESC
LIMIT 5;


-- (Query 4) Lojas que mais venderam
-- Colunas: loja, vendas (#)
SELECT STO.STORE_NAME AS loja,
	COUNT(*) AS "vendas (#)"
FROM SALES.FUNNEL AS FUN
LEFT JOIN SALES.STORES STO
ON FUN.STORE_ID = STO.STORE_ID
WHERE FUN.PAID_DATE BETWEEN '2021-08-01' and '2021-08-31'
GROUP BY STO.STORE_NAME
ORDER BY "vendas (#)" DESC
LIMIT 5;

-- (Query 5) Dias da semana com maior número de visitas ao site
-- Colunas: dia_semana, dia da semana, visitas (#)

SELECT EXTRACT(DOW FROM VISIT_PAGE_DATE) AS DIA_SEMANA,
	CASE EXTRACT(DOW FROM VISIT_PAGE_DATE)
		WHEN 0 THEN 'domingo'
		WHEN 1 THEN 'segunda'
		WHEN 2 THEN 'terça'
		WHEN 3 THEN 'quarta'
		WHEN 4 THEN 'quinta'
		WHEN 5 THEN 'sexta'
		WHEN 6 THEN 'sábado'
	END AS "dia da semana",
	COUNT(*) AS "visitas (#)"
FROM SALES.FUNNEL
GROUP BY DIA_SEMANA,
	"dia da semana"
ORDER BY DIA_SEMANA;

