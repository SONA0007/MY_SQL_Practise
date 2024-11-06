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
and o.customer_id = c.customer_id
and o.salesman_id = s.salesman_id;
