select lpad(' ',decode(l.xidusn,0,3,0)) || l.oracle_username "User",
o.owner, o.object_name, o.object_type
from v$locked_object l, dba_objects o
where l.object_id = o.object_id
order by o.object_id, 1 desc;
