SELECT
  user_id,
  spend,
  transaction_date
FROM (SELECT *,
      ROW_NUMBER() OVER (
        PARTITION BY user_id
        ORDER BY transaction_date
      ) as rownum
    FROM transactions
) AS transaction_date_numbered
WHERE rownum = 3;