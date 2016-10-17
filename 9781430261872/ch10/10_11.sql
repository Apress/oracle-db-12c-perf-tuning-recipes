select inst_id,p.server_name,
p.status as p_status,
p.pid as p_pid,
p.sid as p_sid
from  gv$px_process p
order by p.server_name;
