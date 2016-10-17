alter system set parallel_degree_policy=auto scope=both;

alter session set parallel_degree_policy=auto;

SELECT name,asynch_io 
FROM v$datafile f,v$iostat_file i
WHERE f.file#=i.file_no
AND (filetype_name='Data File' or filetype_name='Temp File');

SET SERVEROUTPUT ON
DECLARE
   latc INTEGER;
   iops INTEGER;
   mbps INTEGER;
BEGIN
   DBMS_RESOURCE_MANAGER.CALIBRATE_IO (64, 10, iops, mbps, latc);
   DBMS_OUTPUT.PUT_LINE ('max_iops = ' || iops);
   DBMS_OUTPUT.PUT_LINE ('latency = ' || latc);
   dbms_output.put_line('max_mbps = ' || mbps);
END;
/

select /*+ parallel */ count(*) from employees_big;


