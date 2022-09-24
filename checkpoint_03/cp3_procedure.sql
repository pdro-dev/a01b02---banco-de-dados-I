/*
3. Crie uma procedure que, dado um número como parâmetro, retorne dados de duas ou mais tabelas.

*/

-- Procedures para retornar a quantidade de mesas atendidas por funcionario

DELIMITER $$
CREATE PROCEDURE qtdMesasAtendidas 
(
    IN NumFuncId INT
)
BEGIN
    SELECT 
    -- nome completo funcionario
    CONCAT(f.nome, ' ', f.sobrenome) AS 'Nome Completo',
    -- cargo funcionario
    f.cargo AS 'Cargo',
    -- quantidade de mesas atendidas
    COUNT (m.mesaId) AS 'Mesas Atendidas'
    -- quantidade de pedidos retirados
    COUNT(p.pedidoId) AS 'Pedidos Retirados'
    FROM funcionarios f
    INNER JOIN pedido p ON p.funcionarioId = f.funcionarioId
    WHERE f.funcionarioId = NumFuncId;
END$$
DELIMITER ;


-- testando procedure
CALL qtdMesasAtendidas(1);

-- drop procedure
DROP PROCEDURE qtdMesasAtendidas;