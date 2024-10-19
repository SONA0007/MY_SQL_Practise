-- qusetion : Basic Select Statement: Exercise-24(w3-resourses) find the details of 1970 Nobel Prize winners.
-- Order the results by subject, ascending except for 'Chemistry' and ‘Economics’ which will come at the end of the result set. 
-- Return year, subject, winner, country, and category. Sample table: nobel_win

-- This query selects all columns from the 'nobel_win' table.
SELECT *
-- Specifies the table from which to retrieve the data (in this case, 'nobel_win').
FROM nobel_win
-- Filters the rows to only include those where the 'year' column has the value 1970.
WHERE year = 1970
-- Orders the result set based on multiple criteria.
ORDER BY
  -- The CASE statement assigns a priority (1 or 0) based on the 'subject' column.
  CASE
    WHEN subject IN ('Economics', 'Chemistry') THEN 1
    ELSE 0
  END ASC,
  -- Orders the result set by 'subject' in ascending order.
  subject,
  -- Orders the result set by 'winner' in ascending order.
  winner;

--  From the following table, write a SQL query to calculate the average price for a manufacturer code of 16. Return avg.  
SELECT AVG(pro_price)
-- Specifies the table from which to retrieve the data (in this case, 'item_mast').
FROM item_mast
-- Filters the rows to only include those where the 'pro_com' column has the value 16.
WHERE pro_com = 16;

-- write a SQL query to find the items whose prices are higher than or equal to $250. Order the result by product price in descending, then product name in ascending. Return pro_name and pro_price.  Sample table: item_mast
SELECT pro_name , pro_price
FROM item_mast
WHERE 
pro_price >= 250
order by 
PRO_PRICE desc,
PRO_NAME ;                       ;

-- to calculate average price of the items for each company. Return average price and company code. Sample table: item_mast
SELECT avg(pro_price) as avg, PRO_COM 
FROM item_mast
group by PRO_COM ;  

--  write a SQL query to find the cheapest item(s). Return pro_name and, pro_price. Sample table: item_mast
SELECT pro_name, pro_price 
FROM item_mast 
WHERE pro_price = (SELECT MIN(pro_price) FROM item_mast);


