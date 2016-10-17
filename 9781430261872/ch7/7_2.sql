select s.sid, s.username, t.used_urec, t.used_ublk
from v$session s, v$transaction t
where s.saddr = t.ses_addr
order by t.used_ublk desc;

select s.sid, t.name, s.value
from v$sesstat s, v$statname t
where s.statistic# = t.statistic#
and t.name = 'undo change vector size'
order by s.value desc;



select sql.sql_text sql_text, t.USED_UREC Records, 
       t.USED_UBLK Blocks,     
       (t.USED_UBLK*8192/1024) KBytes 
from v$transaction t,
v$session s,
v$sql sql
where t.addr = s.taddr
and s.sql_id = sql.sql_id
and s.username ='&USERNAME';



select a.inst_id, a.sid, c.username, c.osuser, c.program, b.name,
a.value, d.used_urec, d.used_ublk
from gv$sesstat a, v$statname b, gv$session c, gv$transaction d
where a.statistic# = b.statistic#
and a.inst_id = c.inst_id
and a.sid = c.sid
and c.inst_id = d.inst_id
and c.saddr = d.ses_addr
and b.name = ‘undo change vector size’
and a.value > 0
order by a.value;
