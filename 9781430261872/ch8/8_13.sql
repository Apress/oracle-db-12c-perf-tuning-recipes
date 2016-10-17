SELECT employee_id, last_name || ', ' || first_name employee_name
FROM employees
WHERE employee_id = 115;

variable g_emp_id number
exec :g_emp_id := 115;
SELECT employee_id, last_name || ', ' || first_name employee_name
FROM employees
WHERE employee_id = :g_emp_id;

set serveroutput on
DECLARE
  v_emp_id employees.employee_id%TYPE := 200;
  v_last_name employees.last_name%TYPE;
  v_first_name employees.first_name%TYPE;
BEGIN
  SELECT last_name, first_name
  INTO v_last_name, v_first_name
  FROM employees
  WHERE employee_id = v_emp_id;
dbms_output.put_line('Employee Name = ' || v_last_name || ', ' || v_first_name);
END;
/

alter session set sql_trace=true;

SELECT dbms_debug_jdwp.current_session_id sid,
dbms_debug_jdwp.current_session_serial serial#
from dual;

exec dbms_monitor.session_trace_enable(session_id=>64,serial_num=>21713);

BEGIN
FOR i IN 100..206
LOOP
UPDATE employees
SET salary=salary*1.03
WHERE employee_id = i;
END LOOP;
COMMIT;
END;
/

BEGIN
FOR i IN 100..206
LOOP
execute immediate 'UPDATE employees SET salary=salary*1.03 WHERE employee_id = ' || i;
END LOOP;
COMMIT;
END;
/

BEGIN
FOR i IN 100..206
LOOP
execute immediate 'UPDATE employees SET salary=salary*1.03 WHERE employee_id = :empno' USING i;
END LOOP;
COMMIT;
END;
/

