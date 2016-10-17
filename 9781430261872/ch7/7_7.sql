select a.value, s.username,s.sid,s.serial#,s.program,s.inst_id
from gv$sesstat a,gv$statname b,gv$session s
where a.statistic# = b.statistic# and s.sid=a.sid
and b.name='opened cursors current'



select saddr, sid, user_name, address,hash_value,sql_id, sql_text
from gv$open_cursor
where sid in 
(select sid from v$open_cursor
group by sid having count(*)  > &threshold);
