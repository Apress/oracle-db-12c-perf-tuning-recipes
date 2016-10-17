select sum(d.bytes) "undo"
from v$datafile d,
v$tablespace t,
dba_tablespaces s
where s.contents = 'UNDO'
and s.status = 'ONLINE'
and t.name = s.tablespace_name
and d.ts# = t.ts#;



select d.undo_size/(1024*1024) "Current UNDO SIZE",
   SUBSTR(e.value,1,25) "UNDO RETENTION",
   (to_number(e.value) * to_number(f.value) *
   g.undo_block_per_sec) / (1024*1024) 
  "Necessary UNDO SIZE"
 from (
   select sum(a.bytes) undo_size
     from v$datafile a,
          v$tablespace b,
         dba_tablespaces c
   where c.contents = 'UNDO'
     and c.status = 'ONLINE'
     and b.name = c.tablespace_name
     and a.ts# = b.ts#
  ) d,
 v$parameter e,
  v$parameter f,
  (
  Select max(undoblks/((end_time-begin_time)*3600*24))
    undo_block_per_sec
    from v$undostat
  ) g
where e.name = 'undo_retention'
and f.name = 'db_block_size';



select to_char(begin_time,'hh24:mi:ss') BEGIN_TIME,
to_char(end_time,'hh24:mi:ss') END_TIME,
maxquerylen,nospaceerrcnt,tuned_undoretention
from v$undostat;

