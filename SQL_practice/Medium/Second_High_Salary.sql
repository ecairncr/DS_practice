-- I have since learned the command "OFFSET", which would 
-- make it much easier

SELECT 
  salary AS second_highest_salary
FROM (SELECT
    name, 
    salary
  FROM employee
  ORDER BY salary DESC
  LIMIT 2) AS top_two
ORDER BY second_highest_salary ASC
LIMIT 1;