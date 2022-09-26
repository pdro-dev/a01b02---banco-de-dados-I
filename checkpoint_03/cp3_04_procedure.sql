/*
3. Crie uma procedure que, dado um número como parâmetro, retorne dados de duas ou mais tabelas.

*/

-- Procedures para retornar a quantidade de mesas atendidas por funcionario

DELIMITER $$
CREATE PROCEDURE sp_qtdMesasAtendidas 
(
    IN NumFuncId INT
)
BEGIN
    SELECT 
    f.funcionarioId AS 'ID Funcionario',
    CONCAT(f.nome, ' ', f.sobrenome) AS 'Nome Completo',
    f.cargo AS 'Cargo',
    COUNT(p.pedidoId) AS 'Pedidos Retirados'
    FROM funcionarios f
    INNER JOIN pedido p ON f.funcionarioId = p.funcionarioId
    WHERE f.funcionarioId = NumFuncId;
END $$
DELIMITER ;


-- testando procedure
CALL sp_qtdMesasAtendidas(19);
CALL sp_qtdMesasAtendidas(20);


-- drop procedure
-- DROP PROCEDURE qtdMesasAtendidas;

