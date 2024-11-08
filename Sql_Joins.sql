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

-- 
