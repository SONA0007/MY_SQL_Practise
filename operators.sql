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

-- find the details of those salespeople whose names begin with ‘N’ and the fourth character is 'l'. Rests may be any character. Return salesman_id, name, city, commission
SELECT * FROM 
salesman 
where
name LIKE 'N__l%'; 

-- write a SQL query to find those rows where col1 contains the escape character underscore ( _ ). Return col1.
-- Sample table: testtable
-- col1
-- --------------------------
-- A001/DJ-402\44_/100/2015
-- A001_\DJ-402\44_/100/2015
-- A001_DJ-402-2014-2015
-- A002_DJ-401-2014-2015

SELECT * FROM testtable 
where
col1 LIKE '%_%'; 
-- find those rows where col1 contains the string ( _/ ).
SELECT * FROM testtable 
where
col1 not LIKE '%/%'; 

-- find those rows where col1 does not contain the string ( _/ ). Return col1.
SELECT * FROM testtable 
where
col1 NOT LIKE '%/_//%' escape '/' ;  

-- find those rows where col1 contains the character percent ( % ).
SELECT * FROM  testtable 
where
col1  LIKE '%/%%' escape '/' ; 

-- write a SQL query to locate all customers with a grade value. 
SELECT * FROM customer  
where
grade is null ; 
