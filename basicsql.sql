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

