SELECT
  COUNT(*) AS payment_count
FROM
  transactions as A, transactions as B
WHERE
  A.transaction_timestamp < B.transaction_timestamp
  AND
  EXTRACT (EPOCH FROM B.transaction_timestamp - A.transaction_timestamp)
  /60.0 <= 10.0
  AND
  A.merchant_id = B.merchant_id
  AND
  A.credit_card_id = B.credit_card_id
  AND
  A.amount = B.amount