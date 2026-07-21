-- Databricks notebook source
-- MAGIC %md
-- MAGIC **SQL QUERY: Clauses**
-- MAGIC - Coding Order:
-- MAGIC 1. SELECT DISTINCT 
-- MAGIC (sum)b.col
-- MAGIC 2. FROM Table1 AS a 
-- MAGIC 3. JOIN Table2 AS b
-- MAGIC ON a.id =b.id
-- MAGIC 4. WHERE a.col=10 
-- MAGIC 5. GROUP BY a.col
-- MAGIC 6. HAVING SUM(b.col)
-- MAGIC 7. ORDER BY a.col
-- MAGIC 8. LIMIT or TOP 2
-- MAGIC
-- MAGIC
-- MAGIC - Execution Order:
-- MAGIC 1. FROM 
-- MAGIC 2. JOIN
-- MAGIC 3. WHERE
-- MAGIC 4. GROUP BY 
-- MAGIC 5. HAVING
-- MAGIC 6. SELECT DISTINCT
-- MAGIC 7. ORDER BY 
-- MAGIC 8. LIMIT/ TOP 2
-- MAGIC
-- MAGIC

-- COMMAND ----------

-- DBTITLE 1,Retrive All Customer Data
SELECT *
FROM workspace.baraa.customers;


-- COMMAND ----------

-- DBTITLE 1,Retrieve All Order Data
SELECT * 
FROM workspace.baraa.orders

-- COMMAND ----------

-- DBTITLE 1,Specific Columns: Retrieve Each Customers's Name, country, score
SELECT 
        first_name,
        country, 
        score
FROM workspace.baraa.customers;

-- COMMAND ----------

-- DBTITLE 1,WHERE Clause: Retrieve customers with A score Not equal to 0
SELECT *
FROM workspace.baraa.customers
WHERE score <> 0 -- you can also use =!

-- COMMAND ----------

-- DBTITLE 1,Retrieve Customers From Germany
SELECT * 
FROM workspace.baraa.customers
WHERE Country = 'Germany';

-- COMMAND ----------

-- DBTITLE 1,ORDER BY:(Sorting).....Retrieve All customers and sort the results by the highest score first.
SELECT *
FROM workspace.baraa.customers
ORDER BY score DESC;

--Lowest Score first 
SELECT *
FROM workspace.baraa.customers
ORDER BY score ASC;


-- COMMAND ----------

-- DBTITLE 1,Nested Sorting: Retrive All Customers and sort the results by the country and then by the highest score
--Nested Sorting(Sort the data using multiple Columns), the first column takes the first priority


--Checking 

/*
SELECT *
FROM workspace.baraa.customers
ORDER BY 
    Country ASC;
*/

SELECT *
FROM workspace.baraa.customers
ORDER BY 
    Country ASC, 
    score DESC;

-- COMMAND ----------

-- DBTITLE 1,GROUP BY: Find the total score for each country
/*
Combines rows with the same value
Aggregates a column by another column
One row for reach value
Comes after the where clause
*/

SELECT 
    country,
    SUM(score) as Total_Score
FROM workspace.baraa.customers
GROUP BY country;

/*
SELECT 
    country,
    first_name,
    SUM(score) as Total_Score
FROM workspace.baraa.customers
GROUP BY country, first_name;
*/

--====================Find the total score and total number of customers for each country====================

SELECT 
    country, 
    SUM(score) AS Total_score,
    COUNT(id) AS Total_customers
 FROM workspace.baraa.customers
 GROUP BY country;

-- COMMAND ----------

-- DBTITLE 1,HAVING Clause:
/*Filters data after aggreggation 
We can use it only after the GROUP BY
we use the aggredated column on having
comes after grouo by 
*/

--==========================================================================================
/*
 Calculate the average score for each country 
   considering only customers with a score not equal to 0
   and return only those countries with an average score greater than 430
   and sort the results by the highest average score first.
*/

SELECT 
    id,
    country, 
    AVG(score) AS Average_Score
FROM workspace.baraa.customers
WHERE score <> 0
GROUP BY country
HAVING Average_Score > 430
ORDER BY Average_Score DESC


-- COMMAND ----------

-- DBTITLE 1,DISTINCT
--Removes duplicates in the data 

--Return unique list of all countries 
SELECT DISTINCT country 
FROM workspace.baraa.customers

-- COMMAND ----------

-- DBTITLE 1,LIMIT/TOP
--Limits the number of rows you want to return 

--Retrieve only 3 customers with the higest scores
SELECT *
FROM workspace.baraa.customers
ORDER BY score DESC
LIMIT 3;

--Get the two most recent orders
SELECT * 
FROM workspace.baraa.orders
ORDER BY order_date DESC
LIMIT 2
