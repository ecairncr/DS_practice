SELECT *
FROM (SELECT DISTINCT ON (card_name)
    card_name,
    issued_amount
  FROM monthly_cards_issued
  ORDER BY card_name, issue_year, issue_month) AS reduced
ORDER BY issued_amount DESC
;