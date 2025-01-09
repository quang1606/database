-- Bài tập 1: Lấy danh sách các bộ phim (films) thuộc thể loại “Action.”
SELECT f.title   
FROM film f   
WHERE f.film_id IN (  
  SELECT fc.film_id   
  FROM film_category fc   
   JOIN category c ON fc.category_id = c.category_id  
  WHERE c.name = 'Action'  
);
-- Bài tập 2: Lấy danh sách các bộ phim (films) và thể loại (categories) của chúng.
select f.title, c.name
from film f join film_category fc using(film_id)
join category c using(category_id);
-- Bài tập 3: Lấy danh sách các bộ phim (films) và số lượng thể loại (categories) của mỗi bộ phim.
select f.title , (select count(fc.category_id) as soluong from film_category fc where fc.film_id =f.film_id   group by fc.film_id) as soluong
from film f ;
-- Bài tập 4: Lấy danh sách các bộ phim (films) và thể loại (categories) của bộ phim có rating “PG-13.”
select f.title,c.name,f.rating
from film f join film_category fc using(film_id)
join category c using(category_id)
where f.rating = 'PG-13';
 -- Bài tập 5: Lấy danh sách các diễn viên (actors) và số lượng bộ phim (films) thuộc thể loại “Family,” sắp xếp theo số lượng bộ phim giảm dần
SELECT a.actor_id, a.first_name, a.last_name, COUNT(*) as soluong  
FROM actor a JOIN film_actor fc USING (actor_id)  
WHERE   fc.film_id IN (SELECT f.film_id FROM film f WHERE f.film_id IN ( SELECT fc.film_id FROM film_category fc JOIN category c USING (category_id) WHERE c.name = 'Family') )  
GROUP BY a.actor_id, a.first_name,  a.last_name
order by soluong desc;
-- Bài tập 6: Lấy danh sách các bộ phim (films) và số lượng diễn viên (actors) tham gia, sắp xếp theo số lượng diễn viên giảm dần.
select f.title , count(fa.actor_id) as soluong
from film f join film_actor fa using (film_id)
group by f.film_id;

-- Bài tập 7: Lấy danh sách tất cả diễn viên (actors) có họ là “Smith” và tên bắt đầu bằng “J.”
select last_name,first_name
from actor
where last_name='Smith' and last_name like'J%';
-- Bài tập 8: Lấy danh sách các bộ phim (films) phát hành trong năm 2015 với tổng doanh thu (revenue) lớn hơn 5000.
select title
from film
where release_year = 2015 and replacement_cost >5000;
-- Bài tập 9: Lấy danh sách bộ phim (films) và ngôn ngữ (language) của từng bộ phim.
select f.title,l.name
from film f join language l using(language_id) ;
-- Bài tập 10. Lấy danh sách bộ phim có tên(title) bắt đầu bằng chữ ‘I’ và kết thúc bằng chữ N
select title
from film
where substring(title,1)='I' and substring(title,-1)='N';