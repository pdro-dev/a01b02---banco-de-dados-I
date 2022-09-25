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
END$$
DELIMITER ;


-- testando procedure
CALL qtdMesasAtendidas(19);
CALL qtdMesasAtendidas(20);


-- drop procedure
DROP PROCEDURE qtdMesasAtendidas;

-- Procedure para dar insert na tabela Comanda

DELIMITER %%

CREATE PROCEDURE dadosComanda
(
valorformaPag VARCHAR (20),
valorpedidoId INT,
dadosvalorTotal FLOAT,
valordataPag DATETIME
)
BEGIN
	INSERT INTO 
		comanda (formaPag, pedidoId, valorTotal, dataPag)
	VALUES
		(valorformaPag, valorpedidoId, dadosvalorTotal, valordataPag);
END %%
DELIMITER ;


/* Procedure para dar insert na tabela mesa */
CREATE PROCEDURE dadosMesa
(
valormesaTipo VARCHAR(100),
valorqtdLugares VARCHAR(100),
valorcomandaId INT
)
BEGIN
	INSERT INTO 
		mesa (mesaTipo, qtdLugares, comandaId)
	VALUES
		(valormesaTipo,valorqtdLugares, valorcomandaId);
END %%
DELIMITER ;


/* Procedure para dar insert na tabela Reserva */

CREATE PROCEDURE dadosReserva
(
dadosReserva VARCHAR(100),
dadosdataReserva VARCHAR(100)
)
BEGIN
	INSERT INTO 
		reserva (valorReserva,dataReserva)
	VALUES
		(dadosReserva,dadosdataReserva);
END %%
DELIMITER ;


/* Procedure para dar insert na tabela reservaMesa */

DELIMITER %%
CREATE PROCEDURE dadosReservaMesa
(
dadosMesaId INT,
dadosReservaId INT
)
BEGIN
	INSERT INTO 
		reservaMesa (mesaId,reservaId)
	VALUES
		(dadosMesaId,dadosReservaId);
END %%
DELIMITER ;



