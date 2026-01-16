SELECT 
  ROUND(SUM(CASE WHEN texts.signup_action='Confirmed' THEN 1 END) * 1.0
  / COUNT(DISTINCT emails.email_id)
  ,2) AS confirm_rate
FROM emails
LEFT JOIN texts ON emails.email_id = texts.email_id