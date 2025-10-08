SELECT
  unique_queries,
  COUNT(employee_id) as employee_count
FROM (SELECT 
    employees.employee_id,
    COALESCE(COUNT(queries.query_id),0) as unique_queries
  FROM employees 
  LEFT JOIN queries
    ON employees.employee_id = queries.employee_id
    AND EXTRACT(MONTH from queries.query_starttime) <= 9
    AND EXTRACT(MONTH from queries.query_starttime) >= 7
  GROUP BY employees.employee_id) as query_sum
GROUP BY unique_queries
ORDER BY unique_queries
