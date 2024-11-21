https://www.w3resource.com/sql-exercises/subqueries/index.php

-- 1. write a  SQL query to find all the orders issued by the salesman 'Paul Adam'. Return ord_no, purch_amt, ord_date, customer_id and salesman_id.
--  USING subquery
SELECT *
FROM orders o 
WHERE salesman_id IN
  (SELECT salesman_id From salesman 
   where name = 'Paul Adam');
-- USING JOIN
SELECT *
FROM orders o 
Inner JOIN salesman s
ON o.salesman_id = s.salesman_id
WHERE s.name = 'Paul Adam';

--2.  write a SQL query to find all orders generated by London-based salespeople. Return ord_no, purch_amt, ord_date, customer_id, salesman_id.
SELECT * FROM orders  
WHERE salesman_id IN  
   (select salesman_id from salesman where city = 'London'); 
-- you can solve it using join also but subquery is generally used to findvalues from one table to filter another table.

-- 3. a SQL query to find all orders generated by the salespeople who may work for customers whose id is 3007. Return ord_no, purch_amt, ord_date, customer_id, salesman_id.
--  it is saying may work  so o/p is
ord_no	purch_amt	ord_date	customer_id	salesman_id
70002	65.26		2012-10-05	3002		5001
70005	2400.60		2012-07-27	3007		5001
70008	5760.00		2012-09-10	3002		5001
70013	3045.60		2012-04-25	3002		5001
SELECT * FROM orders  
WHERE  salesman_id =  
   (select DISTINCT salesman_id 
    from orders 
    where customer_id = 3007);


-- 4. SQL query to find the order values greater than the average order value of 10th October 2012. Return ord_no, purch_amt, ord_date, customer_id, salesman_id.
SELECT * FROM orders  
WHERE purch_amt >  
   (select AVG(purch_amt) 
    from orders 
    where ord_date = '2012-10-10');

--6. From the following tables write a SQL query to determine the commission of the salespeople in Paris. Return commission.
SELECT commission FROM salesman  
WHERE salesman_id =  
   (select salesman_id
    from customer 
    where city = 'Paris');

-- 7. Write a query to display all the customers whose ID is 2001 below the salesperson ID of Mc Lyon.
SELECT * FROM customer  
WHERE  customer_id =  
   (select salesman_id - 2001
    from salesman 
    where name = 'Mc Lyon');

  --8 write a  SQL query to count the number of customers with grades above the average in New York City. Return grade and count. 
SELECT grade, COUNT(*)
FROM customer
GROUP BY grade
HAVING grade >
    (SELECT AVG(grade)
     FROM customer
     WHERE city = 'New York');

-- 9.write a  SQL query to find those salespeople who earned the maximum commission. Return ord_no, purch_amt, ord_date, and salesman_id.
SELECT *
FROM orders 
WHERE salesman_id IN
(select salesman_id FROM salesman 
 where commission = 
       (SELECT MAX(commission)
        FROM salesman ) );
-- NESTED QUERY

--10.  to find the customers who placed orders on 17th August 2012. Return ord_no, purch_amt, ord_date, customer_id, salesman_id and cust_name.
SELECT O.*, C.cust_name
FROM orders O, customer C 
where
    O.customer_id = C.customer_id
and O.ord_date = '2012-08-17' ;
  
-- 11. write a SQL query to find salespeople who had more than one customer. Return salesman_id and name.
SELECT s.salesman_id, s.name 
from salesman s 
where (SELECT COUNT(*) FROM customer 
       where 
       salesman_id = s.salesman_id) > 1

-- query to find those orders, which are higher than the average amount of the orders. Return ord_no, purch_amt, ord_date, customer_id and salesman_id.
SELECT * from orders o1
where o1.purch_amt > 
  (select AVG(purch_amt) from orders o2 
  where o1.customer_id = o2.customer_id)

--  find those orders that are equal or higher than the average amount of the orders.
SELECT * from orders o1
where purch_amt >= (select AVG(purch_amt) from orders o2where o1.customer_id = o2.customer_id)

--  find the sums of the amounts from the orders table, grouped by date, and eliminate all dates where the sum was not at least 1000.00 above the maximum order amount for that date.
SELECT ord_date, sum(purch_amt)
from orders a
GROUP BY ord_date
HAVING SUM(purch_amt) > 
  (  select MAX(purch_amt)+1000 
    from orders b
    WHERE a.ord_date = b.ord_date);
