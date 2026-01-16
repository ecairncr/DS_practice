SELECT
  E.employee_id AS employee_id,
  E.name AS employee_name
FROM employee E, employee M
WHERE E.manager_id = M.employee_id
  AND E.salary > M.salary