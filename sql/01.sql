/*
 * Use a subquery to select the film_id and title columns
 * for all films whose rental_rate is greater than the average.
 * Use the film table and order by title.
 *
 * HINT:
 * The postgresqltutorial.com website has a solution for this problem.
 */

select
    film_id,
    title 
from film 
where rental_rate > (
    select avg(rental_rate) from film)
order by title;

/*

select 
    title 
from film
group by title, rental_rate
having rental_rate > (
    select 
        avg(rental_rate)
        from film
order by title
    );

select 
    title 
from film 
group by title, rental_rate
having rental_rate > avg(rental_rate); 

select
    title,
    film_id
from film 
where rental_rate in (
    select rental_rate
    from film 
    where rental_rate > avg(rental_rate)
);
*/
