CREATE DATABASE buoi2;
USE buoi2; 

CREATE TABLE addresses (
	id INT,
    house_number INT,
	city VARCHAR(20),
    postcode VARCHAR(7)
);

CREATE TABLE people (

	id INT,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    address_id INT
); 

CREATE TABLE pets (

	id INT,
    name VARCHAR(20),
    species VARCHAR(20), 
    owner_id INT
); 
-- c1
ALTER TABLE people
ADD PRIMARY KEY (id);

ALTER TABLE pets
ADD primary key (id);
-- c2
ALTER table pets
ADD constraint FK_pets
foreign key (owner_id) REFERENCES people (id);
-- c3
alter table people
add email varchar(30);
-- c4
alter table people
add constraint UQ_rangbuoc unique (email);
-- c5
alter table pets change `name` `first_name` varchar(30);
-- c6
alter table people modify email char(7);

-- BT luyen tap DML
create database product;
use product;

create table Product(
	product_id int primary key auto_increment,
    product_name varchar(30),
    price double,
    quantity int
);
INSERT INTO Product (product_name, price, quantity)   
VALUES   
('Áo hoodie', 250000, 50),  
('Quần jeans', 300000, 100),  
('Giày sneaker', 500000, 20),  
('Ví da', 150000, 30),  
('Mũ lưỡi trai', 80000, 40),  
('Túi xách', 200000, 60),  
('Đồng hồ', 1000000, 10),  
('Kính râm', 120000, 80),  
('Bất chống', 25000, 150),  
('Găng tay', 50000, 120);  

 select * from Product;
-- 3 them mot truong description vao bang
alter table Product
add description varchar(30);

-- 4 Cập nhật giá (price) của sản phẩm có “product_id” là 1 thành 99.
update Product
set price = 99
where product_id=1;

-- 5 Tăng giá của sản phẩm có “product_id” là 2 lên 10%.Dựa vào bảng Person đã import
update Product
set price = price*1.1
where product_id = 2;


-- Tao bang person
create database person;
use person;

create table person(
id int primary key auto_increment,
person_name varchar(30),
country varchar(30),
date_of_birth date,
salary decimal(10,2)
);
INSERT INTO person (person_name, country, date_of_birth, salary)
 VALUES
('John Doe', 'USA', '1990-05-14', 50000.00),
('Alice Smith', 'Canada', '1985-08-23', 62000.00),
('Bob Johnson', 'UK', '1992-11-11', 54000.00),
('Maria Garcia', 'Spain', '1988-02-15', 55000.00),
('David Lee', 'Australia', '1980-07-01', 60000.00),
('Emma Davis', 'USA', '1995-01-30', 47000.00),
('James Wilson', 'Germany', '1987-09-19', 67000.00),
('Sophia Brown', 'France', '1993-04-25', 51000.00),
('Liam Martinez', 'Mexico', '1982-12-05', 58000.00),
('Olivia Taylor', 'UK', '1990-03-22', 53000.00);

select * from person;
-- 6 Cập nhật tên của người có id là 10 thành “John Doe”.

UPDATE person  
SET person_name = "JohnDoe"  
WHERE id = 10;

-- 7 Đổi quốc gia của người có id là 3 thành “Canada”.
update person
set country = "cannada"
where id=3;

-- 8 Sửa ngày sinh của người có id là 7 thành “1990-05-15” và quốc gia thành Việt Nam.
update person
set date_of_birth = '1990-05-15' , country = "VietNam"
where id =7;

-- 9 Tăng mức lương của người có id là 4 lên 10%.
update person
set salary = salary*(1+0.1)
where id= 4;

-- 10 Giảm lương của những người nào có mức lương trên 6000 xuống 15%

UPDATE person
SET salary = salary * 0.85
WHERE salary > 6000 and id>0;
