SELECT /*+ full(emp) */ empno, ename 
FROM emp
WHERE DEPTNO = 20;

SELECT /*+ index(emp emp_i2) */ avg(sal) 
FROM emp
WHERE deptno = 20;

SELECT job, min(sal), avg(sal), max(sal) 
FROM emp
WHERE deptno=20
GROUP BY job;

SELECT /*+ full(emp) */ job, min(sal), avg(sal), max(sal)
FROM emp
WHERE deptno=20
GROUP BY job;

SELECT /*+ no_index(emp) */ job, min(sal), avg(sal), max(sal)
FROM emp
WHERE deptno=20
GROUP BY job;

SELECT /*+ no_index(emp emp_i2) */ job, min(sal), avg(sal), max(sal)
FROM emp
WHERE deptno=20
GROUP BY job;

SELECT empno, ename
FROM emp
WHERE DEPTNO = 20
AND hiredate
BETWEEN to_date('1980-01-01','yyyy-mm-dd')
AND to_date('1980-12-31','yyyy-mm-dd');

SELECT /*+ no_index(emp emp_i1) */ job, min(sal), avg(sal), max(sal)
FROM emp
WHERE deptno=20
GROUP BY job;

SELECT /*+ index(emp emp_i2) */ empno, ename
FROM emp
WHERE DEPTNO = 20
AND hiredate
BETWEEN to_date('1980-01-01','yyyy-mm-dd')
AND to_date('1980-12-31','yyyy-mm-dd');

SELECT ename, comm FROM emp
WHERE comm > 0;

SELECT /*+ index_ss(emp emp_i3) */ ename, comm FROM emp
WHERE comm > 0;

