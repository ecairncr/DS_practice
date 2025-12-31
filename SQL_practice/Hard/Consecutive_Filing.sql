WITH filed_taxes_lag AS (
  SELECT user_id,
    EXTRACT(YEAR from filing_date) AS y,
    product,
    LAG(EXTRACT(YEAR from filing_date), 1, 0) OVER(
      PARTITION BY user_id
      ORDER BY filing_date) last_year,
    LAG(product, 1, 'none') OVER(
      PARTITION BY user_id
      ORDER BY filing_date) product_last_year ,
    LAG(EXTRACT(YEAR from filing_date), 2, 0) OVER(
      PARTITION BY user_id
      ORDER BY filing_date) two_years_ago,
    LAG(product, 2, 'none') OVER(
      PARTITION BY user_id
      ORDER BY filing_date) product_2_years_ago
  FROM filed_taxes
)

SELECT
  DISTINCT user_id
FROM filed_taxes_lag
WHERE product LIKE 'TurboTax%'
  AND product_last_year LIKE 'TurboTax%'
  AND product_2_years_ago LIKE 'TurboTax%'
  AND last_year = y - 1
  AND two_years_ago = y - 2
ORDER BY user_id ASC