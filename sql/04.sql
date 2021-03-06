/*
 * Select the titles of all films that the customer with customer_id=1 has rented more than 1 time.
 *
 * HINT:
 * It's possible to solve this problem both with and without subqueries.
 */

-- source: https://learnsql.com/blog/subquery-vs-join/ <- super helpful!! 


SELECT title 
FROM (
    SELECT title, customer_id, count(title) as titlecount 
    FROM film
    INNER JOIN inventory USING (film_id)
    INNER JOIN rental USING (inventory_id)
    INNER JOIN customer USING (customer_id)
    GROUP BY title, customer_id ) AS s
WHERE titlecount > 1 AND customer_id = 1; 


