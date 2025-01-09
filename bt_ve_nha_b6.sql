use sakila;

-- c1 Lấy danh sách tên các diễn viên (actors) có họ bắt đầu bằng chữ “S”.
select last_name
from actor
where last_name like 'S%';
-- Lấy danh sách các bộ phim (films) được phát hành trong khoảng từ năm 2000 đến năm 2010.
select title
from film
where year(last_update) between 2000 and 2010; 
-- Lấy danh sách các bộ phim (films) có rating là “PG” hoặc “PG-13”.
select title,rating
from film
where rating in ('PG','PG-13');
-- Lấy danh sách diễn viên (actors) và số lượng bộ phim (films) mà họ tham gia, sắp xếp theo số lượng bộ phim giảm dần.
select a.first_name, count(fa.film_id) as soluong
from actor a join film_actor fa using (actor_id)
group by a.actor_id
order by soluong desc;
-- Lấy danh sách các bộ phim (films) và thể loại (categories) của chúng.
select f.title , c.name
from film f join film_category fc using(film_id)
join category c using(category_id);

-- Lấy danh sách các bộ phim (films) và tổng số diễn viên (actors) tham gia trong mỗi bộ phim, sắp xếp theo tổng số diễn viên giảm dần.
select f.title , count(actor_id) as soluong
from  film f join film_actor fa using(film_id)
group by f.film_id
order by soluong desc;
-- Lấy danh sách các diễn viên (actors) có số lượng bộ phim (films) tham gia lớn hơn 30.
select first_name,count
from (select count(f.film_id) as count, a.first_name from film f join film_actor fa using(film_id) join actor a using (actor_id) group by a.actor_id)as temp
where count>30;
-- Lấy danh sách các diễn viên (actors) không tham gia trong bất kỳ bộ phim nào.
select first_name
from (select count(f.film_id) as count, a.first_name from film f join film_actor fa using(film_id) join actor a using (actor_id) group by a.actor_id)as temp
where count is null;
-- Lấy danh sách bộ phim (films) và tổng doanh thu (revenue) của từng bộ phim, sắp xếp theo tổng doanh thu giảm dần.
select title, replacement_cost
from film
order by  replacement_cost desc;

-- Lấy danh sách các bộ phim (films) và thể loại (categories) của chúng, với điều kiện mỗi bộ phim thuộc thể loại “Horror”.
select f.title
from film f join film_category fc using(film_id)
join category c using(category_id)
where c.name = 'Horror';