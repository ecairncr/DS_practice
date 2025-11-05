SELECT
  sender_id,
  COUNT(*) as message_count
FROM messages
WHERE EXTRACT(YEAR from sent_date) =2022
  AND EXTRACT(MONTH from sent_date) =8
GROUP BY sender_id
ORDER BY message_count DESC
LIMIT 2