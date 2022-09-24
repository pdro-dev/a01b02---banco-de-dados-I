CREATE DATABASE IF NOT EXISTS checkpoint_3;
USE checkpoint_3;

CREATE TABLE IF NOT EXISTS mesa (
	mesaId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    mesaTipo VARCHAR(20) NOT NULL,
    qtdLugares TINYINT NOT NULL
);

CREATE TABLE IF NOT EXISTS reserva (
	reservaId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    valorReserva DECIMAL(4,2) NOT NULL,
    dataReserva DATETIME
);

CREATE TABLE IF NOT EXISTS reservaMesa (
	reservaMesaId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    mesaId INT NOT NULL,
    reservaId INT NOT NULL,
    CONSTRAINT cnt_RM_Mesa FOREIGN KEY (mesaId) REFERENCES mesa(mesaId),
    CONSTRAINT cnt_RM_Reserva FOREIGN KEY (reservaId) REFERENCES reserva(reservaId)
);

CREATE TABLE IF NOT EXISTS funcionarios (
	funcionarioId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(20) NOT NULL,
    sobrenome VARCHAR(50) NOT NULL,
    dataContrat DATE NOT NULL,
    dataNasc DATE NOT NULL,
    cargo VARCHAR(25) NOT NULL
);

CREATE TABLE IF NOT EXISTS pedido (
	pedidoId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    mesaId INT NOT NULL,
    funcionarioId INT NOT NULL,
    CONSTRAINT cnt_pedido_Mesa FOREIGN KEY (mesaId) REFERENCES mesa(mesaId),
    CONSTRAINT cnt_pedido_funcionario FOREIGN KEY (funcionarioId) REFERENCES funcionarios(funcionarioId)
);

