set serveroutput on

declare mycase clob;
begin
dbms_sqldiag.export_sql_testcase
(directory    =>'TEST_DIR1',
sql_text      => 'select * from my_mv where max_amount_sold >100000 order by 1',
user_name     => 'SH',
exportData    =>  TRUE,
testcase      => mycase
);
end;
/



begin
dbms_sqldiag.import_sql_testcase
(directory=>'TEST_DIR2',
filename=>'oratcb1_008602000001main.xml',
importData=>TRUE
);
end;
/
