/* ..CREATING DATABASE AS online_store1 */

CREATE DATABASE online_store1;
USE online_store1;

/* 1..creating TABLE custombers ..*/
 
CREATE TABLE customers(
customer_id INT AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(255) NOT NULL,
last_name VARCHAR(255) NOT NULL,
email VARCHAR(100) NOT NULL UNIQUE,
phone VARCHAR(20) NOT NULL UNIQUE,
city VARCHAR(50) NOT NULL
);
INSERT INTO customers( first_name,last_name,email,phone,city) VALUES
('rohit','sharma','rohit.sharma@gmail.com','4563648709','Bengalure'),
('shankar','yadav','shankaryadav@gmail.com','4563648708','Mumbai'),
('ravi','yadav','raviyadav@gmail.com','4563648707','Dehli'),
('rupesh','sah','rupesh@gmail.com','4563648706','Mumbai'),
('jay','sah','jaysah@gmail.com','4563648705','Pune');

SELECT*FROM customers;

/* 2.. creating Table priducts */

CREATE TABLE products(
product_id INT AUTO_INCREMENT PRIMARY KEY,
product_name VARCHAR(100) NOT NULL UNIQUE,
price DECIMAL(10,2) NOT NULL,
stock INT NOT NULL
);
INSERT INTO products (product_name,price,stock) VALUES
('smartphone',25000.00,100),
('laptop',60000.00,50),
('tablets',15000.00,75),
('headphone',2000.00,200),
('smartwatch',12000.00,40);

SELECT*FROM products;

/* 3.. creating TABLE orders */

CREATE TABLE orders(
order_id INT AUTO_INCREMENT PRIMARY KEY,
customer_id INT NOT NULL,
order_date DATE NOT NULL,
FOREIGN KEY(customer_id) REFERENCES customers(customer_id)
);
INSERT INTO orders (customer_id,order_date) VALUES
(1,"2023-01-10"),
(2,"2023-01-12"),
(3,"2023-01-15"),
(4,"2023-01-18"),
(5,"2023-01-22");

SELECT*FROM orders;
/* 4.. creating TABLE order_items */
CREATE TABLE order_items(
order_item INT AUTO_INCREMENT PRIMARY KEY,
order_id INT NOT NULL,
product_id INT NOT NULL,
quantity INT NOT NULL,
FOREIGN KEY(order_id) REFERENCES orders(order_id),
FOREIGN KEY(product_id)REFERENCES products(product_id)
);
INSERT INTO order_items(order_id,product_id,quantity) VALUES
(1,1,1),
(1,2,1),
(2,3,1),
(3,1,1),
(3,2,1),
(3,3,1),
(4,4,1),
(5,5,1);


/*.. adding one more column into custombers table */

INSERT customers(first_name, last_name,email,phone,city) VALUES
("imran","hasmi","imranhasmi@gmail.com", "7698342519","bengalure");

/*.. adding few columns into orders table */

INSERT INTO orders (customer_id,order_date) VALUES
(1,"2023-02-03"),
(1,"2023-03-10"),
(4,"2023-04-12"),
(3,"2023-04-22");

SELECT*FROM orders;

#1 provide an SQL query to retrieve a list of unique custombers who have placed orders
SELECT DISTINCT customer_id FROM orders;

/*... WHERE clause with Coparison operators ..*/

# 2 find all products with price of 15,000
SELECT * FROM  products WHERE price = 15000;

# 3 find all products that do not have a price of 15,000
SELECT*FROM products WHERE price <> 15000;

# 4 find all products with a price greater than 20000
SELECT*FROM products WHERE price >20000;

# 5 find all products with a price less than 20000 
SELECT*FROM products WHERE price < 20000;

# 6 find all products with price greate than or equal to 25000
SELECT * FROM products WHERE price >= 25000;

# 7 find all products with price less than or equal to 25000
SELECT * FROM products WHERE price <= 25000;


/*... WHERE CLAUSE  with logical operator....*/

# 1 Find all products whose price is greater than 15,000 and whose stock is 50 and above 
SELECT product_name, stock FROM products WHERE price >= 15000 and stock >= 50;

# 2 Find all customers from the cities of Mumbai or Dehli
SELECT * FROM customers WHERE city ='Mumbai' OR city = 'Dehli';

# 3 Find all orders that were not placed brtween '2023-01-01' and '2023-03-31'
SELECT * FROM orders WHERE order_date NOT BETWEEN '2023-01-01' AND '2023-03-31';

# 4 Find all orders that were placed brtween '2023-01-01' and '2023-03-31'
SELECT * FROM orders WHERE order_date  BETWEEN '2023-01-01' AND '2023-03-31';

# 5 Find all products in categories with IDs 1,3 and 5
SELECT * FROM products WHERE product_id IN (1,3,5);

/*.... LIKE OPERATOR....*/

# 1  Write a query to display such customer details whose city name starts with D
SELECT * FROM customers WHERE city LIKE 'D%';

 # 2 Write a query to display such customer details whose city name ends with i
 SELECT * FROM customers WHERE city LIKE '%i';
 
 # 3 Write a query to display such customer details whose city name contain exactly 5 characters
 SELECT * FROM customers WHERE city LIKE '_____';
 
 
 


