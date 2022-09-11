USE musimundos;

SELECT
	c.pais,
    COUNT(c.id)
FROM clientes as c
GROUP BY c.pais
HAVING c.pais = 'Brazil'