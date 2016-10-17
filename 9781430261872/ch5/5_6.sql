select  wait_class, name
from v$event_name
where name LIKE 'enq%'
and wait_class <> 'Other'
order by wait_class
select wait_class, sum(time_waited), sum(time_waited)/sum(total_waits)
sum_waits
from v$system_wait_class
group by wait_class
order by 3 desc;
 select sea.event, sea.total_waits, sea.time_waited, sea.average_wait
	  from v$system_event sea, v$event_name enb, v$system_wait_class swc
	  where sea.event_id=enb.event_id
	  and enb.wait_class#=swc.wait_class#
	  and swc.wait_class in ('Application','Concurrency')
	  order by average_wait desc
select se.sid, se.event, se.total_waits, se.time_waited, se.average_wait
     from v$session_event se, v$session ss
     where time_waited > 0
     and se.sid=ss.sid
     and ss.username is not NULL
     and se.event='enq: TX - row lock contention';
