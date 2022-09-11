SELECT
    c.Empresa,
    COUNT(f.FaturaId)
FROM faturas as f
RIGHT JOIN correios as c
	ON c.CorreioID = f.FormaEnvio
GROUP BY c.Empresa