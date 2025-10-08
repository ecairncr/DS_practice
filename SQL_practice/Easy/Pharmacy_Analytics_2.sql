SELECT
  manufacturer,
  COUNT(*) AS drug_count,
  SUM(drug_loss) AS total_loss
FROM (
  SELECT 
    manufacturer, (cogs - total_sales) AS drug_loss
  FROM pharmacy_sales
  WHERE cogs > total_sales
) as losses
GROUP BY manufacturer
ORDER BY total_loss DESC;

-- Can be done shorter