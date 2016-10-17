SELECT MAX(salary) FROM employees;

SELECT last_name, first_name
FROM employees
WHERE salary = 24000;

SELECT last_name, first_name
FROM employees
WHERE salary =
(SELECT MAX(salary) FROM employees);

SELECT last_name, first_name, salary, ROUND((SELECT AVG(salary) FROM employees)) avg_sal
FROM employees
WHERE last_name = 'King';

column avg_sal format 99999.99

SELECT department_id, ROUND(avg(salary),2) avg_sal
FROM employees
GROUP BY department_id
HAVING avg(salary) > (SELECT AVG(salary) FROM employees)
ORDER BY 2;

SELECT department_id, department_name
FROM departments
WHERE department_id = 20
OR department_id = 30
OR department_id = 40;

SELECT department_id, department_name
FROM departments
WHERE department_id IN (20,30,40);

SELECT department_id, department_name
FROM departments
WHERE department_id < ANY (20,30,40);

SELECT department_id, department_name
FROM departments
WHERE department_id < SOME (20,30,40);

SELECT department_id, department_name
FROM departments
WHERE department_id <= ALL (20,30,40);

SELECT last_name, first_name, department_id, salary
FROM employees
WHERE (department_id, salary) IN
(SELECT department_id, max(salary)
FROM employees
GROUP BY department_id)
ORDER BY department_id;

