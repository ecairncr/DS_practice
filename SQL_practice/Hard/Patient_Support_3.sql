-- Imperfect solution I tried without using LAG or INTERVAL
-- (only correct up to the hour)

SELECT 
  COUNT(DISTINCT c1.policy_holder_id) AS policy_holder_count
FROM callers as c1
INNER JOIN callers as c2
  ON c1.policy_holder_id = c2.policy_holder_id
WHERE (DATE_PART('day', c1.call_date-c2.call_date) < 7
  OR (DATE_PART('day', c1.call_date-c2.call_date) = 7
  AND DATE_PART('hour', c1.call_date) < DATE_PART('hour', c2.call_date)))
  AND DATE_PART('day', c1.call_date-c2.call_date) > 0

-- Better solution with LAG and EPOCH

SELECT 
  COUNT(DISTINCT policy_holder_id) AS policy_holder_count
FROM (SELECT
    policy_holder_count,
    EXTRACT(EPOCH FROM
      call_date - LAG(call_date) OVER(
      PARTITION BY policy_holder_id ORDER BY call_date)
    ) AS diff
  FROM callers
  ) AS callers_diff
WHERE diff <= 7*24*60*60