https://www.w3resource.com/sql-exercises/sql-joins-exercises.php

-- From the following tables write a SQL query to find the salesperson(s) and the customer(s) he represents. 
-- Return Customer Name, city, Salesman, commission.
SELECT c.cust_name AS "Customer Name", c.city, s.name AS "Salesman", s.commission 
FROM customer c 
INNER JOIN salesman s
ON c.salesman_id = s.salesman_id; 

-- FROM customer c , salesman s | logig : Query on multiple tables
-- where 
-- c.salesman_id = s.salesman_id; answer will be same in both case 

-- SQL query to find salespeople who received commissions of more than 12 percent from the company. Return Customer Name, customer city, Salesman, commission. 
SELECT c.cust_name AS "Customer Name", c.city, s.name AS "Salesman", s.commission 
FROM customer c 
JOIN salesman s
ON c.salesman_id = s.salesman_id
where s.commission > 0.12;

-- SQL query to locate those salespeople who do not live in the same city where their customers live 
-- and have received a commission of more than 12% from the company. Return Customer Name, customer city, Salesman, salesman city, commission. 
SELECT c.cust_name AS "Customer Name", c.city, s.name AS "Salesman", s.city, s.commission 
FROM customer c 
INNER JOIN salesman s
ON c.salesman_id = s.salesman_id
where s.commission > 0.12
AND s.city <> c.city  ;

--  SQL query to find the details of an order. Return ord_no, ord_date, purch_amt, Customer Name, grade, Salesman, commission. 
SELECT o.ord_no , o.purch_amt, o.ord_date, c.cust_name, c.grade, s.name, s.commission     
FROM orders o
INNER JOIN customer c ON 
     o.customer_id = c.customer_id
INNER JOIN salesman s ON 
     s.salesman_id = o.salesman_id  ;

-- Write a SQL statement to join the tables salesman, customer and orders so that the same column of each table appears 
-- once and only the relational rows are returned. 
SELECT * FROM orders 
     NATURAL JOIN customer 
     NATURAL JOIN salesman;

-- write a SQL query to display the customer name, customer city, grade, salesman, salesman city. The results should be sorted by ascending customer_id.  
SELECT c.cust_name, c.grade, c.city as "Cust city", s.name, s.city as "Saleman City"    
FROM  customer c 
Left JOIN salesman s ON 
     s.salesman_id = c.salesman_id 
ORDER BY c.customer_id asc;

-- write a SQL query to find those customers with a grade less than 300. Return cust_name, customer city, grade, Salesman, salesmancity.
-- The result should be ordered by ascending customer_id. 
SELECT C.cust_name , C.city, C.grade, S.name, S.city
FROM customer C 
LEFT JOIN salesman S ON 
C.salesman_id = S.salesman_id
WHERE 
C.GRADE < 300 
ORDER BY C.customer_id;

--  Write a SQL statement to make a report with customer name, city, order number, order date, 
-- and order amount in ascending order according to the order date to determinewhether any of the existing customers have placed an order or not.

SELECT C.cust_name , C.city, o.ord_no, o.ord_date, o.purch_amt
FROM orders o
LEFT JOIN customer C ON 
o.customer_id = c.customer_id 
ORDER BY o.ord_date;
-- t is using a LEFT OUTER JOIN which will retrieve all records from the left table and the matching records from the right table. 
-- If no match is found on the right table, it will return NULL for the right table's fields.


-- 
