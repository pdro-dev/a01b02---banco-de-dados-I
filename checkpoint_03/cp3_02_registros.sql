USE checkpoint_3;

-- -- inserir 10 registros em cada tabela
-- -- registros tabela mesa
INSERT INTO mesa (mesaTipo, qtdLugares) 
VALUES 
    ('Balcão', 1),
    ('Mesa de 2 lugares', 2),
    ('Mesa de 4 lugares', 4),
    ('Mesa de 6 lugares', 6),
    ('Mesa de 8 lugares', 8),
    ('Mesa de 10 lugares', 10),
    ('Mesa de 12 lugares', 12),
    ('Mesa de 14 lugares', 14),
    ('Mesa de 16 lugares', 16),
    ('Mesa de 18 lugares', 18)
 ;


-- -- registros tabela reserva
INSERT INTO reserva (valorReserva, dataReserva) 
VALUES 
    (100.00, '2020-10-10 10:00:00'),
    (200.00, '2020-10-10 10:00:00'),
    (300.00, '2020-10-10 10:00:00'),
    (400.00, '2020-10-10 10:00:00'),
    (500.00, '2020-10-10 10:00:00'),
    (600.00, '2020-10-10 10:00:00'),
    (700.00, '2020-10-10 10:00:00'),
    (800.00, '2020-10-10 10:00:00'),
    (900.00, '2020-10-10 10:00:00'),
    (1000.00, '2020-10-10 10:00:00')
;

-- -- registros tabela reservaMesa
INSERT INTO reservaMesa (mesaId, reservaId) 
VALUES 
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 10)
;

-- -- registros tabela funcionarios (gerente, maître, garçom 10x, commins, chef, cozinheiro, auxiliar_de_cozinha, barman, auxiliar_de_limpeza, segurança)
INSERT INTO funcionarios (nome, sobrenome, dataContrat, dataNasc, cargo) 
VALUES 
    ('João', 'Silva', '2020-10-10', '1990-10-10', 'Gerente'),
    ('Maria', 'Silva', '2020-10-10', '1990-10-10', 'Maître'),
    ('José', 'Silva', '2020-10-10', '1990-10-10', 'Commins'),
    ('Antonio', 'Silva', '2020-10-10', '1990-10-10', 'Chef'),
    ('Pedro', 'Silva', '2020-10-10', '1990-10-10', 'Cozinheiro'),
    ('Paulo', 'Silva', '2020-10-10', '1990-10-10', 'Auxiliar de cozinha'),
    ('Carlos', 'Silva', '2020-10-10', '1990-10-10', 'Barman'),
    ('Rafael', 'Silva', '2020-10-10', '1990-10-10', 'Auxiliar de limpeza'),
    ('Marcos', 'Silva', '2020-10-10', '1990-10-10', 'Segurança'),
    ('Ricardo', 'Silva', '2020-10-10', '1990-10-10', 'Garçom'),
    ('Rogério', 'Silva', '2020-10-10', '1990-10-10', 'Garçom'),
    ('Rodrigo', 'Silva', '2020-10-10', '1990-10-10', 'Garçom'),
    ('Rafael', 'Silva', '2020-10-10', '1990-10-10', 'Garçom'),
    ('Renato', 'Silva', '2020-10-10', '1990-10-10', 'Garçom'),
    ('Renan', 'Silva', '2020-10-10', '1990-10-10', 'Garçom'),
    ('Ronaldo', 'Silva', '2020-10-10', '1990-10-10', 'Garçom'),
    ('Roberto', 'Silva', '2020-10-10', '1990-10-10', 'Garçom'),
    ('Robson', 'Silva', '2020-10-10', '1990-10-10', 'Garçom'),
    ('Roberval', 'Silva', '2020-10-10', '1990-10-10', 'Garçom'),
    ('Robério', 'Silva', '2020-10-10', '1990-10-10', 'Garçom')
;


-- -- registros tabela enderecoFuncionarios
-- enderecoFuncionarioId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
-- funcionarioId INT NOT NULL,
-- rua VARCHAR(50) NOT NULL,
-- numero INT NOT NULL,
-- bairro VARCHAR(50) NOT NULL,
-- cidade VARCHAR(50) NOT NULL,
-- estado VARCHAR(2) NOT NULL,
-- cep VARCHAR(8) NOT NULL,
INSERT INTO enderecoFuncionario (funcionarioId, rua, numero, bairro, cidade, estado, cep) 
VALUES 
    (1, 'Rua 1', 1, 'Bairro 1', 'Cidade 1', 'SP', '12345678'),
    (2, 'Rua 2', 2, 'Bairro 2', 'Cidade 2', 'UF', '87654321'),
    (3, 'Rua 3', 3, 'Bairro 3', 'Cidade 3', 'UF', '12345678'),
    (4, 'Rua 4', 4, 'Bairro 4', 'Cidade 4', 'UF', '87654321'),
    (5, 'Rua 5', 5, 'Bairro 5', 'Cidade 5', 'UF', '12345678'),
    (6, 'Rua 6', 6, 'Bairro 6', 'Cidade 6', 'UF', '87654321'),
    (7, 'Rua 7', 7, 'Bairro 7', 'Cidade 7', 'UF', '12345678'),
    (8, 'Rua 8', 8, 'Bairro 8', 'Cidade 8', 'UF', '87654321'),
    (9, 'Rua 9', 9, 'Bairro 9', 'Cidade 9', 'UF', '12345678'),
    (10, 'Rua 10', 10, 'Bairro 10', 'Cidade 10', 'UF', '87654321'),
    (11, 'Rua 11', 11, 'Bairro 11', 'Cidade 11', 'UF', '12345678'),
    (12, 'Rua 12', 12, 'Bairro 12', 'Cidade 12', 'UF', '87654321'),
    (13, 'Rua 13', 13, 'Bairro 13', 'Cidade 13', 'UF', '12345678'),
    (14, 'Rua 14', 14, 'Bairro 14', 'Cidade 14', 'UF', '87654321'),
    (15, 'Rua 15', 15, 'Bairro 15', 'Cidade 15', 'UF', '12345678'),
    (16, 'Rua 16', 16, 'Bairro 16', 'Cidade 16', 'UF', '87654321'),
    (17, 'Rua 17', 17, 'Bairro 17', 'Cidade 17', 'UF', '12345678'),
    (18, 'Rua 18', 18, 'Bairro 18', 'Cidade 18', 'UF', '87654321'),
    (19, 'Rua 19', 19, 'Bairro 19', 'Cidade 19', 'UF', '12345678'),
    (20, 'Rua 20', 20, 'Bairro 20', 'Cidade 20', 'UF', '87654321')
