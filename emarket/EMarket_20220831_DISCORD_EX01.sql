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
