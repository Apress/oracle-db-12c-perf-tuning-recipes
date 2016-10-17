alter session set nls_date_format = 'yyyy-mm-dd:hh24:mi:ss';

exec DBMS_WORKLOAD_REPOSITORY.create_baseline_template( -
>    day_of_week          => 'WEDNESDAY', -
>    hour_in_day          => 0, -
>    duration             => 6, -
>    start_time           => '2013-07-23:00:00:00', -
>    end_time             => '2013-07-23:06:00:00', -
>    baseline_name_prefix => 'Batch Baseline ', -
>    template_name        => 'Batch Template', -
>    expiration           => 365);

column template_name format a14
column prefix format a14
column hr format 99
column dur format 999
column exp format 999
column day format a3

SELECT template_name, baseline_name_prefix prefix,
to_char(start_time,'mm/dd/yy:hh24') start_time,
to_char(end_time,'mm/dd/yy:hh24') end_time,
substr(day_of_week,1,3) day, hour_in_day hr, duration dur, expiration exp,
to_char(last_generated,'mm/dd/yy:hh24') last
FROM dba_hist_baseline_template;



