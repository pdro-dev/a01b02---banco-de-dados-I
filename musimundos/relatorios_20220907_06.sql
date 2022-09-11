select
	clientes.id,
    SUM(faturas.valor_total) as vlrTot
from clientes
JOIN faturas on clientes.id = faturas.id_cliente
group by clientes.id
having vlrTot > 45