CREATE TABLE IF NOT EXISTS item (
    -- (nome, valorUnitario, dataCompra, dataValidade, quantidade, categoria)
	itemId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(20) NOT NULL,
    valorUnitario DECIMAL(6,2) NOT NULL,
    dataCompra DATE NOT NULL,
    dataValidade DATE NOT NULL,
    quantidade INT NOT NULL,
    categoria VARCHAR(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS itemPedido (
	itemPedidoId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    pedidoId INT NOT NULL,
    itemId INT NOT NULL,
    qtdItem TINYINT,
    valorTotal DECIMAL(6,2) NOT NULL,
	CONSTRAINT cnt_pedido_itemPedido FOREIGN KEY (pedidoId) REFERENCES pedido(pedidoId),
    CONSTRAINT cnt_item_itemPedido FOREIGN KEY (itemId) REFERENCES item(itemId)
);

CREATE TABLE IF NOT EXISTS comanda (
	comandaId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    formaPag VARCHAR(20) NOT NULL,
    pedidoId INT NOT NULL,
    valorTotal DECIMAL(6,2) NOT NULL,
    dataPag DATETIME,
    CONSTRAINT cnt_comanda_pedido FOREIGN KEY (pedidoId) REFERENCES pedido(pedidoId)
);


-- -- inserir 10 registros em cada tabela
-- -- registros tabela mesa
INSERT INTO mesa (mesaTipo, qtdLugares) VALUES ('Balcão', 1);
INSERT INTO mesa (mesaTipo, qtdLugares) VALUES ('Mesa de 2 lugares', 2);
INSERT INTO mesa (mesaTipo, qtdLugares) VALUES ('Mesa de 4 lugares', 4);
INSERT INTO mesa (mesaTipo, qtdLugares) VALUES ('Mesa de 6 lugares', 6);
INSERT INTO mesa (mesaTipo, qtdLugares) VALUES ('Mesa de 8 lugares', 8);
INSERT INTO mesa (mesaTipo, qtdLugares) VALUES ('Mesa de 10 lugares', 10);
INSERT INTO mesa (mesaTipo, qtdLugares) VALUES ('Mesa de 12 lugares', 12);
INSERT INTO mesa (mesaTipo, qtdLugares) VALUES ('Mesa de 14 lugares', 14);
INSERT INTO mesa (mesaTipo, qtdLugares) VALUES ('Mesa de 16 lugares', 16);
INSERT INTO mesa (mesaTipo, qtdLugares) VALUES ('Mesa de 18 lugares', 18);

-- -- registros tabela reserva
INSERT INTO reserva (valorReserva, dataReserva) VALUES (100.00, '2020-10-10 10:00:00');
INSERT INTO reserva (valorReserva, dataReserva) VALUES (200.00, '2020-10-10 10:00:00');
INSERT INTO reserva (valorReserva, dataReserva) VALUES (300.00, '2020-10-10 10:00:00');
INSERT INTO reserva (valorReserva, dataReserva) VALUES (400.00, '2020-10-10 10:00:00');
INSERT INTO reserva (valorReserva, dataReserva) VALUES (500.00, '2020-10-10 10:00:00');
INSERT INTO reserva (valorReserva, dataReserva) VALUES (600.00, '2020-10-10 10:00:00');
INSERT INTO reserva (valorReserva, dataReserva) VALUES (700.00, '2020-10-10 10:00:00');
INSERT INTO reserva (valorReserva, dataReserva) VALUES (800.00, '2020-10-10 10:00:00');
INSERT INTO reserva (valorReserva, dataReserva) VALUES (900.00, '2020-10-10 10:00:00');
INSERT INTO reserva (valorReserva, dataReserva) VALUES (1000.00, '2020-10-10 10:00:00');

-- -- registros tabela reservaMesa
INSERT INTO reservaMesa (mesaId, reservaId) VALUES (1, 1);
INSERT INTO reservaMesa (mesaId, reservaId) VALUES (2, 2);
INSERT INTO reservaMesa (mesaId, reservaId) VALUES (3, 3);
INSERT INTO reservaMesa (mesaId, reservaId) VALUES (4, 4);
INSERT INTO reservaMesa (mesaId, reservaId) VALUES (5, 5);
INSERT INTO reservaMesa (mesaId, reservaId) VALUES (6, 6);
INSERT INTO reservaMesa (mesaId, reservaId) VALUES (7, 7);
INSERT INTO reservaMesa (mesaId, reservaId) VALUES (8, 8);
INSERT INTO reservaMesa (mesaId, reservaId) VALUES (9, 9);
INSERT INTO reservaMesa (mesaId, reservaId) VALUES (10, 10);

-- -- registros tabela funcionarios (gerente, maître, garçom 10x, commins, chef, cozinheiro, auxiliar_de_cozinha, barman, auxiliar_de_limpeza, segurança)
INSERT INTO funcionarios (nome, sobrenome, dataContrat, dataNasc, cargo) VALUES ('João', 'Silva', '2020-10-10', '1990-10-10', 'Gerente');
INSERT INTO funcionarios (nome, sobrenome, dataContrat, dataNasc, cargo) VALUES ('Maria', 'Silva', '2020-10-10', '1990-10-10', 'Maître');
INSERT INTO funcionarios (nome, sobrenome, dataContrat, dataNasc, cargo) VALUES ('José', 'Silva', '2020-10-10', '1990-10-10', 'Commins');
INSERT INTO funcionarios (nome, sobrenome, dataContrat, dataNasc, cargo) VALUES ('Antonio', 'Silva', '2020-10-10', '1990-10-10', 'Chef');
INSERT INTO funcionarios (nome, sobrenome, dataContrat, dataNasc, cargo) VALUES ('Pedro', 'Silva', '2020-10-10', '1990-10-10', 'Cozinheiro');
INSERT INTO funcionarios (nome, sobrenome, dataContrat, dataNasc, cargo) VALUES ('Paulo', 'Silva', '2020-10-10', '1990-10-10', 'Auxiliar de cozinha');
INSERT INTO funcionarios (nome, sobrenome, dataContrat, dataNasc, cargo) VALUES ('Carlos', 'Silva', '2020-10-10', '1990-10-10', 'Barman');
INSERT INTO funcionarios (nome, sobrenome, dataContrat, dataNasc, cargo) VALUES ('Rafael', 'Silva', '2020-10-10', '1990-10-10', 'Auxiliar de limpeza');
INSERT INTO funcionarios (nome, sobrenome, dataContrat, dataNasc, cargo) VALUES ('Marcos', 'Silva', '2020-10-10', '1990-10-10', 'Segurança');
INSERT INTO funcionarios (nome, sobrenome, dataContrat, dataNasc, cargo) VALUES ('Ricardo', 'Silva', '2020-10-10', '1990-10-10', 'Garçom');
INSERT INTO funcionarios (nome, sobrenome, dataContrat, dataNasc, cargo) VALUES ('Rogério', 'Silva', '2020-10-10', '1990-10-10', 'Garçom');
INSERT INTO funcionarios (nome, sobrenome, dataContrat, dataNasc, cargo) VALUES ('Rodrigo', 'Silva', '2020-10-10', '1990-10-10', 'Garçom');
INSERT INTO funcionarios (nome, sobrenome, dataContrat, dataNasc, cargo) VALUES ('Rafael', 'Silva', '2020-10-10', '1990-10-10', 'Garçom');
INSERT INTO funcionarios (nome, sobrenome, dataContrat, dataNasc, cargo) VALUES ('Renato', 'Silva', '2020-10-10', '1990-10-10', 'Garçom');
INSERT INTO funcionarios (nome, sobrenome, dataContrat, dataNasc, cargo) VALUES ('Renan', 'Silva', '2020-10-10', '1990-10-10', 'Garçom');
INSERT INTO funcionarios (nome, sobrenome, dataContrat, dataNasc, cargo) VALUES ('Ronaldo', 'Silva', '2020-10-10', '1990-10-10', 'Garçom');
INSERT INTO funcionarios (nome, sobrenome, dataContrat, dataNasc, cargo) VALUES ('Roberto', 'Silva', '2020-10-10', '1990-10-10', 'Garçom');
INSERT INTO funcionarios (nome, sobrenome, dataContrat, dataNasc, cargo) VALUES ('Robson', 'Silva', '2020-10-10', '1990-10-10', 'Garçom');
INSERT INTO funcionarios (nome, sobrenome, dataContrat, dataNasc, cargo) VALUES ('Roberval', 'Silva', '2020-10-10', '1990-10-10', 'Garçom');



-- -- registros tabela pedido (mesaId, funcionarioId garçom)
INSERT INTO pedido (mesaId, funcionarioId) VALUES (1, 19);
INSERT INTO pedido (mesaId, funcionarioId) VALUES (2, 19);
INSERT INTO pedido (mesaId, funcionarioId) VALUES (3, 20);
INSERT INTO pedido (mesaId, funcionarioId) VALUES (4, 20);
INSERT INTO pedido (mesaId, funcionarioId) VALUES (5, 19);
INSERT INTO pedido (mesaId, funcionarioId) VALUES (6, 18);
INSERT INTO pedido (mesaId, funcionarioId) VALUES (7, 10);
INSERT INTO pedido (mesaId, funcionarioId) VALUES (8, 11);
INSERT INTO pedido (mesaId, funcionarioId) VALUES (9, 12);
INSERT INTO pedido (mesaId, funcionarioId) VALUES (10, 13);


-- -- registros tabela item (nome, valorUnitario, dataCompra, dataValidade, quantidade, categoria)
-- bebidas
INSERT INTO item (nome, valorUnitario, dataCompra, dataValidade, quantidade, categoria) VALUES ('Cerveja', 10, '2020-10-10', '2021-10-10', 100, 'Bebida');
INSERT INTO item (nome, valorUnitario, dataCompra, dataValidade, quantidade, categoria) VALUES ('Refrigerante', 10, '2020-10-10', '2021-10-10', 100, 'Bebida');
INSERT INTO item (nome, valorUnitario, dataCompra, dataValidade, quantidade, categoria) VALUES ('Suco', 10, '2020-10-10', '2021-10-10', 100, 'Bebida');
INSERT INTO item (nome, valorUnitario, dataCompra, dataValidade, quantidade, categoria) VALUES ('Água', 10, '2020-10-10', '2021-10-10', 100, 'Bebida');
-- comidas
INSERT INTO item (nome, valorUnitario, dataCompra, dataValidade, quantidade, categoria) VALUES ('Hambúrguer', 10, '2020-10-10', '2021-10-10', 100, 'Comida');
INSERT INTO item (nome, valorUnitario, dataCompra, dataValidade, quantidade, categoria) VALUES ('Batata frita', 10, '2020-10-10', '2021-10-10', 100, 'Comida');
INSERT INTO item (nome, valorUnitario, dataCompra, dataValidade, quantidade, categoria) VALUES ('Pizza', 10, '2020-10-10', '2021-10-10', 100, 'Comida');
INSERT INTO item (nome, valorUnitario, dataCompra, dataValidade, quantidade, categoria) VALUES ('Pastel', 10, '2020-10-10', '2021-10-10', 100, 'Comida');
INSERT INTO item (nome, valorUnitario, dataCompra, dataValidade, quantidade, categoria) VALUES ('Coxinha', 10, '2020-10-10', '2021-10-10', 100, 'Comida');
INSERT INTO item (nome, valorUnitario, dataCompra, dataValidade, quantidade, categoria) VALUES ('Arroz', 10, '2020-10-10', '2021-10-10', 100, 'Comida');
INSERT INTO item (nome, valorUnitario, dataCompra, dataValidade, quantidade, categoria) VALUES ('Feijão', 10, '2020-10-10', '2021-10-10', 100, 'Comida');
INSERT INTO item (nome, valorUnitario, dataCompra, dataValidade, quantidade, categoria) VALUES ('Macarrão', 10, '2020-10-10', '2021-10-10', 100, 'Comida');

-- -- registros tabela itemPedido (pedidoId, itemId, qtdItem, ValorTotal)
-- pedido 1
INSERT INTO itemPedido (pedidoId, itemId, qtdItem, ValorTotal) VALUES (1, 1, 1, 10);
INSERT INTO itemPedido (pedidoId, itemId, qtdItem, ValorTotal) VALUES (1, 2, 1, 10);
INSERT INTO itemPedido (pedidoId, itemId, qtdItem, ValorTotal) VALUES (1, 3, 1, 10);
INSERT INTO itemPedido (pedidoId, itemId, qtdItem, ValorTotal) VALUES (1, 4, 1, 10);
INSERT INTO itemPedido (pedidoId, itemId, qtdItem, ValorTotal) VALUES (1, 5, 1, 10);
INSERT INTO itemPedido (pedidoId, itemId, qtdItem, ValorTotal) VALUES (1, 6, 1, 10);
-- pedido 2
INSERT INTO itemPedido (pedidoId, itemId, qtdItem, ValorTotal) VALUES (2, 1, 1, 10);
INSERT INTO itemPedido (pedidoId, itemId, qtdItem, ValorTotal) VALUES (2, 2, 1, 10);
INSERT INTO itemPedido (pedidoId, itemId, qtdItem, ValorTotal) VALUES (2, 3, 1, 10);
INSERT INTO itemPedido (pedidoId, itemId, qtdItem, ValorTotal) VALUES (2, 4, 1, 10);
INSERT INTO itemPedido (pedidoId, itemId, qtdItem, ValorTotal) VALUES (2, 5, 1, 10);
INSERT INTO itemPedido (pedidoId, itemId, qtdItem, ValorTotal) VALUES (2, 6, 1, 10);
-- pedido 3
INSERT INTO itemPedido (pedidoId, itemId, qtdItem, ValorTotal) VALUES (3, 1, 1, 10);
INSERT INTO itemPedido (pedidoId, itemId, qtdItem, ValorTotal) VALUES (3, 2, 1, 10);
-- pedido 4
INSERT INTO itemPedido (pedidoId, itemId, qtdItem, ValorTotal) VALUES (4, 5, 1, 10);
INSERT INTO itemPedido (pedidoId, itemId, qtdItem, ValorTotal) VALUES (4, 6, 1, 10);
INSERT INTO itemPedido (pedidoId, itemId, qtdItem, ValorTotal) VALUES (4, 7, 1, 10);
INSERT INTO itemPedido (pedidoId, itemId, qtdItem, ValorTotal) VALUES (4, 8, 1, 10);
-- pedido 5 (batata frita e cerveja)
INSERT INTO itemPedido (pedidoId, itemId, qtdItem, ValorTotal) VALUES (5, 2, 1, 10);
INSERT INTO itemPedido (pedidoId, itemId, qtdItem, ValorTotal) VALUES (5, 6, 1, 10);
-- pedido 6 (hambúrguer e cerveja)
INSERT INTO itemPedido (pedidoId, itemId, qtdItem, ValorTotal) VALUES (6, 1, 1, 10);
INSERT INTO itemPedido (pedidoId, itemId, qtdItem, ValorTotal) VALUES (6, 6, 1, 10);
-- pedido 7 (batata frita e cerveja)
INSERT INTO itemPedido (pedidoId, itemId, qtdItem, ValorTotal) VALUES (7, 2, 1, 10);
INSERT INTO itemPedido (pedidoId, itemId, qtdItem, ValorTotal) VALUES (7, 6, 1, 10);
-- pedido 8 (batata frita e cerveja)
INSERT INTO itemPedido (pedidoId, itemId, qtdItem, ValorTotal) VALUES (8, 2, 1, 10);
INSERT INTO itemPedido (pedidoId, itemId, qtdItem, ValorTotal) VALUES (8, 6, 1, 10);
-- pedido 9 (batata frita e cerveja)
INSERT INTO itemPedido (pedidoId, itemId, qtdItem, ValorTotal) VALUES (9, 2, 1, 10);
INSERT INTO itemPedido (pedidoId, itemId, qtdItem, ValorTotal) VALUES (9, 6, 1, 10);
-- pedido 10 (batata frita e cerveja)
INSERT INTO itemPedido (pedidoId, itemId, qtdItem, ValorTotal) VALUES (10, 2, 1, 10);
INSERT INTO itemPedido (pedidoId, itemId, qtdItem, ValorTotal) VALUES (10, 6, 1, 10);
-- pedido 11 (batata frita e cerveja)
INSERT INTO itemPedido (pedidoId, itemId, qtdItem, ValorTotal) VALUES (11, 2, 1, 10);
INSERT INTO itemPedido (pedidoId, itemId, qtdItem, ValorTotal) VALUES (11, 6, 1, 10);
-- pedido 12 (batata frita e cerveja)
INSERT INTO itemPedido (pedidoId, itemId, qtdItem, ValorTotal) VALUES (12, 2, 1, 10);


-- -- registros tabela comanda (formaPag, pedidoId, valorTotal, dataPag)
INSERT INTO comanda (formaPag, pedidoId, valorTotal, dataPag) VALUES ('Dinheiro', 1, 60, '2020-10-10');
INSERT INTO comanda (formaPag, pedidoId, valorTotal, dataPag) VALUES ('Dinheiro', 2, 60, '2020-10-10');
INSERT INTO comanda (formaPag, pedidoId, valorTotal, dataPag) VALUES ('Dinheiro', 3, 20, '2020-10-10');
INSERT INTO comanda (formaPag, pedidoId, valorTotal, dataPag) VALUES ('Dinheiro', 4, 40, '2020-10-10');
INSERT INTO comanda (formaPag, pedidoId, valorTotal, dataPag) VALUES ('Dinheiro', 5, 20, '2020-10-10');
INSERT INTO comanda (formaPag, pedidoId, valorTotal, dataPag) VALUES ('Dinheiro', 6, 20, '2020-10-10');
INSERT INTO comanda (formaPag, pedidoId, valorTotal, dataPag) VALUES ('Dinheiro', 7, 20, '2020-10-10');
INSERT INTO comanda (formaPag, pedidoId, valorTotal, dataPag) VALUES ('Dinheiro', 8, 20, '2020-10-10');
INSERT INTO comanda (formaPag, pedidoId, valorTotal, dataPag) VALUES ('Dinheiro', 9, 20, '2020-10-10');
INSERT INTO comanda (formaPag, pedidoId, valorTotal, dataPag) VALUES ('Dinheiro', 10, 20, '2020-10-10');
INSERT INTO comanda (formaPag, pedidoId, valorTotal, dataPag) VALUES ('Dinheiro', 11, 20, '2020-10-10');
INSERT INTO comanda (formaPag, pedidoId, valorTotal, dataPag) VALUES ('Dinheiro', 12, 20, '2020-10-10');


