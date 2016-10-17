select row_wait_obj# 
from v$session 
where event = 'buffer busy waits';

select owner, object_name, subobject_name, object_type
from dba_objects
where object_id = &row_wait_obj;
select sql_id from v$session
where sid in (SELECT sid FROM v$session_wait WHERE event = 'buffer
              busy waits');
SELECT sql_text FROM v$sqlarea WHERE sql_id = <sql_id>;
