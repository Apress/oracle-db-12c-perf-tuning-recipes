SELECT last_name, first_name FROM employees_big
WHERE last_name = 'EVANS';

SELECT username, target, sofar blocks_read, totalwork total_blocks,
round(time_remaining/60) minutes
FROM v$session_longops
WHERE sofar <> totalwork
and username = 'HR';

