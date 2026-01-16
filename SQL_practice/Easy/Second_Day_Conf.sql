SELECT
  emails.user_id
FROM emails
JOIN texts ON emails.email_id = texts.email_id
WHERE texts.signup_action = 'Confirmed'
  AND EXTRACT(DAY from (texts.action_date - emails.signup_date)) = 1