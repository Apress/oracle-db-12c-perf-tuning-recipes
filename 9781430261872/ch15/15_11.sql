select /*+ parallel(emp,4) */ * from emp;

select /*+ parallel(e,4) */ e.ename, d.dname
from emp e join dept d using (deptno);

select /*+ parallel(e,4) parallel(d,4) */ e.ename, d.dname
from emp e join dept d using (deptno);


