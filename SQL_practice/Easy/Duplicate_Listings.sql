SELECT
  COUNT(DISTINCT company_id) AS duplicate_companies
FROM (SELECT
  company_id, COUNT(*) AS job_count
FROM job_listings
GROUP BY company_id, title, description) AS job_counts
WHERE job_count > 1;