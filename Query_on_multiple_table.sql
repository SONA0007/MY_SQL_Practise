--         https://www.w3resource.com/sql-exercises/sql-exercises-quering-on-multiple-table.php#google_vignette

-- SQL query to find the salespeople and customers who live in the same city.
-- Return customer name, salesperson name and salesperson city.
SELECT c.cust_name, s.name, s.city
FROM salesman s, customer c
WHERE
 s.city  = c.city;

-- SQL query to locate all the customers and the salesperson who works for them.
SELECT c.cust_name, s.name
FROM salesman s, customer c
WHERE
 s.salesman_id  = c.salesman_id;

-- write a SQL query to find those salespeople who generated orders for their customers but are not located in the same city. 
-- Return ord_no, cust_name, customer_id (orders table), salesman_id (orders table).  
SELECT o.ord_no, c.cust_name, o.customer_id, o.salesman_id
FROM salesman s, customer c, orders o
WHERE
    s.city != c.city
 -- you can use s.city <> c.city
and o.customer_id = c.customer_id
and o.salesman_id = s.salesman_id;

--  SQL query to find those customers where each customer has a grade and is served by a salesperson who belongs to a city.
-- Return cust_name as "Customer", grade as "Grade".
SELECT  c.cust_name as "Customer", c.grade as "Grade", o.ord_no as "Order No"
FROM  customer c, orders o, salesman s
WHERE
     c.grade is not null 
and  s.city is not null
and o.customer_id = c.customer_id
and o.salesman_id = s.salesman_id;


-- write a SQL query to find those customers who are served by a salesperson and the salesperson earns commission in the range of 12% to 14% 
-- (Begin and end values are included.). Return cust_name AS "Customer", city AS "City". 

SELECT  c.cust_name as "Customer", s.name, c.city as "City", s.commission
FROM  customer c, salesman s
WHERE
    s.commission between 0.12 and 0.14
and c.salesman_id = s.salesman_id;
-- 