;


-- -- registros tabela pedido (mesaId, funcionarioId garçom)
INSERT INTO pedido (mesaId, funcionarioId) 
VALUES 
    (1, 19),
    (2, 19),
    (3, 20),
    (4, 20),
    (5, 19),
    (6, 18),
    (7, 10),
    (8, 11),
    (9, 12),
    (10, 13),
    (1, 14),
    (2, 15)
;


-- -- registros tabela item (nome, valorUnitario, dataCompra, dataValidade, quantidade, categoria)
INSERT INTO item (nome, valorUnitario, dataCompra, dataValidade, quantidade, categoria) 
VALUES 
    ('Cerveja', 10, '2020-10-10', '2021-10-10', 100, 'Bebida'),
    ('Refrigerante', 10, '2020-10-10', '2021-10-10', 100, 'Bebida'),
    ('Suco', 10, '2020-10-10', '2021-10-10', 100, 'Bebida'),
    ('Água', 10, '2020-10-10', '2021-10-10', 100, 'Bebida'),
    ('Hambúrguer', 10, '2020-10-10', '2021-10-10', 100, 'Comida'),
    ('Batata frita', 10, '2020-10-10', '2021-10-10', 100, 'Comida'),
    ('Pizza', 10, '2020-10-10', '2021-10-10', 100, 'Comida'),
    ('Pastel', 10, '2020-10-10', '2021-10-10', 100, 'Comida'),
    ('Coxinha', 10, '2020-10-10', '2021-10-10', 100, 'Comida'),
    ('Arroz', 10, '2020-10-10', '2021-10-10', 100, 'Comida'),
    ('Feijão', 10, '2020-10-10', '2021-10-10', 100, 'Comida'),
    ('Macarrão', 10, '2020-10-10', '2021-10-10', 100, 'Comida')
;

-- -- registros tabela itemPedido (pedidoId, itemId, qtdItem, ValorTotal)
-- pedido 1
INSERT INTO itemPedido (pedidoId, itemId, qtdItem, ValorTotal) 
VALUES 
    (1, 1, 1, 10),
    (1, 2, 1, 10),
    (1, 3, 1, 10),
    (1, 4, 1, 10),
    (1, 5, 1, 10),
    (1, 6, 1, 10),
-- pedido 2
    (2, 1, 1, 10),
    (2, 2, 1, 10),
    (2, 3, 1, 10),
    (2, 4, 1, 10),
    (2, 5, 1, 10),
    (2, 6, 1, 10),
-- pedido 3 (macarrão e refrigerante)
    (3, 3, 1, 10),
    (3, 7, 1, 10),
-- pedido 4
    (4, 5, 1, 10),
    (4, 6, 1, 10),
    (4, 7, 1, 10),
    (4, 8, 1, 10),
-- pedido 5 (batata frita e cerveja)
    (5, 2, 1, 10),
    (5, 6, 1, 10),
-- pedido 6 (hambúrguer e cerveja)
    (6, 1, 1, 10),
    (6, 6, 1, 10),
-- pedido 7 (batata frita e cerveja)
    (7, 2, 1, 10),
    (7, 6, 1, 10),
-- pedido 8 (batata frita e cerveja)
    (8, 2, 1, 10),
    (8, 6, 1, 10),
-- pedido 9 (batata frita e cerveja)
    (9, 2, 1, 10),
    (9, 6, 1, 10),
-- pedido 10 (batata frita e cerveja)
    (10, 2, 1, 10),
    (10, 6, 1, 10),
-- pedido 11 (batata frita e cerveja)
    (11, 2, 1, 10),
    (11, 6, 1, 10),
-- pedido 12 (batata frita e cerveja)
    (12, 2, 1, 10),
    (12, 6, 1, 10)
;


-- -- -- registros tabela comanda (formaPag, pedidoId, valorTotal, dataPag)
INSERT INTO comanda (formaPag, valorTotal, dataPag, mesaId) 
VALUES 
    ('Dinheiro', 60, '2020-10-10', 1),
    ('Dinheiro', 60, '2020-10-10', 2),
    ('Dinheiro', 20, '2020-10-10', 3),
    ('Dinheiro', 40, '2020-10-10', 4),
    ('Dinheiro', 20, '2020-10-10', 5),
    ('Dinheiro', 20, '2020-10-10', 6),
    ('Dinheiro', 20, '2020-10-10', 7),
    ('Dinheiro', 20, '2020-10-10', 8),
    ('Dinheiro', 20, '2020-10-10', 9),
    ('Dinheiro', 20, '2020-10-10', 10)
;
