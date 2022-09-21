USE musimundos;

SELECT
	c.id,
	c.nome,
    c.compositor,
    g.nome
FROM cancoes AS c
INNER JOIN generos AS g
	ON c.id_genero = g.id
WHERE
	c.compositor = "Willie Dixon"
    AND
	g.nome = 'Blues';



SELECT
	c.id,
    c.nome,
    c.compositor,
    g.nome
FROM cancoes AS c
INNER JOIN generos AS g
    ON c.id_genero = g.id
WHERE
    g.nome = 'Rock';



SELECT
	c.id,
	c.nome,
    a.titulo,
    c.compositor
FROM cancoes AS c
INNER JOIN albuns AS a 
	ON c.id = a.id;



SELECT
	c.id,
    c.nome,
    t.nome
FROM cancoes AS c
INNER JOIN tipos_de_arquivo AS t
    ON c.id_tipo_de_arquivo = t.id
WHERE
    t.nome = 'MPEG audio file';



SELECT * FROM empregados;


