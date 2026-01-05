WITH ranked_employees AS (SELECT 
  department_name, salary, name,
  DENSE_RANK() OVER (PARTITION BY department_name ORDER BY salary DESC) AS number
FROM employee
JOIN department
ON employee.department_id = department.department_id
ORDER BY department_name, salary DESC, name)

SELECT
  department_name, name, salary
FROM ranked_employees
WHERE number <4