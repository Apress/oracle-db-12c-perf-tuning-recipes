SELECT ename , sal , comm
FROM emp
ORDER BY ename;

SELECT ename , sal , NVL(comm,0) comm
FROM emp
ORDER BY ename;

SELECT ename , sal , nvl(comm,0) comm, sal+comm total_comp_no_nvl,
sal+NVL(comm,0) total_comp_nvl
FROM emp
ORDER BY ename;

SELECT ename , sal ,
NVL2(comm,'Commissioned','Non-Commissioned') comm_status
FROM emp
ORDER BY ename;

SELECT ename , sal
FROM emp
WHERE comm IS NULL
ORDER BY ename;

SELECT ename , sal
FROM emp
WHERE comm IS NOT NULL
ORDER BY ename;

SELECT ename , sal
FROM emp
WHERE NVL(comm,0) = 0
ORDER BY ename;

SELECT count(*) FROM emp;

SELECT count(comm) FROM emp;

SELECT coalesce(NULL,'ABC','DEF') FROM dual;

SELECT COALESCE(shipping_address, billing_address,’Address Unknown’)
FROM customers
WHERE cust_id = 9342;


