SELECT
  ROUND(100.0*(COUNT(*) FILTER 
  (WHERE caller.country_id <> receiver.country_id)) 
  / COUNT(*), 1)
  AS international_calls_pct
FROM phone_calls
JOIN phone_info AS caller
  ON phone_calls.caller_id = caller.caller_id
JOIN phone_info AS receiver 
  ON phone_calls.receiver_id = receiver.caller_id