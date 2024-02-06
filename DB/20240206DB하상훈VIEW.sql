-- View
-- 뷰는 사용자에게 접근이 허용된 자료만을 제한적으로 보여주기 위한
-- 가상 테이블

use shopdb;

create or replace view view_usertbl
as
select userid,name,concat(mobile1,'-',mobile2) as phone
from usertbl;
select *from view_usertbl;        

create or replace view view_usertbl_2
as
select  userid,name,concat(mobile1,'-',mobile2) as phone , addr
from usertbl
where addr in ('서울','경기','경남');


select *from view_usertbl_2;

select *from information_schema.views where table_schema='shopdb';

create or replace view view_user_buytbl
as
select U.userid,addr,concat(mobile1,'-',mobile2) as phone, prodname , amount
from usertbl U
inner join buytbl B
on U.userid=B.userid;
select * from view_user_buytbl;
select *from view_user_buytbl where amount>=5;
desc usertbl;

create view view_test
as
select userid,name,birthyear,addr,height from usertbl;
select * from view view_test;



use classicmodels;
create or replace view view_product_order
as
select productname,productvendor,quantityOrdered,priceeach,orderdate
from orderdetails OD
inner join products P
on OD.productcode=P.productcode
inner join orders O
on OD.ordernumber = O.ordernumber
where quantityOrdered>=25;

select *from view_product_order;

                                                                                                                                                                                                                                                                                                                                                                                                                