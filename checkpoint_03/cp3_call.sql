/* Calls para a tabela comanda */

CALL dadosComanda ('Dinheiro', 2, 60, '2020-10-10'); 
CALL dadosComanda ('Cartao', 3, 100, '2020-10-10'); 
CALL dadosComanda ('Pix', 4, 80, '2020-10-10'); 
CALL dadosComanda ('Vale Refeicao', 5, 50, '2020-10-10'); 
CALL dadosComanda ('Vale Alimentacao', 6, 30, '2020-10-10'); 
CALL dadosComanda ('Dinheiro', 7, 20, '2020-10-10'); 
CALL dadosComanda ('Dinheiro', 8, 40, '2020-10-10'); 
CALL dadosComanda ('Dinheiro', 9, 90, '2020-10-10'); 
CALL dadosComanda ('Dinheiro', 10, 20, '2020-10-10'); 

/* Calls para a tabela mesa */

CALL dadosMesa('Balcão', 1,3);
CALL dadosMesa('Mesa', 3,4);
CALL dadosMesa('Mesa', 5,5);
CALL dadosMesa('Balcão', 7,6);
CALL dadosMesa('Balcão', 5,7);
CALL dadosMesa('Balcão', 6,8);
CALL dadosMesa('Balcão', 2,9);
CALL dadosMesa('Mesa', 5,10);

/* Calls para a tabela reserva */

CALL dadosReserva(250.00, '2022-08-30 09:00:00');
CALL dadosReserva(350.00, '2018-09-28 08:00:00');
CALL dadosReserva(500.00, '2016-09-15 08:00:00');
CALL dadosReserva(600.00, '2019-03-03 08:00:00');
CALL dadosReserva(450.00, '2022-04-20 08:00:00');
CALL dadosReserva(300.00, '2016-09-15 08:00:00');
CALL dadosReserva(950.00, '2016-09-15 08:00:00');
CALL dadosReserva(750.00, '2016-09-15 08:00:00');
CALL dadosReserva(800.00, '2016-09-15 08:00:00');
CALL dadosReserva(850.00, '2016-09-15 08:00:00');

/* Calls para a tabela reservaMesa  */

CALL dadosReservaMesa(3,1);
CALL dadosReservaMesa(5,2);
CALL dadosReservaMesa(6,3);
CALL dadosReservaMesa(7,4);
CALL dadosReservaMesa(8,5);
CALL dadosReservaMesa(9,6);
CALL dadosReservaMesa(10,7);
CALL dadosReservaMesa(11,8);
CALL dadosReservaMesa(12,9);