-- 1. List all customers who live in Texas (use JOINs)
SELECT first_name, last_name, district
FROM customer
JOIN address
ON customer.address_id = address.address_id
WHERE district = 'Texas';
-- Answer: 5 customers - Jennifer Davis, Kim Cruz, Richard Mccrary, Bryan Hardison, Ian Still

--2. Get all payments above $6.99 with the Customer's Full Name
SELECT first_name, last_name, amount
FROM customer
JOIN payment
ON customer.customer_id = payment.customer_id
WHERE amount > 6.99
ORDER BY amount ASC;
-- Answer: 3661 customers

--3. Show all customers names who have made payments over $175(use subqueries)
SELECT first_name, last_name
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    GROUP BY customer_id
    HAVING SUM(amount) > 175
);
-- Answer: 135 customers

--4. List all customers that live in Nepal (use the city table)
SELECT first_name, last_name
FROM customer
WHERE address_id IN(
    SELECT customer.address_id
    FROM customer 
    INNER JOIN address 
    ON customer.address_id = address.address_id 
    INNER JOIN city
    ON address.city_id = city.city_id
    INNER JOIN country
    ON city.country_id = country.country_id
    WHERE country = 'Nepal'
);
-- Answer: Kevin Schuler

--5. Which staff member had the most transactions?
SELECT first_name, last_name, COUNT(payment_id) AS transactions
FROM staff
JOIN payment
ON staff.staff_id = payment.staff_id
GROUP BY first_name, last_name;
-- Answer: Jon Stephens

--6. How many movies of each rating are there?
SELECT DISTINCT rating, COUNT(film_id)
FROM film
GROUP BY rating;
-- G: 178, PG: 194, PG-13: 223, R: 196, NC-17:209

--7. Show all customers who have made a single payment above $6.99 (Use Subqueries)
SELECT first_name, last_name
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    WHERE amount > 6.99
);
-- 597 customers have made a single payment above 6.99

--8. How many free rentals did our store give away?
SELECT amount
FROM payment
ORDER BY amount ASC;
-- None - there are no amounts that are NULL or $0.00


