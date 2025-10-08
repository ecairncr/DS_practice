SELECT COUNT(*)
FROM (SELECT
  COUNT(*) as num_calls
FROM callers
GROUP BY policy_holder_id) as total_num_calls
WHERE num_calls > 2