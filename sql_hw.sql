USE sakila;

#1a
SELECT first_name, last_name
FROM actor;

#1b
SELECT concat(first_name, " ", last_name) AS `Actor Name` 
FROM actor;
 
#2a
SELECT * FROM actor
WHERE first_name = "JOE";

#2b
SELECT * FROM actor
WHERE last_name LIKE '%G%' AND last_name LIKE '%E%' AND last_name LIKE '%N%';

#2c
SELECT * FROM actor
WHERE last_name LIKE '%L%' AND last_name LIKE '%I%'
ORDER BY last_name, first_name;

#2d
SELECT country_id, country
FROM country
WHERE country IN ("Afghanistan", "Bangladesh", "China");

#3a
ALTER TABLE actor
ADD middle_name VARCHAR(29)
AFTER first_name;

#3b
ALTER TABLE actor
MODIFY COLUMN middle_name BLOB;

#3c
ALTER TABLE actor
DROP COLUMN middle_name;

#4a
SELECT last_name, count(last_name) FROM actor
GROUP BY last_name;

#4b
SELECT last_name, count(last_name) FROM actor
GROUP BY last_name
HAVING count(last_name)>1;

#4c
UPDATE actor
SET first_name = "HARPO"
WHERE first_name = "GROUCHO" AND last_name = "WILLIAMS";

#4d
SELECT first_name, last_name,

CASE
	WHEN first_name = 'HARPO' AND last_name = 'WILLIAMS' THEN first_name = 'GROUCHO'
	WHEN first_name = 'GROUCHO' and last_name = 'WWILLIAMS' THEN first_name = 'MUCHOGROUCHO'
	ELSE END AS actor
FROM actor;
  
#5a
SHOW CREATE TABLE actor;

#6a
SELECT staff.first_name, staff.last_name, address.address
FROM staff
JOIN address ON
address.address_id=staff.address_id;

#6b
SELECT staff.first_name, staff.last_name, sum(payment.amount)
FROM staff
JOIN payment ON
payment.staff_id = staff.staff_id
GROUP BY last_name;

#6c
SELECT film.title, count(film_actor.actor_id)
FROM film
JOIN film_actor ON
film.film_id = film_actor.film_id
GROUP BY film.title;

#6d
SELECT count(inventory_id)
FROM inventory
WHERE film_id IN (
	SELECT film_id
    FROM film
    WHERE title = 'Hunchback Impossible'
    );

#6e
SELECT customer.last_name, sum(payment.amount)
FROM customer
JOIN payment ON
payment.customer_id = customer.customer_id
GROUP BY customer.last_name
ORDER BY customer.last_name;

#7a
SELECT title FROM film
WHERE title LIKE 'K%' OR title LIKE 'Q%' AND language_id IN (
	SELECT language_id
    FROM language
    WHERE name='English');

#7b
SELECT first_name, last_name FROM actor
WHERE actor_id IN (
	SELECT actor_id
    FROM film_actor
    WHERE film_id IN (
		SELECT film_id
        FROM  film
        WHERE title = "Alone Trip"));
        
#7c
SELECT customer.first_name, customer.last_name, customer.email
FROM customer
JOIN country ON
customer.address_id = country.address_id;

#7d
SELECT title
FROM film
WHERE category_id in (
	SELECT category_id
    FROM category
    WHERE 'name'="family");


#7e
SELECT count(rental_id), inventory_id FROM rental GROUP BY inventory_id ORDER BY count(rental_id) DESC;

#7f
SELECT sum(amount) FROM payment GROUP BY staff_id;



