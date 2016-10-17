alter session set events '10391 trace name context forever, level 128';

select /*+ parallel(emp,4) */ * from emp;

alter session set events '10391 trace name context off';

alter session set "_px_trace"=[[Verbosity,]area],[[Verbosity,]area],..,[time];

alter session set "_px_trace"="compilation","execution","messaging"; 



