SELECT employee_id, salary, hire_date
FROM employees
WHERE TO_CHAR(hire_date,'yyyy-mm-dd') >= '2000-01-01';

SELECT employee_id, salary, hire_date
FROM employees
WHERE hire_date >= TO_DATE('2000-01-01','yyyy-mm-dd');

SELECT last_name, first_name
FROM employees
WHERE SUBSTR(phone_number,1,3) = '515';

SELECT last_name, first_name
FROM employees
WHERE phone_number BETWEEN '515.000.0000' and '515.999.9999';

SELECT last_name, first_name
FROM employees
WHERE phone_number LIKE'515%';

