-- TIPOS DE CONVERSÃO ##############################################################
-- Operador ::
-- CAST


-- EXEMPLOS ########################################################################

-- (Exemplo 1) Conversão de texto em data
-- Corrija a query abaixo utilizando o operador ::
SELECT '2021-10-01'::DATE - '2021-02-01'::DATE

-- Sintaxe:
SELECT NOME_COLUNA::TIPO_DADOS
FROM ALGUMA_TABELA;


-- (Exemplo 2) Conversão de texto em número
-- Corrija a query abaixo utilizando o operador ::
SELECT '100'::NUMERIC - '10'::NUMERIC;


-- (Exemplo 3) Conversão de número em texto
-- Corrija a query abaixo utilizando o operador ::
-- Replace: vaor, sequencia de caracteres a a ser substituido, valo de substituicao
SELECT REPLACE(112122::TEXT,
			   '1',
			   'A');


-- (Exemplo 4) Conversão de texto em data
-- Corrija a query abaixo utilizando a função CAST
-- Em alguns momentos é melho utilizar o cast
SELECT CAST('2021-10-01' AS DATE) - CAST('2021-02-01' AS DATE);


-- RESUMO ##########################################################################
-- (1) O operador :: e o CAST() são funções utilizadas para converter um dado para 
-- a unidade desejada. 
-- (2) O operador :: é mais "clean", porém, em algumas ocasiões não funciona, sendo
-- necessário utilizar a função CAST()
-- (3) Use o Guia de comandos para consultar a lista de unidades mais utilizadas
-- (4) Postgree não necessita de uma seleção da tabela DUAL (como o Oracle), basta deixar sem o FROM

