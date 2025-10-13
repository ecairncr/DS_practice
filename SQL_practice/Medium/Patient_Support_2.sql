SELECT
  ROUND(((COUNT(*) FILTER
  (WHERE call_category = 'n/a' OR call_category is NULL)
  ) / (1.0*COUNT(*)))*100, 1)
  AS uncategorised_call_pct
FROM callers