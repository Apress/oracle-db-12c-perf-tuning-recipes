SELECT last_name, first_name, hire_date
FROM employees
WHERE hire_date BETWEEN to_date('2000-01-01','yyyy-mm-dd')
AND to_date('2010-12-31','yyyy-mm-dd')
ORDER BY hire_date;

SELECT last_name, first_name, salary
FROM employees
WHERE salary BETWEEN 20000 and 30000
ORDER BY salary;

SELECT last_name, first_name, salary
FROM employees
WHERE salary BETWEEN 20000 and 30000
AND last_name BETWEEN 'Aaaaaaaaaaaaaaaaaaaaaaaaa'
AND 'Mzzzzzzzzzzzzzzzzzzzzzzzz'
ORDER BY salary;

SELECT last_name, first_name, salary
FROM employees
WHERE salary BETWEEN 20000 and 30000
AND last_name < 'N'
ORDER BY salary;

SELECT to_char(hire_date,'yyyy-mm-dd:hh24:mi:ss') hire_date
FROM employees
WHERE email = 'SBELL';

SELECT last_name, first_name, hire_date
FROM employees
WHERE hire_date = to_date('1996-02-04','yyyy-mm-dd');

SELECT last_name, first_name, to_char(hire_date,'yyyy-mm-dd:hh24:mi:ss') hire_date
FROM employees
WHERE hire_date
BETWEEN TO_DATE('1996-02-04:00:00:00','yyyy-mm-dd:hh24:mi:ss')
AND TO_DATE('1996-02-04:23:59:59','yyyy-mm-dd:hh24:mi:ss');

SELECT last_name, first_name, to_char(hire_date,'yyyy-mm-dd:hh24:mi:ss') hire_date
FROM employees
WHERE hire_date >= TO_DATE('1996-02-04:00:00:00','yyyy-mm-dd:hh24:mi:ss')
AND hire_date <= TO_DATE('1996-02-04:23:59:59','yyyy-mm-dd:hh24:mi:ss');

SELECT last_name, first_name, hire_date
FROM employees
WHERE trunc(hire_date) = '1996-02-04';

SELECT last_name, first_name, to_char(hire_date,'yyyy-mm-dd:hh24:mi:ss') hire_date
FROM employees
WHERE hire_date
BETWEEN TO_DATE('1997-09-01','yyyy-mm-dd')
AND TO_DATE('1997-09-30','yyyy-mm-dd');

SELECT last_name, first_name, to_char(hire_date,'yyyy-mm-dd:hh24:mi:ss') hire_date
FROM employees
WHERE hire_date 
BETWEEN TO_DATE('1997-09-01:00:00:00','yyyy-mm-dd:hh24:mi:ss')
AND TO_DATE('1997-09-30:23:59:59','yyyy-mm-dd:hh24:mi:ss');

SELECT last_name, first_name, salary
FROM employees
WHERE last_name between 'Ba' and 'Bz'
ORDER BY salary;

