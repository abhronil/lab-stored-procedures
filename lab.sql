-- Q1

DELIMITER //
create procedure Action_film_cust_name()
begin

  select first_name, last_name, email
  from customer
  join rental on customer.customer_id = rental.customer_id
  join inventory on rental.inventory_id = inventory.inventory_id
  join film on film.film_id = inventory.film_id
  join film_category on film_category.film_id = film.film_id
  join category on category.category_id = film_category.category_id
  where category.name = "Action"
  group by first_name, last_name, email;
  
  end //
  DELIMITER ;
  
  call Action_film_cust_name();
  
  
  -- Q2
  
  DELIMITER //
create procedure Action_film_cust_name_var(in x char (20))
begin

  select first_name, last_name, email
  from customer
  join rental on customer.customer_id = rental.customer_id
  join inventory on rental.inventory_id = inventory.inventory_id
  join film on film.film_id = inventory.film_id
  join film_category on film_category.film_id = film.film_id
  join category on category.category_id = film_category.category_id
  where category.name = x
  group by first_name, last_name, email;
  
  end //
  DELIMITER ;
  
  call Action_film_cust_name_var("animation");
  
  
  -- Q3
  
  select c.name, count(f.film_id) from film_category f 
  left join category c on f.category_id = c.category_id
  group by c.name;
  
  
  DELIMITER //
  create procedure category_threshold(in x int)
  begin
	select c.name, count(f.film_id) from film_category f 
	left join category c on f.category_id = c.category_id
	group by c.name
    having count(f.film_id) > x;
    end //
    DELIMITER ;
    
call category_threshold(50);
  
  