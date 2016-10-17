SELECT channel_id
FROM channels
INTERSECT
SELECT channel_id
FROM costs;

