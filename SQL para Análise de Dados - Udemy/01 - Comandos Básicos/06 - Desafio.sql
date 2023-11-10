-- EXERCÍCIOS ######################################################################
 -- (Exercício 1) Selecione os nomes de cidade distintas que existem no estado de
-- Minas Gerais em ordem alfabética (dados da tabela sales.customers)

SELECT DISTINCT CITY
FROM SALES.CUSTOMERS
WHERE STATE = 'MG'
ORDER  BY CITY;


SELECT DISTINCT STATE
FROM SALES.CUSTOMERS;

-- (Exercício 2) Selecione o visit_id das 10 compras mais recentes efetuadas
-- (dados da tabela sales.funnel)

SELECT VISIT_ID
FROM SALES.FUNNEL
WHERE PAID_DATE IS NOT NULL
ORDER  BY PAID_DATE DESC
LIMIT 10;

-- (Exercício 3) Selecione todos os dados dos 10 clientes com maior score nascidos
-- após 01/01/2000 (dados da tabela sales.customers)

SELECT *
FROM SALES.CUSTOMERS
WHERE BIRTH_DATE >= '2000-01-01'
ORDER  BY SCORE DESC
LIMIT 10;