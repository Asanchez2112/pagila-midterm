/*
 * Write a SQL query SELECT query that:
 * List the first and last names of all actors who have appeared in movies in the "Children" category,
 * but that have never appeared in movies in the "Horror" category.
 *
 * HINT:
 * This requires joining from the category table down to the actor table.
 */

SELECT DISTINCT first_name || ' ' || last_name AS "Actor Name"
FROM actor
INNER JOIN film_actor USING(actor_id)
INNER JOIN film USING(film_id)
INNER JOIN film_category USING(film_id)
INNER JOIN category USING(category_id)
WHERE name='Children' AND first_name || ' ' || last_name NOT IN (
    SELECT first_name || ' ' || last_name AS "Actor Name"
    FROM actor
    INNER JOIN film_actor USING(actor_id)
    INNER JOIN film USING(film_id)
    INNER JOIN film_category USING(film_id)
    INNER JOIN category USING(category_id)
    WHERE name='Horror')
ORDER BY "Actor Name";

