-- write a SQL query that counts the number of unique salespeople. Return number of salespeople.  Sample table: orders
select count(distinct salesman_id) as count from orders;

-- write a  SQL query to determine the number of customers who received at least one grade for their activity.
-- way1
select count(distinct customer_id) as count
from customer
where grade is not null;
-- way2
select counnt(All grade) from customer; 

-- write a SQL query to find the highest grade of the customers in each city. Return city, maximum grade. Sample table: customer
SELECT city, max(grade) as max FROM customer
group by city ;

-- write a SQL query to find the highest purchase amount ordered by each customer. Return customer ID, maximum purchase amount. Sample table: orders
SELECT customer_id, max(purch_amt) as max
FROM orders
group by customer_id
order by customer_id ;

--  write a SQL query to find the highest purchase amount ordered by each customer on a particular date. Return, order date and highest purchase amount.Sample table: orders
SELECT customer_id, ord_date, MAX(purch_amt) 
FROM orders
group by customer_id, ord_date ;

-- -- From the following table, write a SQL query to determine the highest purchase amount made by each salesperson on '2012-08-17'. 
-- Return salesperson ID, purchase amount . Sample table: orders

-- ord_no      purch_amt   ord_date    customer_id  salesman_id
-- ----------  ----------  ----------  -----------  -----------
-- 70001       150.5       2012-10-05  3005         5002
-- 70009       270.65      2012-09-10  3001         5005
-- 70002       65.26       2012-10-05  3002         5001
-- 70004       110.5       2012-08-17  3009         5003
-- 70007       948.5       2012-09-10  3005         5002

SELECT salesman_id,MAX(purch_amt) 
FROM orders
where ord_date ='2012-08-17'
group by salesman_id, ord_date ;

-- write a SQL query to find the highest order (purchase) amount by each customer on a particular order date. Filter the result by highest order (purchase) amount above 2000.00. 
-- Return customer id, order date and maximum purchase amount. Sample table: orders
SELECT customer_id, ord_date,MAX(purch_amt) 
FROM orders
group by customer_id, ord_date
HAVING MAX(purch_amt) > 2000.00;

--  write a SQL query to count the number of salespeople in a city. Return number of salespeople.Sample table: salesman

SELECT count(*) from
salesman where
city is not null;

-- write a SQL query to count the number of employees in each department. Return department code and number of employees.Sample table: emp_details

SELECT EMP_DEPT, count(EMP_IDNO)  from
emp_details
group by EMP_DEPT  ;
