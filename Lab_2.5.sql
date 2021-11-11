USE sakila;
SELECT * FROM actor
WHERE first_name = 'Scarlett';
-- 1. There are two actors with the first name Scarlett
SELECT COUNT(*) FROM rental;
SELECT COUNT(*) FROM film;
-- 2. There are 1000 films for rent and 16044 movies have been rented
SELECT MAX(length) AS 'max_duration', MIN(length) AS 'min_duration'
FROM film;
-- 3. max_duration is 185 and min_duration 46
SELECT SEC_TO_TIME(AVG(length)*60) as 'hours and min'
FROM film;
-- 4. The average duration is 1 hour and 55 minutes
SELECT COUNT(DISTINCT(last_name))
from actor;
-- 5. There are 121 distinct actor's last names
SELECT DATEDIFF(MAX(rental_date), MIN(rental_date)) AS 'days_operating' 
FROM rental;
-- 6. The company has been operating since 266 days
SELECT DATE_FORMAT(rental_date,'%M') AS 'month', DATE_FORMAT(rental_date,'%a') AS 'day'
FROM rental
LIMIT 20;
SELECT rental_date,
-- 7. Additional column with month and week day
CASE
WHEN DATE_FORMAT(rental_date,'%a') = 'Sat' then 'weekend'
WHEN DATE_FORMAT(rental_date,'%a') = 'Sun' then 'weekend'
ELSE 'weekday'
END AS column_day_type
FROM rental;
-- 8. Weekend and Weekday column
SELECT title, release_year
FROM film;
-- 9. Get release years
SELECT *
FROM film
WHERE title LIKE '%ARMAGEDDON%';
-- 10. There are 6 movies with Armageddon in its title
SELECT *
FROM film
WHERE title LIKE '%APOLLO';
-- 11. There are 5 movies with Apollo at the end

SELECT title, length
FROM film
ORDER BY length DESC
LIMIT 10;
-- 12. The ten longest films 

SELECT COUNT(special_features) as 'Behind_the_Scenes_content'
FROM film
WHERE special_features LIKE '%Behind the Scenes%';
-- 13. There are 538 films with Behind the Scenes content. 
