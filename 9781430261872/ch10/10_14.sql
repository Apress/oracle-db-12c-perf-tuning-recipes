select a.sid, a.serial#, b.spid, b.pid, 
a.username, a.osuser, a.machine
from 
v$session a, 
v$process b
where a.username IS NOT NULL
and a.paddr=b.addr;
