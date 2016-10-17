SELECT
  d.file_id file#, d.file_name, count(*) wait_count,  sum(s.time_waited) time_waited
FROM
  v$active_session_history s,
  dba_data_files d
WHERE
  d.file_id = s.current_file#
GROUP BY d.file_id, d.file_name
ORDER BY 3 desc;

select * from (
SELECT NVL(event, 'ON CPU') event, COUNT(*) total_wait_tm
FROM   v$active_session_history
WHERE  sample_time > SYSDATE - 15/(24*60)
GROUP BY event
ORDER BY 2 desc
)
where rownum <= 5;

column username format a12
column module format a30

SELECT * FROM
(
SELECT s.username, s.module, s.sid, s.serial#, count(*)
FROM v$active_session_history h, v$session s
WHERE h.session_id = s.sid
AND   h.session_serial# = s.serial#
AND   session_state= 'ON CPU' AND
      sample_time > sysdate - interval '15' minute
GROUP BY s.username, s.module, s.sid, s.serial#
ORDER BY count(*) desc
)
where rownum <= 5;

SELECT * FROM
(
SELECT u.username, h.module, h.session_id sid,
       h.session_serial# serial#, count(*)
FROM dba_hist_active_sess_history h, dba_users u
WHERE h.user_id = u.user_id
AND   session_state= 'ON CPU'
AND  (sample_time between to_date('2013-07-25:00:00:00','yyyy-mm-dd:hh24:mi:ss')
AND   to_date('2013-07-25:23:59:59','yyyy-mm-dd:hh24:mi:ss'))
AND u.username != 'SYS'
GROUP BY u.username, h.module, h.session_id, h.session_serial#
ORDER BY count(*) desc
)
where rownum <= 5;

SELECT * FROM
(
select * from (
SELECT o.object_name, o.object_type, s.event, s.time_waited
FROM dba_hist_active_sess_history s, dba_objects o
WHERE s.sample_time
between to_date('2013-07-27:00:00:00','yyyy-mm-dd:hh24:mi:ss')
AND   to_date('2013-07-27:23:59:59','yyyy-mm-dd:hh24:mi:ss')
AND s.current_obj# = o.object_id
ORDER BY 4 desc
)
WHERE rownum <= 5;

