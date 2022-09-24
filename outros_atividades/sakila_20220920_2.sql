USE sakila;

-- EXPLAIN 
SELECT
    customer.first_name,
    customer.last_name,
    customer.email
FROM customer
WHERE customer.first_name LIKE "%a";