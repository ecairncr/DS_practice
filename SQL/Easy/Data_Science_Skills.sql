SELECT p.candidate_id
FROM (SELECT
  candidate_id
FROM candidates
WHERE skill = 'Python') as p
JOIN (SELECT
  candidate_id
FROM candidates
WHERE skill = 'Tableau') as t ON p.candidate_id = t.candidate_id
JOIN (SELECT
  candidate_id
FROM candidates
WHERE skill = 'PostgreSQL') as s ON p.candidate_id = s.candidate_id

-- This does not perform well. Better to not use joins at all.