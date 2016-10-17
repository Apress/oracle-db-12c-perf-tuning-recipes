show parameter optimizer_mode

SELECT *
FROM employees NATURAL JOIN departments;

SELECT /*+ first_rows(10) */ *
FROM employees NATURAL JOIN departments;

alter system set optimizer_mode=first_rows scope=both;

SELECT /*+ all_rows */ *
FROM employees NATURAL JOIN departments;

