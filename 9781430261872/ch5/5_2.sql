select ash.user_id,
u.username,
s.sql_text,
sum(ash.wait_time +
ash.time_waited) ttl_wait_time
from v$active_session_history ash,
v$sqlarea s,
dba_users u
where ash.sample_time between sysdate - 60/2880 and sysdate
and ash.sql_id = s.sql_id
and ash.user_id = u.user_id
group by ash.user_id,s.sql_text, u.username
order by ttl_wait_time
