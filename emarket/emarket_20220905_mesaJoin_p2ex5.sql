SELECT
	c.ClienteID,
	c.Contato,
    f.FaturaId,
	DATE_FORMAT(MAX(f.DataFatura), "%d/%m/%Y") AS data_fatura
FROM clientes AS c
LEFT JOIN faturas as f
	ON c.ClienteID = f.ClienteID
GROUP BY c.Contato
ORDER BY data_fatura


    
    