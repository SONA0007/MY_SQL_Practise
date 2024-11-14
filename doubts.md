### 1.how the concept of subquery work, where should we use it ? how to use it ?
 
1. How Subqueries Work
- A subquery is often executed first, and its result is then passed to the outer query.
- Subqueries can be used in various SQL clauses like SELECT, FROM, WHERE, and HAVING, and they are usually enclosed in parentheses.
       
2. When to Use Subqueries
Subqueries are useful for:
- Filtering results based on calculations.
- Using aggregated data from one query within another.
- Finding values from one table to filter another table.
- Handling situations where joins can’t directly be applied.
  
3. Types of Subqueries
- Single-row subquery: Returns a single row (e.g., used with comparison operators like =, <, etc.).
- Multiple-row subquery: Returns multiple rows (e.g., used with IN, ANY, ALL).
- Correlated subquery: Refers to columns in the outer query and is re-evaluated for each row in the outer query.
   Non-correlated subquery: Operates independently of the outer query

### 2.how to decide whether to use join or subquery ?
1. Use a JOIN when:
-  You need to retrieve related columns from multiple tables in a single result set.
-  You are looking to combine rows from two or more tables based on a common column.
-  The query benefits from having all data in a single, straightforward query.
2.  Use a Subquery when: 
-  You need to filter data from one table based on aggregate functions (e.g., MAX, MIN, AVG) calculated in another table.
-  You only need one piece of data from another table (e.g., specific IDs, max value, etc.) to filter or compare against your main table.
-  The subquery result is meant for a filter condition rather than a direct table join.
