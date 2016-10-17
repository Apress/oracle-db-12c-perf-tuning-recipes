SELECT last_name, first_name
FROM employees NATURAL JOIN departments
WHERE employee_id = 101;

set autot trace exp
SELECT l.location_id, city, department_id, department_name
  FROM locations l, departments d
  WHERE l.location_id = d.location_id(+)
  ORDER BY 1;

set autot trace stat
set timi on
SELECT l.location_id, city, department_id, department_name
  FROM locations l, departments d
  WHERE l.location_id = d.location_id(+)
  ORDER BY 1;

set autot off
show autot