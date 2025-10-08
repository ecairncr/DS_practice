SELECT
  bucket, COUNT(*) as num
FROM (SELECT
    COUNT(*) AS bucket
  FROM tweets
  WHERE EXTRACT(YEAR FROM tweet_date) = 2022
  GROUP BY user_id) as tweets_counted
GROUP BY bucket