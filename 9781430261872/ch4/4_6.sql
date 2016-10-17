exec dbms_workload_repository.create_baseline( -
start_time=>to_date('2013-07-21:00:00:00','yyyy-mm-dd:hh24:mi:ss'), -
end_time=>to_date('2013-07-21:06:00:00','yyyy-mm-dd:hh24:mi:ss'), -
baseline_name=>'Batch Baseline #1', -
expiration=>30);

exec dbms_workload_repository.create_baseline( -
start_snap_id=>258,end_snap_id=>268,baseline_name=>'Batch Baseline #1', -
expiration=>30);

exec dbms_workload_repository.modify_baseline_window_size(30);

column baseline_name format a20
column baseline_id format 99 heading B_ID
column start_id heading STA
column end_id heading END
column expiration heading EXP
set lines 150  
SELECT baseline_id, baseline_name, start_snap_id start_id,
         TO_CHAR(start_snap_time, 'yyyy-mm-dd:hh24:mi') start_time,
         end_snap_id end_id,
         TO_CHAR(end_snap_time, 'yyyy-mm-dd:hh24:mi') end_time,
         expiration
  FROM dba_hist_baseline
  ORDER BY baseline_id;

column start_snap_id heading STA
column end_snap_id heading END
SELECT start_snap_id, start_snap_time, end_snap_id, 
end_snap_time, pct_total_time pct  
FROM (SELECT * FROM
       TABLE(DBMS_WORKLOAD_REPOSITORY.select_baseline_details(4)));

column metric_name format a50
column average format 99999999.99
column maximum format 99999999.99
SELECT metric_name, average, maximum FROM
(SELECT * FROM TABLE
(DBMS_WORKLOAD_REPOSITORY.select_baseline_metric('SYSTEM_MOVING_WINDOW')))
where lower(metric_name) like '%read%'
order by metric_name;

