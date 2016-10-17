SELECT * FROM (
  SELECT sql_id, sum(disk_reads_delta) disk_reads_delta,
                 sum(disk_reads_total) disk_reads_total,
                 sum(executions_delta) execs_delta,
                 sum(executions_total) execs_total
  FROM dba_hist_sqlstat
  GROUP BY sql_id
  ORDER BY 2 desc)
WHERE rownum <= 5;

SELECT sql_text FROM dba_hist_sqltext
WHERE sql_id = '7wjb00vsk8btp ';

SELECT id, operation || ' ' || options operation, object_name, cost, bytes
FROM dba_hist_sql_plan
WHERE sql_id = '7wjb00vsk8btp '
ORDER BY 1;

