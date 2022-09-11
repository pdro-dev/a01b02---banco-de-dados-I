# AULA 20220830 - EXERCICIO 02
SELECT
	clientes.nome,
    faturas.id as 'id_faturas',
    faturas.valor_total
FROM clientes
INNER JOIN faturas
	ON faturas.valor_total > 5
ORDER BY
	faturas.valor_total DESC
