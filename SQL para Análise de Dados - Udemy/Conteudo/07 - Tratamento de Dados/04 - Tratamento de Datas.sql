-- TIPOS ###########################################################################
-- INTERVAL
-- DATE_TRUNC
-- EXTRACT
-- DATEDIFF


-- EXEMPLOS ########################################################################

-- (Exemplo 1) Soma de datas utilizando INTERVAL
-- Calcule a data de hoje mais 10 unidades (dias, semanas, meses, horas)
-- Interval traz dados em datetie, se desejar em date basta converter com operador ::

SELECT (CURRENT_DATE + interval '10 days')::date;
SELECT (CURRENT_DATE + interval '10 weeks')::date;
SELECT (CURRENT_DATE + interval '10 months')::date;
SELECT (CURRENT_DATE + interval '10 hours');




-- (Exemplo 2) Truncagem de datas utilizando DATE_TRUNC
-- Calcule quantas visitas ocorreram por mês no site da empresa
-- DATE_TRUNC recebe como argumento a únida de date/time

SELECT VISIT_PAGE_DATE,
	COUNT(*)
FROM SALES.FUNNEL
GROUP BY VISIT_PAGE_DATE
ORDER BY VISIT_PAGE_DATE DESC;

SELECT DATE_TRUNC('month',
			   VISIT_PAGE_DATE)::DATE AS VISIT_PAGE_MONTH,
	COUNT(*)
FROM SALES.FUNNEL
GROUP BY VISIT_PAGE_MONTH
ORDER BY VISIT_PAGE_MONTH DESC;




-- (Exemplo 3) Extração de unidades de uma data utilizando EXTRACT
-- Calcule qual é o dia da semana que mais recebe visitas ao site

--Sintaxe Extract - recebe a unidade
SELECT '2023-11-06'::date,
	   extract('dow' from '2023-11-06'::date); 
-- dow = day of week

SELECT EXTRACT('dow'
			   FROM VISIT_PAGE_DATE) AS DAY_OF_WEEK,
	   COUNT(*)
FROM SALES.FUNNEL
GROUP BY DAY_OF_WEEK
ORDER BY DAY_OF_WEEK;



-- (Exemplo 4) Diferença entre datas com operador de subtração (-) 
-- Calcule a diferença entre hoje e '2018-06-01', em dias, semanas, meses e anos.
-- Resultados aproximados
SELECT (CURRENT_DATE - '2018-06-01') AS DAYS;
SELECT (CURRENT_DATE - '2018-06-01')/7 AS WEEKS;
SELECT (CURRENT_DATE - '2018-06-01')/30 AS MONTHS;
SELECT (CURRENT_DATE - '2018-06-01')/365 AS YEARS;

-- Função datediff (diferença entre datas) - existente em outras linguagem sql




-- RESUMO --------------------------------------------------------------------------
-- (1) O comando INTERVAL é utilizado para somar datas na unidade desejada. Caso a 
-- unidade não seja informada, o SQL irá entender que a soma foi feita em dias.
-- (2) O comando DATE_TRUNC é utilizado para truncar uma data no início do período
-- (3) O comando EXTRACT é utilizado para extrair unidades de uma data/timestamp
-- (4) O cálculo da diferença entre datas com o operador de subtração (-) retorna  
-- valores em dias. Para calcular a diferença entre datas em outra unidade é necessário
-- fazer uma transformação de unidades (ou criar uma função para isso)
-- (5) Utilize o Guia de comandos para consultar as unidades de data e hora utilizadas 
-- no SQL

