INSERT INTO emp_dept 
SELECT * FROM emp_ctas_new;

INSERT /*+ append */ INTO emp_dept 
SELECT * FROM emp_ctas_new;

INSERT INTO emp_dept
VALUES (15867234,'Smith, JR','Sales',1359,'2010-01-01',200,5,20);

INSERT /*+ append_values */ INTO emp_dept
VALUES (15867234,'Smith, JR','Sales',1359,'2010-01-01',200,5,20);

create table cre_test as select * from dual;

select owner, table_name, last_analyzed from dba_tables
where table_name = ‘CRE_TEST’;

select owner, table_name, last_analyzed from dba_tables
where table_name in ('INS_CONV_TEST','INS_BULK_TEST');

insert /*+ append no_gather_optimizer_statistics */ into ins_nostat_test
select * from dual;

select owner, table_name, last_analyzed from dba_tables
where table_name = 'INS_NOSTAT_TEST';



