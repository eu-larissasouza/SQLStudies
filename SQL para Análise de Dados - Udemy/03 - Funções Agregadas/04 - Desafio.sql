-- EXERCÍCIOS ########################################################################

-- (Exercício 1) Conte quantos clientes da tabela sales.customers tem menos de 30 anos
SELECT COUNT(*)
FROM SALES.CUSTOMERS
WHERE EXTRACT(YEAR FROM 
			  AGE(BIRTH_DATE)) < 30;
			  
-- (Exercício 2) Informe a idade do cliente mais velho e mais novo da tabela sales.customers
SELECT MAX((CURRENT_DATE - BIRTH_DATE) / 365) AS IDADE_MAXIMA,
	MIN((CURRENT_DATE - BIRTH_DATE) / 365) AS IDADE_MINIMA
FROM SALES.CUSTOMERS;

-- (Exercício 3) Selecione todas as informações do cliente mais rico da tabela sales.customers
-- (possívelmente a resposta contém mais de um cliente)
SELECT *
FROM SALES.CUSTOMERS
WHERE INCOME =
		(SELECT MAX(INCOME)
			FROM SALES.CUSTOMERS);


-- (Exercício 4) Conte quantos veículos de cada marca tem registrado na tabela sales.products
-- Ordene o resultado pelo nome da marca
SELECT BRAND,
	COUNT(*) CONTAGEM
FROM SALES.PRODUCTS
GROUP BY BRAND
ORDER BY BRAND;


-- (Exercício 5) Conte quantos veículos existem registrados na tabela sales.products
-- por marca e ano do modelo. Ordene pela nome da marca e pelo ano do veículo
SELECT BRAND,
	MODEL_YEAR,
	COUNT(*) CONTAGEM
FROM SALES.PRODUCTS
GROUP BY BRAND,
	MODEL_YEAR
ORDER BY BRAND,
	MODEL_YEAR;

-- (Exercício 6) Conte quantos veículos de cada marca tem registrado na tabela sales.products
-- e mostre apenas as marcas que contém mais de 10 veículos registrados
SELECT BRAND,
	COUNT(*) CONTAGEM
FROM SALES.PRODUCTS
GROUP BY BRAND
HAVING COUNT(*) > 10
ORDER BY CONTAGEM DESC;

