SELECT /*+ gather_plan_statistics */
city, round(avg(salary)) avg, min(salary) min, max(salary) max
FROM employees JOIN departments USING (department_id)
JOIN locations USING (location_id)
GROUP BY city;

SELECT * FROM table(dbms_xplan.display_cursor(format=>'ALLSTATS LAST'));

