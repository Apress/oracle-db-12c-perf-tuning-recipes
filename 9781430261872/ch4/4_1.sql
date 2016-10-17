SELECT statistics_name, activation_level, system_status
FROM v$statistics_level
order by statistics_name;
