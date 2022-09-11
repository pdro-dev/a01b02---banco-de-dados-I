# AULA 20220830 - EXERCICIO 01
SELECT
	artistas.nome,
    albuns.titulo,
    albuns.id_artista
FROM artistas
INNER JOIN albuns
	ON albuns.id_artista = artistas.id
ORDER BY
	albuns.id_artista ASC
    