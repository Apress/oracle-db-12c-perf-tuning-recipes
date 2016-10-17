select metric_name, value
from v$sysmetric
where metric_name in ('Database CPU Time Ratio',
'Database Wait Time Ratio') and
intsize_csec =
(select max(INTSIZE_CSEC) from V$SYSMETRIC);
