/*
Referência de Tabelas #1 - Faça uma consulta no banco de dados onde mostre todos os registros que contenham músicas com seus gêneros, E que o compositor seja Willie Dixon, E que tenham o gênero Blues. A 2ª música encontrada foi:

*/

USE musimundos;

SELECT
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

/*
Joins #1 - Faça uma consulta ao nosso banco de dados que nos retorna as únicas músicas que possuem gênero rock. Qual é a música que aparece em quarto lugar?
*/

SELECT
    c.nome,
    c.compositor,
    g.nome
FROM cancoes AS c
INNER JOIN generos AS g
    ON c.id_genero = g.id
WHERE
    g.nome = 'Rock';


/*
Joins #2 -Faça uma consulta ao nosso banco de dados que nos traga o título do álbum e o autor, para saber se o que estamos vendendo está correto.Qual o título do álbum que aparece na posição número 10?
*/

SELECT
    a.titulo,
    a.autor
FROM albuns AS a
INNER JOIN cancoes AS c
    ON a.id = c.id_album
WHERE
    c.id = 10;

/*
Joins #3 - Faça uma consulta que retorne o nome das músicas e o tipo de arquivo "MPEG audio file". Qual o nome da músca que aparece na posição número 4?
*/

SELECT
    c.nome,
    c.tipo_arquivo
FROM cancoes AS c
INNER JOIN tipos_arquivos AS t
    ON c.id_tipo_arquivo = t.id
WHERE
    t.nome = 'MPEG audio file';

/*

Distinct #2 - Ranking cancoes: Faça uma consulta com o nome de todas as músicas que estão em uma lista de reprodução, e o nome da lista de reprodução a que pertencem.Observação! Tenhamos cuidado para não repetir os nomes das músicas.Para esta consulta, teremos que usar informações das tabelas cancoes, cancoes_playlists e playlists. O título da música na 5a. posição é:
    
    */

SELECT
    c.nome,
    p.nome
FROM cancoes AS c
INNER JOIN cancoes_playlists AS cp
    ON c.id = cp.id_cancoes
INNER JOIN playlists AS p
    ON cp.id_playlists = p.id
WHERE
    c.id = 5;