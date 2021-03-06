/*
 * A group of social scientists is studying American movie watching habits.
 * To help them, select the titles of all films that have never been rented by someone who lives in the United States.
 *
 * NOTE:
 * Not every film in the film table is available in the store's inventory,
 * and you should only return films in the inventory.
 *
 * HINT:
 * This can be solved either with a LEFT JOIN or with the NOT IN operator.
 * You may choose whichever solution makes the most sense to you.
 */


select title 
from film
inner join inventory using (film_id)
where title not in (
    select title 
    from film 
    inner join inventory using (film_id)
    inner join rental using (inventory_id)
    inner join customer using (customer_id) 
    inner join address using (address_id) 
    inner join city using (city_id)
    inner join country using (country_id) 
    where country = 'United States')
group by title
order by title; 

