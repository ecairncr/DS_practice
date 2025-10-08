SELECT
  user_id,
  EXTRACT (DAY from (MAX(post_date) - MIN(post_date))) as days_between 
FROM posts
WHERE EXTRACT (YEAR from post_date) = 2021
GROUP BY user_id
HAVING COUNT(post_id) > 1;