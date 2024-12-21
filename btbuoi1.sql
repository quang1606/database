CREATE DATABASE your_database;  
USE your_database;              
CREATE TABLE Person (               
    id INT PRIMARY KEY,
    fullname VARCHAR(255),
    job VARCHAR(255),
    salary DECIMAL(10, 2),
    address VARCHAR(255)
);
INSERT INTO Person (id, fullname, job, salary, address)
VALUES
(1, 'Nguyen Van A', 'Manager', 5000.00, '123 Street, Hanoi'),
(2, 'Tran Thi B', 'Developer', 4500.00, '456 Road, Hanoi'),
(3, 'Le Thi C', 'Designer', 4000.00, '789 Alley, Ho Chi Minh City'),
(4, 'Pham Minh D', 'Developer', 4800.00, '101 Lane, Da Nang'),
(5, 'Nguyen Thi E', 'Sales', 3500.00, '202 Road, Hanoi'),
(6, 'Tran Minh F', 'Developer', 5100.00, '303 Street, Ho Chi Minh City'),
(7, 'Le Thi G', 'HR', 3700.00, '404 Alley, Hanoi'),
(8, 'Pham Minh H', 'Manager', 5500.00, '505 Road, Da Nang'),
(9, 'Nguyen Thi I', 'Sales', 3600.00, '606 Lane, Ho Chi Minh City'),
(10, 'Tran Thi J', 'Designer', 4200.00, '707 Street, Hanoi');

select * from Person;