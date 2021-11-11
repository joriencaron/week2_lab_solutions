USE sakila;
-- 1. Store_ID 1 is in Lethbridge Canada and Store_ID 2 is in Woodridge Australia
SELECT s.store_id, c.city, co.country
FROM sakila.store s
JOIN sakila.address a
ON s.address_id = a.address_id
JOIN sakila.city c
ON a.city_id = c.city_id
JOIN sakila.country co
ON c.country_id = co.country_id;

-- 2. Store_ID 1 brought in 33489,47 dollars and Store_ID 2 brought in 33927,04 dollars
SELECT s.store_id, SUM(p.amount) as 'sales'
FROM sakila.staff s
JOIN sakila.payment p
ON s.staff_id = p.staff_id
GROUP BY s.store_id;

-- 3. Films in the Sports category are the longest with an average duration of 128,2027 minutes
SELECT c.name, AVG(f.length) as 'avg_duration'
FROM sakila.film f
JOIN sakila.film_category fc
ON f.film_id = fc.film_id
JOIN sakila.category c
ON fc.category_id = c.category_id
GROUP BY c.name
ORDER BY avg_duration DESC;

-- 4. Bucket Brotherhood is the most rented movie with 34 times
SELECT f.title, COUNT(r.rental_ID) as 'times_rented'
FROM sakila.film f
JOIN sakila.inventory i USING(film_id)
JOIN sakila.rental r USING(inventory_id)
GROUP BY f.title
ORDER BY COUNT(r.rental_ID) DESC;

-- 5. The top 5 genres in gross revenue are 1# Sports, 2#Sci-Fi, 3# Animation 4# Drama, 5# Comedy
SELECT c.name, SUM(amount) as 'gross_revenue'
FROM sakila.category c
JOIN sakila.film_category fc USING(category_id)
JOIN sakila.inventory i 
ON i.film_id = fc.film_id
JOIN sakila.rental r
ON i.inventory_id = r.inventory_id
JOIN sakila.payment p
ON r.rental_id = p.rental_id
GROUP BY c.name
ORDER BY gross_revenue DESC;

-- 6. Yes, store 1 has 4 copies of Academy Dinosaur
SELECT i.store_id, f.title, i.inventory_id
FROM sakila.film f
JOIN sakila.inventory i USING(film_id)
WHERE f.title = 'Academy Dinosaur' and i.store_id = 1;

-- 7. 10 actors worked on Academy Dinosaur, 4 actors worked on Ace Goldfinger and so on
SELECT fa.film_id, f.title, a.first_name, a.last_name
FROM sakila.actor a
RIGHT JOIN sakila.film_actor fa USING(actor_id)
JOIN sakila.film f USING(film_id);

-- 7. JAN'S SOLUTIONS
SELECT first_actor_id, first_actor_first_name;

SELECT f1.film_id, f1.actor_id AS firstactor, a.first_name AS firstactor_firstname, a.last_name AS firstactor_lastname, f2.actor_id AS secondactor 
from (
SELECT , f1.actor_id AS secondtactor, a.first_name AS secondactor_firstname, a.last_name AS secondactor_lastname, f2.actor_id AS secondactor
FROM film_actor f1
JOIN film_actor f2
ON (f1.actor_id <> f2.actor_id) AND f1.film_id = f2.film_id
JOIN actor a1
ON f1.actor_id = a.actor_id) j1
JOIN actor a2
ON j1.secondactor = a2.actor_id;

-- 8. Eleanor Hunt has rented the same movie 46 times
SELECT c.first_name, c.last_name, COUNT(DISTINCT(r.rental_id))
FROM sakila.customer c
JOIN sakila.rental r USING (customer_id)
GROUP BY c.first_name, c.last_name
HAVING COUNT(r.rental_id) > 3
ORDER BY COUNT(DISTINCT(r.rental_id)) DESC;

-- 9. this one is not really working yet
SELECT f.title, CONCAT(a.first_name,' ',a.last_name), COUNT(fa.film_id)
FROM film f
JOIN film_actor fa USING(film_id)
JOIN actor a USING(actor_id)
GROUP BY f.title, CONCAT(a.first_name,' ',a.last_name);










