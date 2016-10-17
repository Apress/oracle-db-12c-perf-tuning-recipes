select p1 "file#", p2 "block#", p3 "class#"
from v$session_wait
where event = 'direct path read temp';
select relative_fno, owner, segment_name, segment_type
from dba_extents
where file_id = &file
and &block between block_id and block_id + &blocks - 1;
