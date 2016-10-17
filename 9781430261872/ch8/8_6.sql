SELECT department_id, last_name, salary
FROM employees e
WHERE salary =
   (SELECT min_salary
    FROM jobs j
    WHERE e.job_id = j.job_id);

SELECT employee_id, job_id
FROM job_history h
WHERE EXISTS
(SELECT job_id FROM employees e
WHERE e.job_id = h.job_id)
ORDER BY 1;

SELECT count(*)
FROM employees e
WHERE EXISTS
(SELECT 'TESTING 1,2,3'
FROM employees m
WHERE e.employee_id = manager_id);

SELECT count(*)
FROM employees e
WHERE NOT EXISTS
(SELECT 'X'
FROM employees m
WHERE e.employee_id = manager_id);

