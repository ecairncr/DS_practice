SELECT
  MAX(transaction_date) AS transaction_date,
  user_id,
  COUNT(product_id) as purchase_count
FROM (SELECT
    *,
    RANK() OVER(
      PARTITION BY user_id
      ORDER BY transaction_date DESC) as r
  FROM user_transactions) AS transactions
WHERE r=1
GROUP BY user_id
ORDER BY transaction_date
;