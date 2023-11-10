-- PARA QUE SERVEM #################################################################
-- Servem para criar comandos personalizados de scripts usados recorrentemente.


-- EXEMPLOS ########################################################################

-- (Exemplo 1) Crie uma função chamada DATEDIFF para calcular a diferença entre
-- duas datas em dias, semanas, meses, anos

SELECT (CURRENT_DATE - '2018-06-01');

SELECT (CURRENT_DATE - '2018-06-01') / 7;

SELECT (CURRENT_DATE - '2018-06-01') / 30;

SELECT (CURRENT_DATE - '2018-06-01') / 365;

SELECT DATEDIFF('weeks', '2018-06-01', CURRENT_DATE);

-- Criando a função datediff
CREATE FUNCTION datediff(unity varchar, initial_date date, final_date date)
returns integer
language sql
as
$$
 	SELECT CASE WHEN UNITY IN ('d', 'day', 'days') 
					THEN (FINAL_DATE - INITIAL_DATE) 
				WHEN UNITY IN ('w', 'week','weeks') 
					THEN (FINAL_DATE - INITIAL_DATE)/7
				WHEN UNITY IN ('m', 'month', 'months') 
					THEN (FINAL_DATE - INITIAL_DATE) / 30
				WHEN UNITY IN ('y', 'year', 'years')
					THEN (FINAL_DATE - INITIAL_DATE) / 365
		   END as diferenca
$$

-- (Exemplo 2) Delete a função DATEDIFF criada no exercício anterior

DROP FUNCTION DATEDIFF;


-- RESUMO ##########################################################################
-- (1) Para criar funções, utiliza-se o comando CREATE FUNCTION
-- (2) Para que o comando funcione é obrigatório informar (a) quais as unidades dos 
-- INPUTS (b) quais as unidades dos OUTPUTS e (c) em qual linguagem a função será escrita
-- (3) O script da função deve estar delimitado por $$
-- (4) Para deletar uma função utiliza-se o comando DROP FUNCTION

