/*
3. Crie uma procedure que, dado um número como parâmetro, retorne dados de duas ou mais tabelas.

*/

-- 3. Crie uma procedure que, dado um número como parâmetro, retorne dados de duas ou mais tabelas.

CREATE PROCEDURE cp3_procedure (IN numero INT)
BEGIN
    SELECT * FROM mesa WHERE mesaId = numero;
    SELECT * FROM reserva WHERE reservaId = numero;
    SELECT * FROM reservaMesa WHERE reservaMesaId = numero;
    SELECT * FROM funcionarios WHERE funcionarioId = numero;
    SELECT * FROM pedido WHERE pedidoId = numero;
    SELECT * FROM item WHERE itemId = numero;
    SELECT * FROM itemPedido WHERE itemPedidoId = numero;
END

