-- An unnecessary number of subqueries, but was the most
-- intuitive solution to me with readable code

SELECT yr, mth,
  ROUND(100.0*long_calls / 
  LAG(long_calls) OVER(PARTITION BY yr ORDER BY mth)
  , 1) - 100.0 AS long_calls_growth_pct
FROM (SELECT yr, mth,
    COUNT(case_id) AS long_calls 
  FROM (SELECT
      case_id,
      EXTRACT(YEAR FROM call_date) AS yr,
      EXTRACT(MONTH FROM call_date) AS mth
    FROM callers
    WHERE call_duration_secs > 300
    ) AS callers_cleaned
  GROUP BY yr, mth
  ) AS callers_sum
ORDER BY yr, mth

