#1 
SELECT 
	empresa,
    faturaId,
    sum(transporte)
FROM faturas as f
	INNER JOIN correios as c
	ON f.FormaEnvio = c.CorreioID
GROUP BY empresa