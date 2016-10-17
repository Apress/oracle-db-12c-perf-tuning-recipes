SELECT department_name, city, avg(salary)
FROM employees_big join departments using(department_id)
JOIN locations using (location_id)
GROUP BY department_name, city
HAVING avg(salary) > 2000
ORDER BY 2,1;

column operation format a25
column plan_line_id format 9999 heading 'LINE'
column plan_options format a10 heading 'OPTIONS'
column status format a10
column output_rows heading 'ROWS'
break on sid on sql_id on status

SELECT sid, sql_id, status, plan_line_id,
plan_operation || ' ' || plan_options operation, output_rows
FROM v$sql_plan_monitor
WHERE status not like '%DONE%'
ORDER BY 1,4;

set pages 9999
set long 1000000
SELECT DBMS_SQLTUNE.REPORT_SQL_MONITOR
   (sql_id=> '7wjb00vsk8btp ',type=>'HTML')
FROM dual;

SELECT DBMS_SQLTUNE.REPORT_SQL_MONITOR
(sql_id=>'7wjb00vsk8btp ',event_detail=>'NO',report_level=>'BASIC') FROM dual;

