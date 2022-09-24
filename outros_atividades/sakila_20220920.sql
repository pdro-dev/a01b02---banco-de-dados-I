USE sakila;

EXPLAIN SELECT
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