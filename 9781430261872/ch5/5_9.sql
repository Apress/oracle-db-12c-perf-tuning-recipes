select relative_fno, owner, segment_name, segment_type 
from dba_extents 
where file_id = &file 
and &block between block_id
and block_id + blocks - 1;
select owner, object_name, subobject_name, object_type
from dba_objects
where data_object_id = &row_wait_obj;
