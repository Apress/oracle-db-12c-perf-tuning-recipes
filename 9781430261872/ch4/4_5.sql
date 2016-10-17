SELECT sql_id, sql_text
FROM v$sqltext
WHERE sql_text LIKE '%from emp natural join dept%';
