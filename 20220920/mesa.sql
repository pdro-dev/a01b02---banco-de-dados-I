/*

Índices

1.	Exiba os todos os índices da tabela cliente.

2.	Exiba o nome, sobrenome, email, o id da locação, o valor e a data de todos os pagamentos feitos pela cliente Elizabeth BROWN.  Dica: Utilize pelo menos uma coluna indexada na consulta.

3.	Exiba o nome, sobrenome, email, o id da locação, o valor e a data do último pagamento feito pelo cliente Ryan SALISBURY.

4.	Execute o Explain na consulta acima e observe o comportamento da consulta. Qual índice foi mais performático?

5.	Liste nome, sobrenome e email de todos os clientes cujo nome termina com a letra ‘a’:

6.	Execute o Explain na consulta acima e responda: Quantas linhas foram percorridas para retornar o resultado e qual a porcentagem do filtro utilizado?


*/



-- 1. Exiba os todos os índices da tabela cliente.

SHOW INDEX FROM customer;

-- 2. Exiba o nome, sobrenome, email, o id da locação, o valor e a data de todos os pagamentos feitos pela cliente Elizabeth BROWN. Dica: Utilize pelo menos uma coluna indexada na consulta.
 
CREATE INDEX clientes_indice
ON customer(email);

SELECT
	customer.first_name,
    customer.last_name,
    customer.email,
    rental.rental_id,
    payment.amount,
    payment.payment_date
FROM 
	customer
INNER JOIN rental
ON customer.customer_id = rental.customer_id
INNER JOIN payment
ON payment.rental_id = rental.rental_id
WHERE 
	customer.first_name = "Elizabeth" AND customer.last_name = "Brown"
ORDER BY payment_date DESC;

-- 3. Exiba o nome, sobrenome, email, o id da locação, o valor e a data do último pagamento feito pelo cliente Ryan SALISBURY.

SELECT
    customer.first_name,
    customer.last_name,
    customer.email,
    rental.rental_id,
    payment.amount,
    payment.payment_date
FROM customer
INNER JOIN rental
ON customer.customer_id = rental.customer_id
INNER JOIN payment
ON payment.rental_id = rental.rental_id
WHERE 
    customer.first_name = "Ryan" AND customer.last_name = "Salisbury"
ORDER BY payment_date DESC

-- 4. Execute o Explain na consulta acima e observe o comportamento da consulta. Qual índice foi mais performático?


CREATE INDEX clientes_indice_email ON customer(email);
SELECT
    customer.first_name,
    customer.last_name,
    customer.email,
    rental.rental_id,
    payment.amount,
    payment.payment_date
FROM customer
INNER JOIN rental
ON customer.customer_id = rental.customer_id
INNER JOIN payment
ON payment.rental_id = rental.rental_id
WHERE 
    customer.first_name = "Ryan" AND customer.last_name = "Salisbury"
ORDER BY payment_date DESC;


-- 5. Liste nome, sobrenome e email de todos os clientes cujo nome termina com a letra ‘a’:

SELECT
    customer.first_name,
    customer.last_name,
    customer.email
FROM customer
WHERE customer.first_name LIKE "%a";



-- 6. Execute o Explain na consulta acima e responda: Quantas linhas foram percorridas para retornar o resultado e qual a porcentagem do filtro utilizado?

EXPLAIN SELECT
    customer.first_name,
    customer.last_name,
    customer.email
FROM customer
WHERE customer.first_name LIKE "%a";
