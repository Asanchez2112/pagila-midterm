/*
 * You love the acting in the movie 'AMERICAN CIRCUS' and want to watch other movies with the same actors.
 *
 * Write a SQL query SELECT query that:
 * Lists the title of all movies where at least 2 actors were also in 'AMERICAN CIRCUS'.
 * (You may choose to either include or exclude the movie 'AMERICAN CIRCUS' in the results.)
 */
SELECT title
FROM (
    SELECT title,
           count(title) as actor_count
    FROM film
    INNER JOIN film_actor USING(film_id)
    INNER JOIN actor USING(actor_id)
    WHERE first_name || ' ' || last_name IN (
        SELECT first_name || ' ' || last_name AS "Actor Name"
        FROM film
        INNER JOIN film_actor USING(film_id)
        INNER JOIN actor USING(actor_id)
        WHERE title='AMERICAN CIRCUS')
    GROUP BY title) subquery
WHERE actor_count >= 2
ORDER BY title;


