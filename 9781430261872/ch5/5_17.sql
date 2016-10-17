select to_char(h.sample_time, 'HH24:MI:SS') TIME,ash.session_id,
decode(ash.session_state, 'WAITING' ,ash.event, ash.session_state) STATE,     
ash.sql_id,
ash.blocking_session BLOCKER
from v$active_session_history ash, dba_users du
where du.user_id = ash.user_id;
