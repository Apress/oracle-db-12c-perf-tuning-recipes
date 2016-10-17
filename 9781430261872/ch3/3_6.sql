select optimal_count, round(optimal_count*100/total, 2) optimal_perc,
       onepass_count, round(onepass_count*100/total, 2) onepass_perc,
       multipass_count, round(multipass_count*100/total, 2) multipass_perc
from
 (select decode(sum(total_executions), 0, 1, sum(total_executions)) total,
 sum(OPTIMAL_EXECUTIONS) optimal_count,
 sum(ONEPASS_EXECUTIONS) onepass_count,
 sum(MULTIPASSES_EXECUTIONS) multipass_count
 from  v$sql_workarea_histogram


 
select low_optimal_size/1024 low,
     (high_optimal_size+1)/1024 high,
     optimal_executions, onepass_executions, multipasses_executions
from v$sql_workarea_histogram
where total_executions !=0; 
