-- EXERCÍCIOS ########################################################################

-- (Exercício 1) Crie uma coluna calculada com o número de visitas realizadas por cada
-- cliente da tabela sales.customers

WITH count_visits AS (
	SELECT CUSTOMER_ID,
	   	   COUNT(VISIT_ID) AS CUSTOMER_VISITS
	FROM   SALES.FUNNEL
	GROUP  BY CUSTOMER_ID
)
SELECT CUS.*,
	  CV.CUSTOMER_VISITS
FROM SALES.CUSTOMERS CUS
LEFT JOIN COUNT_VISITS CV
ON CUS.CUSTOMER_ID = CV.CUSTOMER_ID
ORDER BY CUSTOMER_VISITS DESC;