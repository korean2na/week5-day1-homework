--1. How many actors are there with the last name ‘Wahlberg’?
SELECT count(last_name)
FROM actor
WHERE last_name = 'Wahlberg';

--2. How many payments were made between $3.99 and $5.99?
SELECT count(amount)
FROM payment
WHERE amount BETWEEN 3.99 AND 5.99;

--3. What film does the store have the most of? (search in inventory)
-- most in store 1 inventory
SELECT film_id, store_id, count(film_id) AS movie_count
FROM inventory
WHERE store_id = 1
GROUP BY film_id, store_id
ORDER BY movie_count DESC, film_id ASC;
-- most in store 2 inventory
SELECT film_id, store_id, count(film_id) AS movie_count
FROM inventory
WHERE store_id = 2
GROUP BY film_id, store_id
ORDER BY movie_count DESC, film_id ASC;
-- most in both stores 1 and 2 inventories
SELECT film_id, store_id, count(film_id) AS movie_count
FROM inventory
GROUP BY film_id, store_id
ORDER BY movie_count DESC, film_id ASC, store_id ASC;
-- could technically do limit 1 but that would exclude ties
-- tried a few methods found online to get max of a count but none worked, WIP

--4. How many customers have the last name ‘William’?
SELECT count(last_name)
FROM customer
WHERE last_name = 'William';

--5. What store employee (get the id) sold the most rentals?
SELECT staff_id, count(staff_id) AS rental_sold
FROM rental
GROUP BY staff_id
ORDER BY rental_sold DESC
-- could technically do limit 1 but that would exclude ties
-- tried a few methods found online to get max of a count but none worked, WIP

--6. How many different district names are there?
SELECT count(DISTINCT district)
FROM address;

--7. What film has the most actors in it? (use film_actor table and get film_id)
SELECT film_id, count(actor_id) AS actor_count
FROM film_actor
GROUP BY film_id
ORDER BY actor_count DESC, film_id ASC;
-- could technically do limit 1 but that would exclude ties
-- tried a few methods found online to get max of a count but none worked, WIP

--8. From store_id 1, how many customers have a last name ending with ‘es’?
--(use customer table)
SELECT count(last_name)
FROM customer
WHERE store_id = 1 AND last_name like '%es'

--9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for 
--customers with ids between 380 and 430? (use group by and having > 250)
SELECT amount, count(amount)
FROM payment
WHERE customer_id BETWEEN 380 AND 430
GROUP BY amount
HAVING count(amount) > 250
ORDER BY amount asc;
-- need to figure out getting a count of a count

--10. Within the film table, how many rating categories are there? And what rating has
--the most movies total?
SELECT rating, count(rating) AS movie_count
FROM film
GROUP BY rating
ORDER BY movie_count DESC;
-- could technically do limit 1 but that would exclude ties
-- tried a few methods found online to get max of a count but none worked, WIP