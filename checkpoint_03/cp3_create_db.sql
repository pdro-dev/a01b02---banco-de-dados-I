CREATE DATABASE IF NOT EXISTS checkpoint_3;
USE checkpoint_3;

CREATE TABLE IF NOT EXISTS mesa (
	mesaId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    mesaTipo VARCHAR(20) NOT NULL,
    qtdLugares TINYINT NOT NULL
);

CREATE TABLE IF NOT EXISTS reserva (
	reservaId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    valorReserva FLOAT NOT NULL,
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
    valorUnitario FLOAT NOT NULL,
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
    valorTotal FLOAT NOT NULL,
	CONSTRAINT cnt_pedido_itemPedido FOREIGN KEY (pedidoId) REFERENCES pedido(pedidoId),
    CONSTRAINT cnt_item_itemPedido FOREIGN KEY (itemId) REFERENCES item(itemId)
);

CREATE TABLE IF NOT EXISTS comanda (
	comandaId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    formaPag VARCHAR(20) NOT NULL,
    pedidoId INT NOT NULL,
    valorTotal FLOAT NOT NULL,
    dataPag DATETIME,
    CONSTRAINT cnt_comanda_pedido FOREIGN KEY (pedidoId) REFERENCES pedido(pedidoId)
);

