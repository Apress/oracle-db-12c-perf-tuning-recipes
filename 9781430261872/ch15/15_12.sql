SELECT name , value
FROM v$sysstat
WHERE name LIKE '%Parallel%';

SELECT * FROM v$pq_sysstat
WHERE statistic LIKE 'Server%';

SELECT /*+ parallel(emp,4) */ * FROM emp;

SELECT dfo_number, tq_id, server_type, process, num_rows, bytes
FROM v$pq_tqstat
ORDER BY dfo_number DESC, tq_id, server_type DESC , process;

