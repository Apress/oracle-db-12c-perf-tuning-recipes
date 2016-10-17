select event,
sum(wait_time +
time_waited) total_wait_time
from v$active_session_history
where sample_time between
sysdate –15/1440 and sysdate
group by event
order by total_wait_time desc
select s.sid, s.username,
sum(a.wait_time +
a.time_waited) total_wait_time
from v$active_session_history a,
v$session s
where a.sample_time between sysdate – 15/1440 and sysdate
and a.session_id=s.sid
group by s.sid, s.username
order by total_wait_time desc;



select a.user_id,u.username,s.sql_text,
sum(a.wait_time + a.time_waited) total_wait_time
from v$active_session_history a,
v$sqlarea s,
dba_users u
where a.sample_time between sysdate – 15/1440 and sysdate
and a.sql_id = s.sql_id
and a.user_id = u.user_id
group by a.user_id,s.sql_text, u.username
order by 4; 
