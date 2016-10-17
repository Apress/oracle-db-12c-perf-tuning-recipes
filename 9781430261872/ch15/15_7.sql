ALTER INDEX EMP_NAME_IX
REBUILD
PARALLEL(DEGREE 4);

ALTER INDEX emppart_i1
REBUILD PARTITION emppart2001_p
PARALLEL(DEGREE 4);

select table_name, index_name , degree 
from user_indexes
where index_name = 'EMP_NAME_IX';


ALTER INDEX EMP_NAME_IX PARALLEL 1;