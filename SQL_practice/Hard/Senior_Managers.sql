SELECT
  B.manager_name AS manager_name,
  COUNT(DISTINCT A.manager_id) AS direct_reportees
FROM employees AS A, employees AS B, employees AS C
WHERE A.manager_id = B.emp_id
  AND B.manager_id = C.emp_id
GROUP BY B.manager_name
ORDER BY direct_reportees DESC

