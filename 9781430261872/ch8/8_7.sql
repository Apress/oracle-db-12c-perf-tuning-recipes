SELECT channel_id FROM channels;

SELECT DISTINCT channel_id FROM costs
ORDER BY channel_id;

SELECT channel_id
FROM channels
MINUS
SELECT channel_id
FROM costs;

SELECT channel_id, channel_desc FROM channels
WHERE channel_id IN
(SELECT channel_id
FROM channels
MINUS
SELECT channel_id
FROM costs);

SELECT channel_id
FROM channels
MINUS
SELECT channel_id
FROM costs;

select h.channel_id
from costs o right join channels h
on o.channel_id = h.channel_id
Where o.channel_id is null and o.cost is null;

