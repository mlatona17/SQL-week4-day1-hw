-- Hello World SQL Query
SELECT *
FROM actor;

--Query for first and last name in actor table
select first_name, last_name
from actor;

-- query for first name that equals Nick
select first_name, last_name
from actor
where first_name = 'Nick';

--Query for a first_name that equals Nick using the LIKE clause
select first_name, last_name
from actor
where first_name like 'Nick';

--Query for first_name that starts with J using LIKE and WHERE with wildcard
SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'J%';

--Query for first_name that starts with K using LIKE and WHERE
SELECT first_name, last_name
FROM Actor
WHERE first_name LIKE 'K__';

-- Query to combine both wildcard and characther lengths
SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'K__%th';

-- SELECT payment amounts using greater than statement
SELECT customer_id, amount
FROM payment
WHERE amount > '2.00';

--SELECT payment amounts using less than statement
SELECT customer_id, amount
FROM payment
WHERE amount < 7.99;

-- SELECT payment amounts less than or equal to 7.99 ORDER BY in Ascending Order
SELECT customer_id, amount
FROM payment
WHERE amount <= 7.99
ORDER BY amount ASC;

-- SELECT payment amounts NOT EQUAL to 0.00
SELECT customer_id, amount
FROM payment
WHERE amount <> 0.00
ORDER BY amount DESC;

-- SQL Aggregations => SUM(), AVG(), COUNT(), MIN(), MAX()

-- Query to display the sum of the amounts paid that are greater than 5.99
SELECT SUM (amount)
FROM payment
WHERE amount > 5.99;

--Query to display count of amounts paid that are greater than 5.99
SELECT COUNT(amount)
FROM payment
WHERE amount > 5.99;

--Query to display the avg of amounts paid that are greaqter than 5.99
SELECT AVG(amount)
FROM payment
WHERE amount > 5.99;

--Query to display max amount greater than 7.99
SELECT MAX(amount)
FROM payment
WHERE amount >7.99;

-- Query to display min amount greater than 7.99 and rename
SELECT MIN(amount) as min_num_payments
FROM payment
WHERE amount > 7.99;

-- Quert to display customer_ids with the summed amounts for each customer
SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
ORDER BY customer_id;

-- SELECT statement with WHERE clause including a range BETWEEN 7.99 and 10.99
SELECT customer_id, amount
FROM payment
WHERE amount BETWEEN 7.99 AND 10.99
ORDER BY amount DESC;

-- SELECT statement to return customer_ids that show up more than 5x
SELECT COUNT(customer_id), email
FROM customer
WHERE email LIKE 'j__.w%'
GROUP BY email
HAVING COUNT(customer_id) > 5;


-------------------------------------------------------------------



--Question 1: How many actors are there with the last name ‘Wahlberg’?

SELECT COUNT(last_name)
FROM actor
WHERE last_name = 'Wahlberg';

--Question 2: How many payments were made between $3.99 and $5.99?

SELECT COUNT(amount)
FROM payment
WHERE amount BETWEEN 3.99 AND 5.99;

--Question 3: What film does the store have the most of? (search in inventory)

SELECT film_id, COUNT(film_id) AS film_count
FROM inventory
GROUP BY film_id
ORDER BY film_count DESC;

--Question 4: How many customers have the last name ‘Williams’?

SELECT COUNT(last_name)
FROM customer
WHERE last_name = 'Williams';

--Question 5: What store employee (get the id) sold the most rentals?

SELECT staff_id, COUNT(rental_id) AS rental_count
FROM payment
GROUP BY staff_id
ORDER BY rental_count DESC;

--Question 6: How many different district names are there?

SELECT COUNT(DISTINCT district)
FROM address;

--Question 7: What film has the most actors in it? (use film_actor table and get film_id)

SELECT film_id, COUNT(actor_id) AS actor_count
FROM film_actor
GROUP BY film_id
ORDER BY actor_count DESC;

--Question 8: From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)

SELECT store_id, COUNT(last_name) AS es_count
FROM customer
WHERE last_name LIKE '__%es' AND store_id = 1
GROUP BY store_id
ORDER BY es_count;

--***Question 9: How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers with ids between 380 and 430? (use group by and having > 250)

SELECT amount, customer_id, COUNT(rental_id) AS rental_count
FROM payment
WHERE customer_id BETWEEN 380 AND 430
GROUP BY amount, customer_id
HAVING COUNT(rental_id)>250;


--Question 10: Within the film table, how many rating categories are there? And what rating has the most movies total?

SELECT COUNT(DISTINCT rating) AS rating_cat_count
FROM film;

SELECT rating, COUNT(title) AS title_count
FROM film
GROUP BY rating
ORDER BY title_count DESC;