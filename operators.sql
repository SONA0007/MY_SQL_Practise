-- From the following table, write a  SQL query to find details of all orders excluding those with ord_date equal to '2012-09-10' and salesman_id higher than 5005 or purch_amt greater than 1000.Return ord_no, purch_amt, ord_date, customer_id and salesman_id.

SELECT * FROM 
orders 
where 
Not (ord_date = '2012-09-10' 
And  salesman_id > 5005) 
or   purch_amt > 1000;              

-- 10. Write a SQL query that displays order number, purchase amount, and the achieved and unachieved percentage (%) for those orders that exceed 50% of the target value of 6000.  

SELECT ord_no, purch_amt,
(100 * purch_amt) / 6000 AS "Achieved %", 

(100 * (6000 - purch_amt) / 6000) AS "Unachieved %"

FROM orders 
WHERE (100 * purch_amt) / 6000 > 50;

-- 11. From the following table, write a SQL query to find the details of all employees whose last name is ‘Dosni’ or ‘Mardy’. Return emp_idno, emp_fname, emp_lname, and emp_dept. 
SELECT * FROM  emp_details
WHERE 
EMP_LNAME ='Dosni' or EMP_LNAME='Mardy';

-- write a  SQL query to select orders between 500 and 4000 (begin and end values are included). Exclude orders amount 948.50 and 1983.43. Return ord_no, purch_amt, ord_date, customer_id, and salesman_id. Sample table: orders
SELECT * FROM 
ORDERS
where
   (purch_amt BETWEEN 500 AND 4000)
AND 
   purch_amt NOT IN (948.50, 1983.43); 

-- Retrieve the details of the salespeople whose names begin with any letter between 'A' and 'L' (not inclusive). Return salesman_id, name, city, commission. 
SELECT * FROM 
SALESMAN 
where
   NAME BETWEEN 'A' AND 'L'; 
