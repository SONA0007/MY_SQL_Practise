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


--  to generate a report with customer name, city, order number, order date, order amount, salesperson name, and commission
-- to determine if any of the existing customers have not placed orders or if they have placed orders through their salesman or by themselves.
-- Selecting specific columns and renaming one column for clarity

-- Performing a left outer join based on the customer_id, including unmatched rows from 'customer'
-- Performing another left outer join with the result of the previous join and the 'salesman' table based on salesman_id
SELECT C.cust_name , C.city, o.ord_no, o.ord_date, o.purch_amt, s.name, s.commission
FROM orders o
LEFT JOIN customer C ON 
o.customer_id = c.customer_id 
LEFT JOIN salesman s ON 
o.salesman_id = s.salesman_id ;

--  Write a SQL statement to generate a list in ascending order of salespersons 
-- who work either for one or more customers or have not yet joined any of the customers.

SELECT  s.name, c.cust_name
FROM customer C 
Right JOIN salesman s ON 
c.salesman_id = s.salesman_id ;
-- This query will select all the rows from the salesman table and any matching rows from the customer table and returning the results in the order of salesman_id. 
-- If there is no match, it will return NULL for the non-matching columns of customer table.

-- write a  SQL query to list all salespersons along with customer name, city, grade, order number, date, and amount. Condition for selecting 
-- list of salesmen : 1. Salesmen who works for one or more customer or, 2. Salesmen who not yet join under any customer
-- , Condition for selecting list of customer : 3. placed one or more orders, or 4. no order placed to their salesman.

SELECT C.cust_name , C.city, C.grade, o.ord_no, o.ord_date, o.purch_amt, s.name, s.commission
FROM orders o
Right JOIN customer C ON 
o.customer_id = c.customer_id 
right JOIN salesman s ON 
o.salesman_id = s.salesman_id ;
-- First, it performs a right outer join on the customer table and the salesman table using the 'salesman_id' column.
-- Then it performs another right outer join on the result of the first join and the orders table using the 'customer_id' column.
-- It is then selecting the 'cust_name', 'city', 'grade', 'name' as 'Salesman', 'ord_no', 'ord_date', and 'purch_amt' columns from the three tables.
-- This query will select all the rows from orders table and any matching rows from customer table and salesman table. 
-- If there is no match, it will return NULL for the non-matching columns of customer table and salesman table.


-- Write a  SQL statement to make a list for the salesmen who either work for one or more customers or yet to join any of the customer.
-- The customer, may have placed, either one or more orders on or above order amount 2000 and must have a grade,
-- or he may not have placed any order to the associated supplier.

SELECT c.cust_name , c.city, c.grade, o.ord_no, o.ord_date, o.purch_amt, s.name

FROM customer c

Right outer JOIN salesman s
 ON s.salesman_id = c.salesman_id

Left outer JOIN orders o 
 ON c.customer_id = o.customer_id 

where o.purch_amt >= 2000
And c.grade is not null;

--  Write a SQL statement to generate a report with the customer name, city, order no. order date, purchase amount for only those customers on the list
-- who must have a grade and placed one or more orders or which order(s) have been placed by the customer who neither is on the list nor has a grade.
SELECT c.cust_name , c.city, c.grade, o.ord_no, o.ord_date, o.purch_amt
FROM customer c
Left outer JOIN orders o 
 ON c.customer_id = o.customer_id ;

-- Write a SQL query to combine each row of the salesman table with each row of the customer table.
SELECT * FROM salesman a CROSS JOIN customer b;

-- Write a  SQL statement to create a Cartesian product between salesperson and customer,
-- i.e. each salesperson will appear for all customers and vice versa for that salesperson who belongs to that city.
SELECT * FROM salesman a 
     CROSS JOIN customer b WHERE a.city IS NOT NULL;

-- Write a SQL statement to make a Cartesian product between salesman and customer i.e. each salesman will appear for all customers and vice versa for those salesmen
-- who must belong to a city which is not the same as his customer and the customers should have their own grade.
SELECT * FROM salesman s
     CROSS JOIN customer c
WHERE c.city is not null
     and c.city <> s.city
     and c.grade is not null;

-- From the following tables write a SQL query to calculate the average price of items of each company. Return average value and company name.
SELECT AVG(pro_price), c.com_name 
FROM 
item_mast i
 INNER JOIN company_mast c
 ON i.pro_com = C.com_id
GROUP BY c.com_name;

--  to calculate and find the average price of items of each company higher than or equal to Rs. 350. Return average value and company name.
SELECT AVG(i.pro_price), c.com_name 
FROM 
item_mast i
 INNER JOIN company_mast c
 ON i.pro_com = C.com_id
GROUP BY c.com_name
having AVG(i.pro_price) >= 350;

-- From the following tables write a SQL query to find the most expensive product of each company. Return pro_name, pro_price and com_name.

SELECT A.pro_name, A.pro_price, F.com_name 
FROM item_mast A INNER JOIN 
  company_mast F 
  ON A.pro_com = F.com_id 
  AND 
  A.pro_price = ( 
  SELECT 
  MAX(A.pro_price) FROM item_mast A 
  WHERE A.pro_com = F.com_id 
);

--  From the following tables write a SQL query to find the names of departments where more than two employees are employed. Return dpt_name.
SELECT emp_department.dpt_name 
FROM emp_details 
INNER JOIN emp_department 
 ON emp_dept =dpt_code 
GROUP BY emp_department.dpt_name HAVING COUNT(*) > 2;
