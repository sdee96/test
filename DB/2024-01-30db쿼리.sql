-- selcet group by
use shopdb;
-- user 아이디별 amount 총합
select userid,sum(amount) as'구매총량' from buytbl group by userid;
-- userid별 amount*price의 총합(sum)
select userid,sum(amount*price) as '구먀총액' from buytbl group by userid;
-- 
select userid,avg(amount) as'구매평균값' from buytbl group by userid;
-- 소수점 2자리 까지 구매평균액을 내기 truncate(값, 자릿수)
select userid, truncate(avg(amount*price),2) as '구매평균액' from buytbl group by userid;

select max( height) from usertbl;
select min(height) from usertbl;

-- 가장 큰 키를 가지는 usertbl 모든 열의 값 확인
select *from usertbl where height=(select max(height) from usertbl);
-- 가장 작은키
select *from usertbl where height=(select min(height) from usertbl);
-- 가장 큰 키와 가장 작은 값만 확인
select *from usertbl where height=(select min(height) from usertbl) or height=(select max(height) from usertbl);

-- 문제
-- 1 buytbl에서 userid 별로 구매량(amount)의 합을 출력하세요
select userid,sum(amount) from buytbl  group by userid;
-- 2 usertbl에서 키의 평균 값을 구하세요
select avg(height) from usertbl;
-- 3 buy테이블에서 최대구매량과 최소 구매량을 userid와 함께 출력하세요
select userid,min(amount),max(amount) from buytbl group by userid;
-- 4 buytbl의 grouname의 갯수를 출력하세요
select sum(groupname) from buytbl;

-- 문제2--

use classicmodels;
show tables;
select *from customers;

-- 1 customers테이블의 city를 그룹으로 creditlimit의 평균을 구하세요
select  city, avg(creditlimit) from customers group by city;

-- 2 orderdetails테이블의 orderNumber를 그룹으로 quntityOrdered의 총합을 출력하세요
select orderNumber,sum(quantityOrdered) from orderdetails group by ordernumber;

-- 3 prodcuts테이블의 productVendor를 그룹으로 quantityinstock의 총합을 출력하세요
select productVendor,sum(quantityinstock) from products group by productVendor;

-- 01 select group by + having
use shopdb;
select userid,sum(amount) as'구매총량' from buytbl group by userid having sum(amount)>5;
select userid,sum(amount) as'구매총량' from buytbl group by userid having '구매총량'>5;  --  동작하지 않는다

select userid, truncate(avg(amount*price),2) as '구매평균액'
 from buytbl
 group by userid having truncate(avg(amount*price),2) >50;
 
 -- 02 select + group by + rollup
select num,groupname, sum(price*amount) from buytbl group by groupname,num with rollup;
 
select groupname, sum(price*amount) from buytbl group by groupname with rollup;


select  userid, addr,  avg(height) from usertbl group by addr,userid with rollup; -- 그룹 묶는 순서도 중요하다

-- 문제 
select *from buytbl;
use shopdb;
-- 1. prodname별로 그룹화 한뒤 userid/prodname/price*amount 순으로 출력될 수 하라

 set @@sql_mode="STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION";
select num, userid,prodname,sum(price*amount) from buytbl group by prodname,num with rollup;
-- 2. 1번 명령어에서 price*amount 값이 1000이상인 행만 출력
select userid,prodname,price*amount from buytbl group by prodname having price*amount>=1000;



-- 3. price 가격이 ㅏ장 큰 행과 작은 행의 userid, prodname, price를 출력

select userid,prodname,price*amount from buytbl group by price having max(price);


-- 5 prodname 별로 총합을 구해보세요(rollup 사용)