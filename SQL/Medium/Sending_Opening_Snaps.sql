SELECT
  age_breakdown.age_bucket,
  ROUND(100.0 * SUM(time_spent) FILTER(WHERE activity_type='send') 
    / SUM(time_spent) FILTER(WHERE activity_type='send' OR activity_type='open'), 2)
    AS send_perc,
  ROUND(100.0 * SUM(time_spent) FILTER(WHERE activity_type='open')
    / SUM(time_spent) FILTER(WHERE activity_type='send' OR activity_type='open'), 2)
    AS open_perc
FROM activities
JOIN age_breakdown ON activities.user_id = age_breakdown.user_id
GROUP BY age_bucket