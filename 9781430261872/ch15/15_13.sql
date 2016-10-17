SELECT event, wait_class, total_waits
FROM v$session_event
WHERE event LIKE 'PX%';

