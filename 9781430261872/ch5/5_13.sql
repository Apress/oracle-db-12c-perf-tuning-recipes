select decode(request,0,'Holder: ','Waiter: ')||sid sess, 
id1, id2, lmode, request, type
from v$lock
where (id1, id2, type) in
(select id1, id2, type from v$lock where request>0)
order by id1, request;  
select  blocking_session, sid,  wait_class,
seconds_in_wait
from     v$session
where blocking_session is not NULL
order by blocking_session;
