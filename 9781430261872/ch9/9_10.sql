variable g_task varchar2(100);
EXEC :g_task := DBMS_SQLPA.CREATE_ANALYSIS_TASK(sql_text => 'select last_name || ‘,’ || first_name, department_name from employees join departments using(department_id)');

alter session set optimizer_features_enable='11.2.0.3';
EXEC DBMS_SQLPA.EXECUTE_ANALYSIS_TASK(task_name=>:g_task,execution_type=>'test execute',execution_name=>'before_change');

alter session set optimizer_features_enable='12.1.0.1.1';
EXEC DBMS_SQLPA.EXECUTE_ANALYSIS_TASK(task_name=>:g_task,execution_type=>'test execute',execution_name=>'after_change');

EXEC DBMS_SQLPA.EXECUTE_ANALYSIS_TASK(task_name=>:g_task,execution_type=>'COMPARE PERFORMANCE',execution_name=>'compare change',execution_params => dbms_advisor.arglist('comparison_metric','buffer_gets')); 

set long 100000 longchunksize 100000 linesize 200 head off feedback off echo off 
SELECT DBMS_SQLPA.REPORT_ANALYSIS_TASK(:g_task, 'TEXT', 'CHANGED_PLANS', 'ALL')
FROM DUAL;


