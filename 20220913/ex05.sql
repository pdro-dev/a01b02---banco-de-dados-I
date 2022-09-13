USE emarket;

DROP PROCEDURE IF EXISTS sp_vendas_com_desconto;

DELIMITER %%
CREATE PROCEDURE sp_vendas_com_desconto
(
    IN p_desconto DOUBLE
)
BEGIN
    SELECT 
        c.Contato AS NomeCliente,
        p.ProdutoNome AS Produto,
        df.Desconto AS Desconto
    FROM faturas f
    JOIN clientes c ON f.ClienteId = c.ClienteId
    JOIN detalheFatura df ON f.FaturaId = df.FaturaId
    JOIN produtos p ON df.ProdutoId = p.ProdutoId
    WHERE df.Desconto >= p_desconto;
    
END %%
DELIMITER ;


CALL sp_vendas_com_desconto(0.1);