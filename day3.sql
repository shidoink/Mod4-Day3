--1. List all customers who live in Texas (use JOINs)

select customer.first_name, customer.last_name,  address.district
from address 
inner join customer on address.address_id= customer.address_id
where address.district = 'Texas';

--2. Get all payments above $6.99 with the Customer's Full Name

select customer.first_name, customer.last_name, payment.amount 
from payment
inner join customer on customer.customer_id= payment.customer_id
where amount> '6.99'

--3. Show all customers names who have made payments over $175(use subqueries)

select first_name, last_name,
from customer 
where customer_id in(
	select customer_id
	from payment
	where amount > 175
);

--4. List all customers that live in Nepal (use the city table)

select customer.first_name, customer.last_name 
from customer 
full join address
on customer.address_id = address.address_id 
full join city 
on address.city_id = city.city_id
full join country 
on city.country_id = country.country_id 
where country = 'Nepal'

--5.  Which staff member had the most transactions?

select count(payment.payment_id), staff.first_name, staff.last_name
from payment
inner join staff on staff.staff_id= payment.staff_id
group by staff.first_name, staff.last_name
order by count(payment.payment_id) desc;

--6. How many movies of each rating are there?

select count(film_id), rating
from film 
group by rating 
order by count(film_id) desc;

--7. Show all customers who have made a single payment above $6.99 (Use Subqueries)

select first_name, last_name
from customer
where customer_id in(
	select customer_id 
	from payment
	group by payment.payment_id
	having count(payment_id)=1 and amount >6.99 
	order by customer_id
);

--8. How many free rentals did our stores give away?

select count(rental.rental_id)
from rental 
full outer join payment on rental.rental_id = payment.rental_id
where amount is null;

--1452

