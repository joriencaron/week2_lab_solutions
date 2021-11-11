USE sakila;

-- 1. There are 121 distinct actors' last names
SELECT COUNT(DISTINCT(last_name))
FROM sakila.actor;

-- 2. Add an additional column with day types
SELECT *,
CASE 
WHEN DATE_FORMAT(rental_date,'%a') = 'Sat' then 'Weekend'
WHEN DATE_FORMAT(rental_date,'%a') = 'Sun' then 'Weekend'
ELSE 'Weekday'
END AS 'column_day_type'
FROM sakila.rental;

-- 3. There are 6 films with Armageddon in the title
SELECT *
FROM sakila.film
WHERE title LIKE '%ARMAGEDDON%';

-- 4. The #1 longest film is Chicago North and the #10 longest film is Worst Banger
SELECT title, length
FROM sakila.film
GROUP BY title, length
ORDER BY length DESC;

-- 5. There are 538 films with Behind the Scenes content
SELECT COUNT(title)
FROM sakila.film
WHERE special_features LIKE '%Behind the Scenes%';

-- 6. PG-13 has the films with an average duration of two hours
SELECT rating, AVG(length)
FROM sakila.film
GROUP BY rating
HAVING AVG(length) > 120;

-- 7. The first in rank are films with a duration of 185 minutes. Second are films with an duration of 184 minutes and so on. 
SELECT DENSE_RANK() OVER(ORDER BY length DESC) as 'Rank', title, length
FROM film
WHERE length != 0 and length IS NOT NULL;

