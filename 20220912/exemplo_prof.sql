DELIMITER %%
CREATE PROCEDURE sp_lista_vendas
(
    in p_paisEnvio VARCHAR(15),
    out p_totalRetornado INT,
    in p_dataInicial DATE,
    in p_dataFinal DATE,
    out p_mensagem VARCHAR(100)
)
BEGIN
    declare v_auxiliar int default 0;
    
    SELECT
        f.faturaId,
        f.clienteId,
        p.ProdutoNome,
        df.PrecoUnitario,
        df.Quantidade,
        (df.PrecoUnitario * df.Quantidade) AS totalItem
    FROM faturas f
    JOIN detalhefatura df
        ON df.FaturaId = f.faturaId
    JOIN produtos p
        ON p.ProdutoID = df.ProdutoID
    WHERE
        (f.paisEnvio = p_paisEnvio OR p_paisEnvio IS NULL)
        AND f.DataFatura BETWEEN p_dataInicial AND p_dataFinal;
    
    SELECT
        COUNT(*) AS qtd_retornada
    INTO p_totalRetornado
    FROM faturas f
    JOIN detalhefatura df
        ON df.FaturaId = f.faturaId
    JOIN produtos p
        ON p.ProdutoID = df.ProdutoID
    WHERE
        (f.paisEnvio = p_paisEnvio OR p_paisEnvio IS NULL)
        AND f.DataFatura BETWEEN p_dataInicial AND p_dataFinal;
        
    IF (p_totalRetornado > 10) THEN
        set p_mensagem = 'Tem coisa pakas';
    ELSE
        set p_mensagem = 'Tem nada';
    END IF;
        
        
    set p_totalRetornado = v_auxiliar + p_totalRetornado;

END %%
DELIMITER ;