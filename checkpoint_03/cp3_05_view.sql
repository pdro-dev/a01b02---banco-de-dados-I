/*
4. Crie uma view que contemple os principais dados do banco, de forma que qualquer usuário possa manipular os dados apenas pela view criada
*/


CREATE VIEW vw_dados AS
SELECT
    -- dados de funcionarios
    f.funcionarioId AS 'ID Funcionario',
    CONCAT(f.nome, ' ', f.sobrenome) AS 'Nome Completo',
    f.cargo AS 'Cargo',
    f.dataContrat AS 'Data Contratação',
    f.dataNasc AS 'Data Nascimento',
    -- dados de pedidos
    p.mesaId AS 'ID Mesa',
    p.pedidoId AS 'ID Pedido',
    -- dados de comanda
    c.comandaId AS 'ID Comanda',
    c.formaPag AS 'Forma Pagamento',
    c.dataPag AS 'Data Pagamento',
    c.valorTotal AS 'Valor Total Comanda',
    -- dados de itens dos pedidos
    ip.itemId AS 'ID Item',
    ip.qtdItem AS 'Quantidade Item',
    ip.valorTotal AS 'Valor Total Item',
    -- dados de itens
    i.nome AS 'Nome Item',
    i.valorUnitario AS 'Valor Unitario Item',
    i.dataCompra AS 'Data Compra Item',
    i.dataValidade AS 'Data Validade Item',
    i.quantidade AS 'Quantidade Item Estoque',
    i.categoria AS 'Categoria Item',
    -- dados de mesa
    m.mesaTipo AS 'Tipo Mesa',
    m.qtdLugares AS 'Quantidade Lugares',
    -- dados de reserva e reserva_mesa
    r.reservaId AS 'ID Reserva',
    r.dataReserva AS 'Data Reserva',
    r.valorReserva AS 'Valor Reserva',
    rm.reservaMesaId AS 'ID Reserva Mesa',
    rm.mesaId AS 'ID Mesa Reserva',
    rm.reservaId AS 'ID Reserva Reserva'


FROM funcionarios f
INNER JOIN pedido p ON p.funcionarioId = f.funcionarioId
INNER JOIN mesa m ON p.mesaId = m.mesaId
INNER JOIN reservamesa rm ON m.mesaId = rm.mesaId
INNER JOIN reserva r ON rm.reservaId = r.reservaId
INNER JOIN comanda c ON m.mesaId = c.mesaId
INNER JOIN itemPedido ip ON ip.pedidoId = p.pedidoId
INNER JOIN item i ON i.itemId = ip.itemId;



-- testando view
SELECT * FROM vw_dados;


-- DROP VIEW vw_dados;
