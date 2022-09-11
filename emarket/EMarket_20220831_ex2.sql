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
	c.Contato
	