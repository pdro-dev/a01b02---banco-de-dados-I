Pedro Simões
Gabriel Teodoro
Izabela Guimarães
Ana Isabel
Igor Matos



CREATE 


#1 
SELECT 
	empresa,
    faturaId,
    sum(transporte)
FROM faturas as f
	INNER JOIN correios as c
	ON f.FormaEnvio = c.CorreioID
GROUP BY empresa





# AULA 20220831 - EXERCÍCIO 2
USE emarket;
SELECT DISTINCT
		c.ClienteID,
    c.Contato,
    c.Titulo,
    c.Endereco,
    c.Cidade,
    CONCAT('Sr/a ', c.Contato, ' | Cargo: ', c.Titulo, ' | Cidade: ', c.Cidade) as Descrição
FROM
		clientes AS c
ORDER BY
		c.Contato ASC
    
    
#3
SELECT 
	c.CategoriaNome AS nome,
    c.descricao,
    sum(quantidadePorUnidade) AS 'quantidade de produtos'
FROM produtos
	INNER JOIN categorias AS c
    ON produtos.CategoriaID = c.CategoriaID
GROUP BY CategoriaNome;



##################

# 1. Fazer uma query para retornar apenas os clientes que têm 3 faturas ou mais. 
# Retorne o nome do cliente, seu id e a quantidade de faturas. 
# Os registros devem ser exibidos em ordem decrescentes.

#20220831 DISCORD EX01

SELECT
	c.Contato AS Nome_Cliente,
  c.ClienteID,
	COUNT(f.FaturaId) AS 'Qtd_Faturas'
FROM
	clientes as c
INNER JOIN faturas as f
	ON f.ClienteID = c.ClienteID
GROUP BY
	c.ClienteID
HAVING Qtd_Faturas >= 3
ORDER BY
	Qtd_Faturas DESC



# 2. Atualizar o campo Transporte (tabela Produtos) 
# em 10% apenas para clientes que têm mais de 3 faturas. 
# DICA: subconsulta

#ex 2 discord
UPDATE faturas 
	INNER JOIN clientes as c
    ON faturas.clienteId = c.clienteId
SET transporte = transporte + Transporte / 10 * 100
WHERE transporte in (
					SELECT
						COUNT(faturas.FaturaId) AS 'Qtd_Faturas'
					FROM
						clientes as c
					GROUP BY
						c.ClienteID
					HAVING Qtd_Faturas > 3
					ORDER BY
						Qtd_Faturas DESC
					);


# 3. Crie uma query que mostre 
# o nome do mês por extenso e 
# a quantidade de empregados 
# que fazem aniversário no mês em questão. Ex.:

# MES            QtAniversariantes
# janeiro        10
# fevereiro      1
# abril          4

# DICA: vejam as funções EXTRACT e DATE_FORMAT

#20220831 DISCORD EX03
SELECT
		MONTHNAME(DataNascimento) AS 'Mês',
    COUNT(EmpregadoID) AS 'Qtd_Aniversariantes'
FROM empregados
GROUP BY Mês
ORDER BY MONTH(DataNascimento)