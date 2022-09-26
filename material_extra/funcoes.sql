USE emarket;

DELIMITER %%

CREATE FUNCTION verifica_situacao
(
    p_faturaId INT
) RETURNS VARCHAR(15)
    DETERMINISTIC
BEGIN

    DECLARE v_dias TINYINT DEFAULT 5;
    DECLARE v_resultado VARCHAR(15);
    
    /*
        Como desafio, tente fazer a lógica usando IF
    */
    
    SELECT
        CASE WHEN DATE_ADD(datafatura, INTERVAL 5 DAY) < dataEnvio
            THEN 'Atrasado'
            ELSE 'No prazo' END
    INTO v_resultado
    FROM
        Faturas
    WHERE
        faturaId = p_faturaId;
        
    RETURN v_resultado;

END %%

DELIMITER ;


SELECT
    faturaId,
    datafatura,
    dataEnvio,
    verifica_situacao(faturaId) AS situacao
FROM
    Faturas;