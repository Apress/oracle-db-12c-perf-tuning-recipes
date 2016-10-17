alter session set nls_date_format = 'yyyy-mm-dd';

SELECT employee_id, last_name, first_name, hire_date
FROM employees
WHERE hire_date LIKE '%1995%';

SELECT employee_id, last_name, first_name, hire_date
FROM employees
WHERE to_char(hire_date,'yyyy') = '1995';

SELECT employee_id, last_name, first_name, hire_date
FROM employees
WHERE extract(year from hire_date) = '1995';

SELECT last_name, first_name, phone_number
FROM employees
WHERE last_name like 'Ols_n';

SELECT employee_id, last_name, first_name, hire_date
FROM employees
WHERE hire_date LIKE '%1995%'
ORDER BY hire_date;

SELECT employee_id, hire_date
FROM employees
WHERE hire_date LIKE '%1995%';

SELECT tablespace_name FROM dba_tablespaces
WHERE tablespace_name like '%EE_DATA';

SELECT tablespace_name FROM dba_tablespaces
WHERE tablespace_name LIKE '%EE^_DATA' ESCAPE '^';

SELECT employee_id, last_name, first_name, hire_date
FROM employees
WHERE to_char(hire_date,'yyyy') = '1995'
ORDER BY hire_date;
