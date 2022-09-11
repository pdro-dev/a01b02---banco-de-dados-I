SELECT
	g.id,
	g.nome,
    COUNT(cancoes.id)
FROM generos as g
INNER JOIN cancoes ON id_genero = g.id
GROUP BY g.nome