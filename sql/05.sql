/*
 * Management wants to advertise to actors,
 * and needs a list of all actors who are not also customers.
 *
 * Assume that if an entry in the customer and actor table share a first_name and last_name,
 * then they represent the same person.
 * Then select all actors who are not also customers.
 *
 * HINT:
 * This can be solved using either a LEFT JOIN or the NOT IN operator.
 */

/* NOT IN 
SELECT 
    last_name,
    first_name
FROM actor 
WHERE first_name || last_name not in (
    select 
        first_name || last_name
    from customer )
ORDER BY last_name, first_name;
*/ 

SELECT 
    last_name,
    first_name 
FROM actor
LEFT JOIN customer USING (last_name, first_name)
WHERE 
    customer_id is null
ORDER BY last_name, first_name;
