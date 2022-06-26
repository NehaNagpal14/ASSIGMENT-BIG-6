-- ans1
-- staff, address would join on address_id
-- address, city would join on city_id
-- city, country would join on country_id
select 
store.store_id,
staff_id, 
first_name,
last_name,
address,
district,
city,
country 
from staff left join store
on staff.store_id = store.store_id
left join address on
store.address_id = address.address_id
left join city on
address.city_id = city.city_id
left join country on 
city.country_id = country.country_id;

-- ans2
-- tables are inventory, film
-- inventory and film will join on film id
select inventory_id,
store_id, title, 
rating, rental_rate,
 replacement_cost
from inventory
left join film on 
inventory.film_id = film.film_id;

-- ans 3
select 
rating, 
count(inventory_id)
 from film
left join inventory on
film.film_id = inventory.film_id
group by rating
order by count(inventory_id) desc;

-- ans 4
-- number of films, average replacement cost, total replacement cost, store, film category
-- film and inventory would join on film_id

select count(film.film_id) as number_of_films, name as category,
avg(replacement_cost),
sum(replacement_cost) as total_replacement_cost,
store_id from film
left join inventory 
on film.film_id =inventory.film_id
left join film_category
on inventory.film_id = film_category.film_id
left join category 
on film_category.category_id= category.category_id
group by store_id, name 
order by sum(replacement_cost) desc;

-- ans 5
-- all customers' name, which store they go, active or not, full address, city, country
-- customer and address would join at address_id,
-- address and city on city_id
-- city and country on country_id
select first_name,
last_name, store_id,
active, address, district,
city, country
 from customer
left join address 
on customer.address_id = address.address_id
left join city on
address.city_id = city.city_id
left join country on 
city.country_id = country.country_id;

-- ans 6
-- customer' name, total lifetime rentals, sum of all the payments you have collected from them, 
-- most valueable customers at the top
select first_name,
last_name,
sum(amount),
count(rental.rental_id) as total_rentals from customer
left join rental on 
rental.customer_id = customer.customer_id
left join payment on
rental.rental_id = payment.rental_id
group by first_name, last_name
order by sum(amount) desc;

-- ans 7
select advisor_id as stakeholder_id,
first_name,
last_name,
is_chairmain as invested_company_name, 
'advisor' as stakeholder from advisor
union
select *,
'investor' as stakeholder
from investor;

-- ans 8
select First_name, last_name,  
 case
    when awards in ('emmy','oscar','tony') then '3 awards'
    when awards in ('emmy,oscar','emmy,tony','oscar,tony') then '2 awards'
   else '1 award'
    end 'no. of award'
from actor_award;

select  awards, (count(awards)/157)*100 as percentage_of_actors
from actor_award
group by awards;