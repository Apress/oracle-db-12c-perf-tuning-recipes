VARIABLE my_report CLOB;
BEGIN
  :my_report :=DBMS_STATS.REPORT_GATHER_SCHEMA_STATS(
    ownname      => 'OE'       , 
    detail_level => 'TYPICAL'  ,
    format       => 'HTML'     );
END;
/



VARIABLE my_report CLOB;
BEGIN
  :my_report := DBMS_STATS.REPORT_STATS_OPERATIONS (
     since        => SYSDATE-1
,    until        => SYSDATE 
,    detail_level => 'TYPICAL' 
,    format       => 'HTML'      
);
END;
/
