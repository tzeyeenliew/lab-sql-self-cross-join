USE sakila;

### Instructions
### 1. Get all pairs of actors that worked together.

###SELECT a1.actor_id, a1.film_id, c1.first_name, c1.last_name, a2.actor_id, c2.first_name,c2.last_name, a2.film_id

SELECT film_id, f1.actor_id actor1, a1.first_name, a1.last_name, f2.actor_id actor2, a2.first_name, a2.last_name
FROM film_actor f1
JOIN actor a1
ON f1.actor_id = a1.actor_id
JOIN film_actor f2
USING (film_id)
JOIN actor a2
ON f2.actor_id = a2.actor_id
WHERE f1.actor_id != f2.actor_id;


### 2. Get all pairs of customers that have rented the same film more than 3 times.

### CREDITS TO JORDI FOR THE LOVELY, ELEGANT CODE! 

SELECT c.film_id, a.customer_id AS customer_1, b.customer_id AS customer_2, count(*) AS num_rentals
FROM rental AS A
JOIN rental AS B
ON a.inventory_id=b.inventory_id 
AND a.customer_id < b.customer_id
JOIN inventory AS C
ON b.inventory_id = c.inventory_id
GROUP BY c.film_id, a.customer_id, b.customer_id
HAVING COUNT(*) >= 2;


### 3. Get all possible pairs of actors and films.

SELECT actor.actor_id, film.film_id
FROM actor
CROSS JOIN film;

