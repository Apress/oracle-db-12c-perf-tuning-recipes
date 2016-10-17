explain plan for
SELECT last_name, first_name
FROM employees JOIN departments USING(department_id)
WHERE employee_id = 101;

SELECT * FROM table(dbms_xplan.display);

SELECT * FROM table(dbms_xplan.display(null,null,'ALL'));

SELECT * FROM table(dbms_xplan.display(null,null,'BASIC +COST'));

SELECT * FROM table(dbms_xplan.display(null,null,'TYPICAL -BYTES -ROWS'));