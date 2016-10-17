CREATE TABLE EMP_COPY 
PARALLEL(DEGREE 4)
AS
SELECT * FROM EMP;

ALTER SESSION FORCE PARALLEL DDL;

ALTER SESSION FORCE PARALLEL DDL PARALLEL 4;

delete /*+ parallel(emp,4) */ from emp
where empno > 1000000;

create table emp_ctas_new2
parallel(degree 4)
nologging
as select /*+ parallel(a,4) */ * from emp_ctas
where empno <= 1000000;



