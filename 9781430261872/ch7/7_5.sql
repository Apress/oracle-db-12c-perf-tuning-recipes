select se.sid, se.username,
su.blocks * ts.block_size / 1024 / 1024 mb_used, su.tablespace,
su.sqladdr address, sq.hash_value, sq.sql_text
from v$sort_usage su, v$session se, v$sqlarea sq, dba_tablespaces ts
where su.session_addr = se.saddr
and su.sqladdr = sq.address (+)
and su.tablespace = ts.tablespace_name;
     
	 

select se.sid,
se.username, se.osuser, pr.spid,
se.module,se.program, 
sum (su.blocks) * ts.block_size / 1024 / 1024 mb_used, su.tablespace,
count(*) sorts
from v$sort_usage su, v$session se, dba_tablespaces ts, v$process pr
where su.session_addr = se.saddr
and se.paddr = pr.addr
and su.tablespace = ts.tablespace_name
group by se.sid, se.serial#, se.username, se.osuser, pr.spid, se.module,
se.program, ts.block_size, su.tablespace;
