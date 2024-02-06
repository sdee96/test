use shopdb;

-- Inner Join
-- on이하의 조건절이 만족되는 열만 출력

select * from usertbl;
select * from buytbl;
-- 01 inner join 기본
select * from usertbl
inner join buytbl
on usertbl.userid=buytbl.userid;
-- 02 inner join 이름충돌 에러
select usertbl.userid,name,prodname,groupname,price,amount
from usertbl
inner join buytbl
on usertbl.userid=buytbl.userid;

-- 03 inner join 테이블 별칭 지정
select U.userid,name,prodname,groupname,price,amount
from usertbl U
inner join buytbl B
on U.userid = B.userid;

-- 03 inner join + where
select U.userid,name,prodname,groupname,price,amount
from usertbl U
inner join buytbl B
on U.userid=B.userid
where amount >=5;

-- 문제 
select usertbl.userid,birthyear,prodname,groupname 
from usertbl 
inner join buytbl
where name='바비킴';
-- amount * price 의 값이 100 이상인 행의 name,addr,prodname,mobiel-mobile2(concat)
-- 을 출력
select name,addr,prodname,concat(mobile1,'-',mobile2)
from  usertbl
inner join buytbl
on usertbl.userid=buytbl.userid
where amount*price >=100;

-- 3 groupname 이 전자인 행의 userid,name,birthyear,prodnmae 을 출력하세요

select usertbl.userid,name,birthyear,prodname
from usertbl
inner join buytbl
on usertbl.userid=buytbl.userid
where groupname='전자';

-- outer joint

-- left outer join(on 조건을 만족하지 않는 left테이블의 행도 출력)
select * 
from usertbl
left outer join buytbl
on usertbl.userid=buytbl.userid;

-- right outer join
select * 
from buytbl
right outer join usertbl
on usertbl.userid=buytbl.userid;

-- full outer join(on 조건을 만족하지 않는 left,right 테이블의 행도 출력)
-- mysql 에서는 full outer join 을 지원하지 않는다.
-- 대신 union을 사용하뎌 left,right outer join 을 연결한다.

select *from usertbl left join buytbl on usertbl.userid=buytbl.userid
union
select *from usertbl right join buytbl on usertbl.userid=buytbl.userid;


-- 여러 테이블들 join
use classicmodels;

-- inner join 
select P.productcode,productname,quantityordered,priceeach,
O.orderdate,O.status
from orderdetails OD
inner join products P
on P.productcode=OD.productcode
inner join orders O
on O.ordernumber=OD.ordernumber;


-- left/right outerjon (확인해볼것)
select orderdate,customername,quantityordered 
from orders O
right outer join customers C
on O.customerNumber = C.customerNumber
right outer join orderdetails OD
on OD.ordernumber = O.ordernumber;



