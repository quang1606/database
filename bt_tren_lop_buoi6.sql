use sakila;
-- c1 Chúng ta có bao nhiêu thể loại phim?
select  count(category_id) as theloai
from category;

-- c2 Đếm số lượng phim "HÀNH ĐỘNG"
select count(*) AS so_luong_phim
from film f join film_category fc on f.film_id = fc.film_id
join category c on c.category_id = fc.category_id 
where c.name = 'Action'
GROUP BY   c.category_id;
-- c3. Đếm số lượng khách hàng duy nhất có trong bảng thuê	
select count(customer_id) as soluong
from (select distinct customer_id from customer) as duynhat;
-- c 4. Chọn tiêu đề phim và độ dài của tất cả các phim có độ dài lớn hơn độ dài trung bình của phim
SELECT title, length
from film
where length > (select avg(length) as trungbinh from film);
-- c5. Chọn số lượng phim tối đa và tối thiểu cho mỗi danh mục
SELECT category.name AS category_name, 
       COUNT(film_category.film_id) AS film_count
FROM category JOIN film_category USING(category_id)
GROUP BY category.category_id, category.name
ORDER BY film_count DESC
LIMIT 1;

SELECT category_id, name,
	(SELECT COUNT(film_id) FROM film_category WHERE category_id = c.category_id) AS film_count
FROM category c
ORDER BY film_count DESC
LIMIT 1;
-- c6 Cho tôi biết tên từng thể loại và số lượng phim trong thể loại đó
select name,count(f.film_id)
 FROM film f  
  JOIN film_category fc ON f.film_id = fc.film_id  
  JOIN category c ON c.category_id = fc.category_id  
  group by fc.category_id;
  -- c7  Nối tên phim và độ dài từ bảng phim 
  select concat(title,length)
  from film;
  -- c8 Trích xuất email khách hàng từ ký tự thứ 5 trở đi
  select substring(email,5)
  from customer;

-- c9  Cho tôi biết tên khách hàng viết thường và họ viết hoa đối với mỗi khách hàng có họ là "Smith"
select lower(first_name),upper(last_name)
from customer
where last_name='Smith';

-- c10. Cho tôi biết 3 chữ cái cuối của mỗi tên phim trong bảng phim
select substring(title,-3,length(title))
from film;
-- c11 Ghép ba chữ cái đầu tiên trong cột họ và tên từ bảng khách hàng lại với nhau
select concat(substring(last_name,3),substring(first_name,3))
from customer;
-- c12 Phim nào dài hơn 2 tiếng?
select title
from film
where length >120;

-- c13  Hạng mục nào có nhiều phim nhất? 
select c.name, count(fc.film_id) as soluong
 FROM film f  
  JOIN film_category fc ON f.film_id = fc.film_id  
  JOIN category c ON c.category_id = fc.category_id  
  group by fc.category_id
  having soluong= (select max(count) from ( select count(film_id) as count from film_category group by category_id ) as temp
  ); 
  -- c14  Có bao nhiêu diễn viên cho bộ phim 'TUYỆT VỜI'?
  select count(a.actor_id) as soluong
  from actor a join film_actor fc using(actor_id)
  join film f using(film_id)
  where title = 'AFFAIR PREJUDICE'
  group by f.film_id;
  
  -- c15 5 khách hàng nào thuê nhiều nhất 
  select c.first_name,c.last_name, count(r.rental_id) as soluong
  from customer c join rental r using(customer_id)
  group by c.customer_id
  order by soluong desc
  limit 5;
  
  -- 16. Những bộ phim nào được chiếu ở hạng mục 'Hành động'?
  select f.title
 FROM film f  
  JOIN film_category fc ON f.film_id = fc.film_id  
  JOIN category c ON c.category_id = fc.category_id  
  where c.name = 'Action';
  
  -- c17 . Có bao nhiêu khách hàng đã thuê?
   select count(customer_id) as soluong
   from customer;

  
  