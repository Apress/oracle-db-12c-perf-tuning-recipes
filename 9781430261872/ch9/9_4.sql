set autotrace trace explain

SELECT ename, dname
FROM emp JOIN dept USING (deptno);

