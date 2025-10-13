-- Were I to write this code again, I would consider using
-- UNION ALL to combine the datasets instead of using
-- COALESCE and FULL JOIN, which seem over the top

SELECT 
  COALESCE(old.user_id, new.user_id) AS user_id,
  COALESCE(old.song_id, new.song_id) AS song_id,
  COALESCE(old.song_plays, 0) + COALESCE(new.song_plays, 0) as song_plays
FROM songs_history AS old
FULL JOIN (SELECT
      user_id,
      song_id,
      COUNT(listen_time) AS song_plays
    FROM songs_weekly
    WHERE EXTRACT(DAY FROM listen_time) <= 4
    GROUP BY user_id, song_id
  ) AS new
  ON old.user_id = new.user_id
  AND old.song_id = new.song_id
ORDER BY song_plays DESC