create table stores
(store_id     number(10)     not null,
supplier_name     varchar2(40)     not null,
constraint stores_pk PRIMARY KEY (store_id));



create table products
(product_id     number(10)     not null,
product_name    varchar2(30)    not null,
supplier_id     number(10)     not null,
store_id     number(10)     not null,
constraint fk_stores
foreign key (store_id)
references stores(store_id)
on delete cascade);



select * from (
select ct.table_name, co.column_name, co.position column_position
from   user_constraints ct, user_cons_columns co
where  ct.constraint_name = co.constraint_name
and   ct.constraint_type = 'R'
minus
select ui.table_name, uic.column_name, uic.column_position
from   user_indexes ui, user_ind_columns uic
where  ui.index_name = uic.index_name
)
order by table_name, column_position;
