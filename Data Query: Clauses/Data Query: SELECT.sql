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

SELECT *
FROM workspace.baraa.customers;


