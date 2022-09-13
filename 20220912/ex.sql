-- MySQL


DELIMITER %%
CREATE PROCEDURE sp_lista_vendas
(
    IN p_paisEnvio VARCHAR(50),
    IN p_dataInicio DATE,
    IN p_dataFim DATE,
    OUT p_totalRetornado INT;
)
BEGIN
    SELECT 
        f.faturaId,
        c.clienteId,
        p.ProdutoNome,
        df.PrecoUnitario,
        df.Quantidade,
        (df.PrecoUnitario * df.Quantidade) AS Total,
        SELECT
            COUNT(*) AS totalRetornado
        INTO p_totalRetornado
    FROM faturas f
    JOIN detalheFatura df ON f.faturaId = df.faturaId
    JOIN produtos p ON df.ProdutoId = p.ProdutoId;
    WHERE f.PaisEnvio = p_paisEnvio OR p_paisEnvio IS NULL;
    AND f.DataFatura BETWEEN p_dataInicio AND p_dataFim;

END %%
DELIMITER ;

-- SHOW PROCEDURE STATUS

-- DROP PROCEDURE sp_lista_vendas

CALL sp_lista_vendas('Brazil', '1996-01-01', '1996-12-31', @p_totalRetornado);