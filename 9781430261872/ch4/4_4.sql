SELECT snap_id, begin_interval_time, end_interval_time
FROM DBA_HIST_SNAPSHOT
WHERE begin_interval_time > sysdate-1/6
ORDER BY 2;
