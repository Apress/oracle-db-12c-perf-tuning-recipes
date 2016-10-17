SELECT ename, dname
FROM emp JOIN dept USING(deptno);

SELECT /*+ ordered */ ename, dname
FROM emp JOIN dept USING(deptno);

SELECT /*+ leading(emp dept) */ ename, dname
FROM emp JOIN dept USING(deptno);

