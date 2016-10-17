exec dbms_workload_repository.rename_baseline -
      ('Batch Baseline #9','Batch Baseline #10');

exec dbms_workload_repository.drop_baseline('Batch Baseline #1');

exec dbms_workload_repository.drop_snapshot_range(255,256);

SELECT  dbms_workload_repository.awr_report_text
        (l_dbid=>2334201269,l_inst_num=>1,l_bid=>365,l_eid=>366)
FROM dual;
