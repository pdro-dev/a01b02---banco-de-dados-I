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