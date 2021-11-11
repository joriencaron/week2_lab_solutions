USE sakila;
SELECT * from actor;

-- 1. 66 last names are not repeated
SELECT last_name
FROM actor
GROUP BY last_name
HAVING COUNT(last_name) = 1;

-- 2. 55 last names are repeated
SELECT last_name
FROM actor
GROUP BY last_name
HAVING COUNT(last_name) > 1;

-- 3. Staff_ID 1 has rented 8040 movies and Staff_ID 2 has rented 8004 movies
SELECT COUNT(rental_id), staff_id
FROM rental
GROUP BY staff_id;

-- 4. There were 1000 movies released in the year 2006
SELECT COUNT(film_id), release_year
FROM film
GROUP BY release_year;

-- 5. Ratings are as followed: PG: 194, G:178, NC-17:210, PG-13:223, R:195
SELECT COUNT(film_id), rating
FROM film
GROUP BY rating;

-- 6. AVG filmlength is as followed: PG:112.01, G:111.05, NC-17:113.23, PG-13:120.44, R:118.66
SELECT rating, ROUND(AVG(length),2) as 'average length'
FROM film
GROUP BY rating;

-- 7. The PG-13 movies have a mean duration of more than 2 hours
SELECT rating, ROUND(AVG(length),2) as 'average_length'
FROM film
GROUP BY rating
HAVING ROUND(AVG(length),2) >120;

-- 8. On ranking #1 there are movies with 185 minutes, #2 movies with 184 minutes and so on.
SELECT title, length, DENSE_RANK() OVER(ORDER BY length DESC) as 'Rank'
FROM film
WHERE length != 0 AND length IS NOT NULL;

