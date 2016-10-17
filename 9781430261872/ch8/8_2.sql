SELECT *
FROM EMP
WHERE deptno = 20;

SELECT last_name, first_name, salary, email
FROM employees
WHERE (department_id = 20
OR department_id = 80)
AND commission_pct > 0;

SELECT last_name, first_name, salary, email
FROM employees
WHERE department_id IN (20,80)
AND commission_pct > 0;

SELECT last_name, first_name, salary, email
FROM employees
WHERE (department_id != 20
AND department_id <> 80)
AND commission_pct > 0;

SELECT last_name, first_name, salary, email
FROM employees
WHERE department_id NOT IN(20,80)
AND commission_pct > 0;

