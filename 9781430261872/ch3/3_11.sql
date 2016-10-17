create or replace package store_pkg is
           type store_sales_record is record (
           store_name stores.store_name%TYPE,
           mgr_name   employees.last_name%type,
           store_size  PLS_INTEGER
           );
           function get_store_info (store_id PLS_INTEGER)
           RETURN store_info_record
      RESULT_CACHE;
     END store_pkg;
    /

Create or replace package body store_pkg is
    FUNCTION get_store_sales (store_id PLS_INTEGER)
    RETURN store_sales_record
    RESULT_CACHE RELIES_ON (stores, employees)
  IS
    rec  store_sales_record;
  BEGIN
    SELECT store_name INTO rec.store_name
    FROM stores
    WHERE store_id = store_id;
    SELECT e.last_name INTO rec.mgr_name
    FROM stores d, employees e
    WHERE d.store_id = store_id
    AND d.manager_id = e.employee_id;
     SELECT COUNT(*) INTO rec.store_size
    FROM EMPLOYEES
    WHERE store_id = store_id;
     RETURN rec;
  END get_store_sales;
END store_pkg;
/
