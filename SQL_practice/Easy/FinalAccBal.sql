SELECT
  account_id,
  ((SUM(amount) FILTER(WHERE transaction_type = 'Deposit'))
  - (SUM(amount) FILTER(WHERE transaction_type = 'Withdrawal')))
  as final_balance
FROM transactions
GROUP BY account_id
;