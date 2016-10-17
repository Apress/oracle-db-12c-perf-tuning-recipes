select o.object_name, count(*) number_of_blocks
from dba_objects o, v$bh v
where o.data_object_id = v.objd
      and o.owner !='SYS'
group by o.object_name
order by count(*);