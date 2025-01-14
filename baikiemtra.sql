use mavenmovies;
-- c1 Chúng tôi sẽ cần danh sách tất cả các nhân viên, bao gồm tên và họ,địa chỉ email và mã số cửa hàng nơi họ làm việc.
select first_name,last_name,email,store_id
from staff;
-- c2
select s.store_id , count(i.inventory_id) as tonkho
from store s join inventory i using(store_id)
group by store_id;
-- c3 
select s.store_id,count(c.active) as hoatdong
from customer c join store s using(store_id)
where c.active = 1
group by store_id;
-- c4 
select count(email) as soluongemail
from customer;
-- c5.1
select s.store_id,count(f.film_id) as soluong
from film f join inventory i using(film_id)
join store s using(store_id)
group by s.store_id;

-- c5.2
select  count(name) as sodanhmuc
from category;

-- c6 
select max(replacement_cost) as max , min(replacement_cost) as min, avg(replacement_cost) as trungbinh
from film;
-- c7 
select avg(amount) as trungbinh, max(amount) as toida
from payment;

-- c8 
select c.customer_id,count(r.rental_id) as soluong
from customer c join rental r using(customer_id)
group by customer_id
order by soluong desc; 

-- c9
SELECT   s.manager_staff_id,  st.first_name,   st.last_name,   a.address,   a.district,  ci.city,   co.country  
FROM store s  
  JOIN staff st ON s.manager_staff_id = st.staff_id  
  JOIN address a ON st.address_id = a.address_id  
  JOIN city ci ON a.city_id = ci.city_id  
  JOIN country co ON ci.country_id = co.country_id;
-- c10
select i.store_id, i.inventory_id, f.title AS ten_phim, f.rating AS xep_hang, f.rental_rate AS gia_thue, f.replacement_cost AS chi_phi_thay_the  
from  inventory i  
join film f ON i.film_id = f.film_id  
order by i.store_id, i.inventory_id;  
-- c11
select i.store_id, f.rating AS xep_hang, COUNT(i.inventory_id) AS so_luong  
from  inventory i  
join film f ON i.film_id = f.film_id  
group by i.store_id, f.rating  
order by i.store_id, f.rating;
-- c12
select i.store_id, c.name AS danh_muc_phim, COUNT(f.film_id) AS so_luong_phim, AVG(f.replacement_cost) AS chi_phi_thay_the_trung_binh, SUM(f.replacement_cost) AS tong_chi_phi_thay_the  
from inventory i  
join film f ON i.film_id = f.film_id  
join film_category fc ON f.film_id = fc.film_id  
join category c ON fc.category_id = c.category_id  
group by i.store_id,c.name  
order by i.store_id, c.name;  
-- c13
SELECT c.customer_id, c.first_name,  c.last_name, s.store_id, c.active, a.address, ci.city, co.country  
FROM customer c  
JOIN store s ON c.store_id = s.store_id  
JOIN address a ON c.address_id = a.address_id  
JOIN city ci ON a.city_id = ci.city_id  
JOIN country co ON ci.country_id = co.country_id  
ORDER BY c.customer_id;  
-- c14
SELECT c.first_name, c.last_name, SUM(p.amount) AS tong_tien_thue, SUM(p.amount) AS tong_tien_thu  
FROM customer c  
JOIN payment p ON c.customer_id = p.customer_id  
GROUP BY c.customer_id,c.first_name,c.last_name  
ORDER BY tong_tien_thu DESC;
-- c15
select  "nha dau tu " as loai,first_name, last_name, company_name as congty
from investor
union all
select  " co van " as loai ,first_name, last_name,NULL AS congty  
from  advisor;

-- c16
select count(actor_award_id) as soluong ,count(actor_id) as soluong2,(COUNT(actor_id) * 1.0 / COUNT(actor_award_id)) AS ti_le  
from (select actor_award_id,actor_id, first_name,last_name,(LENGTH(awards) - LENGTH(REPLACE(awards, ',', ''))) / LENGTH(',') AS so_dau_phay
from  actor_award) as  temp
group by so_dau_phay
