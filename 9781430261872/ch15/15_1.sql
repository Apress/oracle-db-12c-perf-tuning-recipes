SELECT /*+ parallel(emp,4) */  empno, ename 
FROM emp;

SELECT/*+ parallel(e,4) */  empno, ename 
FROM emp e;

SELECT/*+ parallel(e) */  empno, ename 
FROM emp e;

SELECT /*+ parallel_index(emp, emp_i4 ,4) */ empno, ename 
FROM emp
WHERE deptno = 10;

SELECT /*+ parallel_index(emp, emp_i3) */ empno, ename 
FROM emp
WHERE hiredate between '2010-01-01' and '2010-12-31';

SELECT /*+ parallel_index(emp, emp_i3, 4) */ empno, ename 
FROM emp
WHERE hiredate between '2010-01-01' and '2010-12-31';

SELECT /*+ parallel_index(emp, emp_i3) */ empno, ename 
FROM emp
WHERE hiredate between '2010-01-01' and '2010-12-31';

SELECT /*+ parallel_index(emp) */ empno, ename 
FROM emp
WHERE hiredate between '2010-01-01' and '2010-12-31';
