select * from (select a.tablespace_name,
sum(a.bytes/1024/1024) allocated_mb
from dba_temp_files a
where a.tablespace_name = upper('&&temp_tsname') group by a.tablespace_name) x,
(select sum(b.bytes_used/1024/1024) used_mb,
sum(b.bytes_free/1024/1024) free_mb
from v$temp_space_header b
where b.tablespace_name=upper('&&temp_tsname') group by b.tablespace_name);
