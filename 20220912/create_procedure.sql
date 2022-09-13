USE emarket;

DELIMITER %%
CREATE PROCEDURE sp_lista_vendas
(
    IN p_paisEnvio VARCHAR(50),
    IN p_dataInicio DATE,
    IN p_dataFim DATE
)
BEGIN
    SELECT 
        f.faturaId,
        f.clienteId,
        p.ProdutoNome,
        df.PrecoUnitario,
        df.Quantidade,
        (df.PrecoUnitario * df.Quantidade) AS Total
    FROM faturas f
    JOIN detalheFatura df ON f.faturaId = df.faturaId
    JOIN produtos p ON df.ProdutoId = p.ProdutoId
    WHERE f.PaisEnvio = p_paisEnvio OR p_paisEnvio IS NULL
    AND f.DataFatura BETWEEN p_dataInicio AND p_dataFim;

END %%
DELIMITER ;

-- SHOW PROCEDURE STATUS


