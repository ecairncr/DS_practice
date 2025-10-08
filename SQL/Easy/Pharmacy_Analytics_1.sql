SELECT 
  drug, (total_sales - cogs) as profit
FROM pharmacy_sales
ORDER BY profit DESC
LIMIT 3;