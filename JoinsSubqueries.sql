-- Question 1
select first_name, last_name
from customer
join address
on address.address_id = customer.address_id
where district = 'Texas';
-- Answer: Jennifer Davis, Kim Cruz, Richard Mccrary, Bryan Hardison, Ian Still

-- Question 2
select amount, customer.first_name, customer.last_name
from payment
join customer
on customer.customer_id = payment.customer_id
where amount > 6.99;
-- Answer: 1406 payments above 6.99

-- Question 3
select first_name, last_name
from customer
where customer_id in (
	select customer_id
	from payment
	group by customer_id
	having sum(amount) > 175
	order by sum(amount) desc
);
-- Answer: Rhonda Kennedy, Clara Shaw, Eleanor Hunt, Marion Snyder, Tommy Collazo, Karl Seal

-- Question 4
select customer.first_name, customer.last_name
from city
join address
on address.city_id = city.city_id
join customer
on customer.address_id = address.address_id
where city = 'Nepal';
-- Answer: 0

-- Question 5
select first_name, last_name, staff.staff_id, count(*)
from staff
join payment
on payment.staff_id = staff.staff_id
group by staff.staff_id
order by count desc
limit 1;
-- Answer: Staff # 2 (Jon Stephens) had the most transactions at 7,304

-- Question 6
select film.film_id, film.title, count(film_actor.actor_id)
from film_actor
join film
on film.film_id = film_actor.film_id
group by film.film_id
order by count desc
limit 1;
-- Answer - Lambs Cincinatti had the most actors at 15

-- Question 7
select count(film_actor.actor_id), film_actor.actor_id
from film_actor
join film
on film.film_id = film_actor.film_id
group by actor_id
order by count;
-- Answer: actor 148 has been in the least amoutn of movies (14)

-- Question 8
select district, count(district)
from address
join customer
on customer.address_id = address.address_id
group by address.district
having count(address.district) > 5
-- Answer:9


