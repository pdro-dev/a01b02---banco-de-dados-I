# AULA 20220830 - EXERCICIO 03

USE musimundos;

SELECT
	cancoes.id,
	cancoes.nome as 'NOME CANCAO',
    tipos_de_arquivo.nome as 'TIPO ARQUIVO'
FROM cancoes
INNER JOIN tipos_de_arquivo
	ON tipos_de_arquivo.id = cancoes.id_tipo_de_arquivo
ORDER BY
	cancoes.id