use person;
-- c1 Lấy danh sách các quốc gia duy nhất.
select distinct country
from person;
--  c2 Sắp xếp danh sách người theo tên đầy đủ (fullname) theo thứ tự tăng dần.
select fullname
from person
order by fullname asc;
-- c3 Sắp xếp danh sách người theo nghề nghiệp (job) theo thứ tự giảm dần.
select job
from person
order by job desc;
-- c4 Lấy danh sách các nghề nghiệp (job) duy nhất mà người trong bảng đang làm.
select distinct job
from person;
-- c5 Đếm số người theo từng quốc gia và sắp xếp theo số lượng người giảm dần.
select count(id) as soluong, country
from person
group by country
order by soluong;
-- c6 Tính tổng lương (salary) của tất cả người trong bảng.
select sum(salary) as tongluong
from person;
-- c7 Tính tổng lương trung bình của người theo từng nghề nghiệp (job) và sắp xếp theo lương trung bình tăng
SELECT job, AVG(salary) AS luongtb  
FROM person  
GROUP BY job  
ORDER BY luongtb ;
-- 8Lấy ra người có lương (salary) lớn hơn 50000 và ngày sinh (birthday) nằm trong khoảng ‘1990-01-01’ đến ‘1995-12-31’.
SELECT *  
FROM person  
WHERE salary > 5000  
AND birthday BETWEEN '1990-01-01' AND '1995-12-31';
-- c9 Lấy ra người có lương (salary) lớn hơn 60000 và nghề nghiệp (job) là ‘Developer’ hoặc ‘Engineer’.
select fullname
from person
where salary > 6000 and job in ('Developer' , 'Engineer');
-- c10 Lấy ra danh sách các nghề nghiệp (job) duy nhất mà có ít nhất 3 người làm.
SELECT job, COUNT(*) AS soluong  
FROM person  
GROUP BY job  
HAVING soluong >= 3;
-- c11 Lấy ra người nam (gender = ‘Male’) có lương (salary) cao nhất.
select max(salary) as luongcaonhat
from person
where gender='M';
-- c12 Lấy ra người nữ (gender = ‘Female’) có lương (salary) thấp nhất.
select min(salary) as luongcaonhat
from person
where gender='F';
-- c13 Lấy danh sách người (không trùng lặp) theo thứ tự tên đầy đủ tăng dần.
select distinct fullname
from person
order by fullname;

-- c14 Đếm số người sinh vào các tháng khác nhau và sắp xếp theo thứ tự số lượng tăng dần.
SELECT MONTH(birthday) AS thangsinh, COUNT(*) AS soluong  
FROM person  
GROUP BY MONTH(birthday)  
ORDER BY soluong ASC;
-- c15 Tính tổng lương (salary) của tất cả người trong bảng.
select sum(salary) as tongluong
from person;

-- BAI VE NHA
-- c1 Lấy ra danh sách các nghề nghiệp (job) duy nhất mà người trong bảng không làm trùng lặp.
SELECT job, COUNT(*) AS soluong 
FROM person  
GROUP BY job  
HAVING COUNT(*) = 1;
-- c2 Lấy ra danh sách các người có nghề nghiệp (job) là ‘Manager’ và lương (salary) lớn hơn 70000.
select fullname
from person
where job = 'Manager' and salary > 70000;
-- c3 Lấy ra người có tuổi từ 25 đến 35.

SELECT fullname
FROM person
WHERE TIMESTAMPDIFF(YEAR, birthday, NOW()) BETWEEN 25 AND 35;

-- c4 Lấy ra danh sách các quốc gia (country) và tổng số lượng người từng quốc gia.
select country, count(*) as songuoi
from person
group by country;

-- c5 Tính số lượng nam (gender = ‘Male’) và nữ (gender = ‘Female’) trong bảng.
SELECT gender, COUNT(*) AS soluong  
FROM person  
GROUP BY gender;

-- c6 Lấy ra số lượng người có cùng nghề nghiệp (job) và quốc gia (country).
select job, country, count(*) as soluong
from person
group by job, country;

-- c7 Lấy ra danh sách người theo thứ tự giảm dần của ngày sinh (birthday).
SELECT DAY(birthday) AS ngay_sinh, COUNT(*) AS ngaysinh
FROM person
GROUP BY DAY(birthday)
ORDER BY ngaysinh DESC;
-- c8 Lấy ra các nghề nghiệp (job) và tổng số lượng người làm nghề đó, nhưng chỉ hiển thị những nghề nghiệp có ít nhất 3 người làm.
select job, count(*) as soluong
from person
group by job
having count(*)>=3;

-- Bai 2
use coffee_store;
-- c1 
select first_name, last_name,phone_number
from customers
where last_name like 'Bluth';

