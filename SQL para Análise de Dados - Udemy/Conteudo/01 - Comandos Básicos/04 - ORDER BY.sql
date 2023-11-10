-- PARA QUE SERVE ##################################################################
-- Serve para ordenar a seleção de acordo com uma regra definida pelo usuário
-- SINTAXE #########################################################################

SELECT COLUNA_1,
	COLUNA_2,
	COLUNA_3
FROM SCHEMA_1.TABELA_1
WHERE CONDIÇÃO_X = TRUE
ORDER BY COLUNA_1;

-- EXEMPLOS ########################################################################
-- (Exemplo 1) Ordenação de valores numéricos
-- Liste produtos da tabela products na ordem crescente com base no preço
SELECT *
FROM   sales.products
ORDER  BY price;

-- Ordem Decrescente
SELECT *
FROM   sales.products
ORDER  BY price DESC;

-- (Exemplo 2) Ordenação de texto
-- Liste os estados distintos da tabela customers na ordem crescente (Ordem alfabética)
SELECT DISTINCT state
FROM   sales.customers
ORDER  BY state;

-- RESUMO ##########################################################################
-- (1) Comando utilizado para ordenar a seleção de acordo com uma regra definida
-- (2) Por padrão o comando ordena na ordem crescente. Para mudar para a ordem
-- decrescente usar o comando DESC
-- (3) No caso de strings a ordenação será seguirá a ordem alfabetica
