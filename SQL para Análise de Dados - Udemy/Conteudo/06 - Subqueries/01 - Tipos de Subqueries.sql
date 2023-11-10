-- PARA QUE SERVE ##################################################################
-- Servem para consultar dados de outras consultas.


-- TIPOS ###########################################################################
-- Subquery no WHERE
-- Subquery com WITH
-- Subquery no FROM
-- Subquery no SELECT


-- EXEMPLOS ########################################################################

-- (Exemplo 1) Subquery no WHERE
-- Informe qual é o veículo mais barato da tabela products
SELECT *
FROM SALES.PRODUCTS
WHERE PRICE =
		(SELECT MIN(PRICE)
			FROM SALES.PRODUCTS);

-- (Exemplo 2) Subquery com WITH
-- Calcule a idade média dos clientes por status profissional
-- Uma das funções mais usadas no trabalho de um analista de dados
WITH MY_CUSTOMERS AS
	(SELECT PROFESSIONAL_STATUS,
			EXTRACT(YEAR
					FROM AGE(BIRTH_DATE)) AS IDADE
		FROM SALES.CUSTOMERS)
SELECT PROFESSIONAL_STATUS,
	AVG(IDADE) AS IDADE_MEDIA
FROM MY_CUSTOMERS
GROUP BY PROFESSIONAL_STATUS;
	

-- (Exemplo 3) Subquery no FROM
-- Calcule a média de idades dos clientes por status profissional
-- Dificulta a legibilidade do código, aconselhável usar o WITH
SELECT PROFESSIONAL_STATUS,
	AVG(IDADE) AS IDADE_MEDIA
FROM
	(SELECT PROFESSIONAL_STATUS,
			EXTRACT(YEAR
					FROM AGE(BIRTH_DATE)) AS IDADE
		FROM SALES.CUSTOMERS) AS ALGUMA_TABELA
GROUP BY PROFESSIONAL_STATUS;

-- (Exemplo 4) Subquery no SELECT
-- Na tabela sales.funnel crie uma coluna que informe o nº de visitas acumuladas 
-- que a loja visitada recebeu até o momento
-- Faz a contagem de visitas que sejam na mesma loja e mesma data.
-- Esse modo de subquery torna a execução da query muito mais lenta.
SELECT FUN.VISIT_PAGE_DATE,
	STO.STORE_NAME,
	(SELECT COUNT(*)
		FROM SALES.FUNNEL AS FUN2
		WHERE FUN2.VISIT_PAGE_DATE <= FUN.VISIT_PAGE_DATE
			AND FUN2.STORE_ID = FUN.STORE_ID) AS COUNT_VISITS
FROM SALES.FUNNEL AS FUN
LEFT JOIN SALES.STORES AS STO
ON FUN.STORE_ID = STO.STORE_ID
ORDER BY STO.STORE_NAME,
	FUN.VISIT_PAGE_DATE;


-- RESUMO ##########################################################################
-- (1) Servem para consultar dados de outras consultas.
-- (2) Para que as subqueries no WHERE e no SELECT funcionem, elas devem retornar 
-- apenas um único valor
-- (3) Não é recomendado utilizar subqueries diretamente dentro do FROM pois isso 
-- dificulta a legibilidade da query. 
