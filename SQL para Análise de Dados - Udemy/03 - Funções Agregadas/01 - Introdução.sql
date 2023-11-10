-- PARA QUE SERVE ##################################################################
-- Servem para executar operações aritméticas nos registros de uma coluna 


-- TIPOS DE FUNÇÕES AGREGADAS ######################################################
-- COUNT() 
-- SUM()
-- MIN()
-- MAX()
-- AVG()


-- EXEMPLOS ########################################################################

-- COUNT() -------------------------------------------------------------------------

-- (Exemplo 1) Contagem de todas as linhas de uma tabela
-- Conte todas as visitas realizadas ao site da empresa fictícia
SELECT COUNT(*)
FROM   sales.funnel;


-- (Exemplo 2) Contagem das linhas de uma coluna
-- Conte todos os pagamentos registrados na tabela sales.funnel 
SELECT *
FROM   sales.funnel
LIMIT  10;

SELECT COUNT (PAID_DATE)
FROM SALES.FUNNEL;

-- (Exemplo 3) Contagem distinta de uma coluna
-- Conte todos os produtos distintos visitados em jan/21
SELECT COUNT(product_id) 
from   sales.funnel
where  visit_page_date between '2021-01-01' and '2021-01-31';

--Mas a solução acima apenas contabiliza visitas em produtos, sem verificar se são os mesmos
--Poderiam haver mais de 1000 visitas, mas na prática serem em apenas 1 produto.
SELECT COUNT(DISTINCT product_id) 
from   sales.funnel
where  visit_page_date between '2021-01-01' and '2021-01-31';


-- OUTRAS FUNÇÕES ------------------------------------------------------------------

-- (Exemplo 4) Calcule o preço mínimo, máximo e médio dos productos da TABELA PRODUCTS
SELECT MIN(PRICE) AS MINIMO,
	MAX(PRICE) AS MAXIMO,
	AVG(PRICE) AS MEDIO
FROM SALES.PRODUCTS;

-- (Exemplo 5) Informe qual é o veículo mais caro da tabela products
SELECT MAX(PRICE) AS MAXIMO
FROM SALES.PRODUCTS;

-- Mas qual seria esse produto?
-- Podemos resolver ocm uma subquery
SELECT *
FROM SALES.PRODUCTS
WHERE PRICE =
		(SELECT MAX(PRICE)
			FROM SALES.PRODUCTS);

-- RESUMO ##########################################################################
-- (1) Servem para executar operações aritmética nos registros de uma coluna 
-- (2) Funções agregadas não computam células vazias (NULL) como zero
-- (3) Na função COUNT() pode-se utilizar o asterisco (*) para contar os registros
-- (4) COUNT(DISTINCT ) irá contar apenas os valores exclusivos







