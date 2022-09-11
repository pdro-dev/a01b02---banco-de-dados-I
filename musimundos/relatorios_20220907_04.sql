SELECT
	albuns.id,
	albuns.titulo as TituloAlbum,
    COUNT(cancoes.id) as NumCancoes,
    AVG(cancoes.duracao_milisegundos) as MediaDuracaoMiliSec
FROM albuns
JOIN cancoes ON cancoes.id_album = albuns.id
GROUP BY tituloAlbum