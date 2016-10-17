SELECT /*+ use_nl(emp dept)  */ ename, dname
FROM emp JOIN dept USING (deptno);

SELECT /*+ use_hash(emp_all dept)  */ ename, dname
FROM emp_all JOIN dept USING (deptno);

SELECT /*+ use_merge(emp dept)  */ ename, dname
FROM emp JOIN dept USING (deptno)
WHERE deptno != 20;

SELECT /*+ use_hash(employees department) use_hash(departments locations)  */ 
last_name, first_name, department_name,  city, state_province
FROM employees JOIN departments USING (department_id)
JOIN locations USING (location_id);

