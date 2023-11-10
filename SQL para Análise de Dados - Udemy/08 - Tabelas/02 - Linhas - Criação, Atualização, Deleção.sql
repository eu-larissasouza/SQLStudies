-- CONTEÚDO ########################################################################
-- Inserção de linhas
-- Atualização de linhas
-- Deleção de linhas


-- EXEMPLOS ########################################################################

-- (Exemplo 1) Inserção de linhas
-- Insira os status 'desempregado(a)' e 'estagiário(a)' na temp_table.profissoes

INSERT INTO TEMP_TABLES.PROFISSOES (PROFESSIONAL_STATUS, STATUS_PROFISSIONAL)
VALUES ('trainee', 'estagiário(a)'),
	   ('unemployed', 'desempregado(a)');
	  
SELECT *
FROM TEMP_TABLES.PROFISSOES;	 

-- (Exemplo 2) Atualização de linhas
-- Corrija a tradução de 'estagiário(a)' de 'trainee' para 'intern' 
UPDATE TEMP_TABLES.PROFISSOES
SET    professional_status = 'intern'
WHERE  professional_status = 'trainee';

SELECT *
FROM TEMP_TABLES.PROFISSOES;

-- (Exemplo 3) Deleção de linhas
-- Delete as linhas dos status 'desempregado(a)' e 'estagiário(a)'
DELETE
FROM TEMP_TABLES.PROFISSOES
WHERE PROFESSIONAL_STATUS IN ('intern', 'unemployed');



-- RESUMO ##########################################################################
-- (1) Para inserir linhas em uma tabela é necessário (a) Informar que valores serão 
-- inseridos com o comando INSERT INTO seguido do nome da tabela e nome das colunas 
-- (b) Inserir os valores manualmente em forma de lista após o comando VALUES
-- (2) Para atualizar as linhas de uma tabela é necessário (a) Informar qual tabela
-- será atualizada com o comando UPDATE (b) Informar qual o novo valor com o comando SET 
-- (c) Delimitar qual linha será modificada utilizando o filtro WHERE
-- (3) Para deletar linhas de uma tabela é necessário (a) Informar de qual tabela as
-- linhas serão deletadas com o comando DELETE FROM (b) Delimitar qual linha será 
-- deletada utilizando o filtro WHERE


