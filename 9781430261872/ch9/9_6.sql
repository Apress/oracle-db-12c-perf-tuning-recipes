SELECT sql_text, disk_reads FROM 
  (SELECT sql_text, buffer_gets, disk_reads, sorts,
   cpu_time/1000000 cpu, rows_processed, elapsed_time
   FROM v$sqlstats
   ORDER BY disk_reads DESC)
WHERE rownum <= 5;

SELECT sql_text, elapsed_time FROM 
  (SELECT sql_text, buffer_gets, disk_reads, sorts,
   cpu_time/1000000 cpu, rows_processed, elapsed_time
   FROM v$sqlstats
   ORDER BY elapsed_time DESC)
WHERE rownum <= 5;

SELECT schema, sql_text, disk_reads, round(cpu,2) FROM
  (SELECT s.parsing_schema_name schema, t.sql_id, t.sql_text, t.disk_reads,
  t.sorts, t.cpu_time/1000000 cpu, t.rows_processed, t.elapsed_time
   FROM v$sqlstats t join v$sql s on(t.sql_id = s.sql_id)
  WHERE parsing_schema_name = 'SCOTT'
  ORDER BY disk_reads DESC)
WHERE rownum <= 5;
