-- 00 확인
use shopdb;
show tables; 
select * from user tbl;
select * from buytbl;
desc usertbl;
desc buytbl; 


-- 01 select
select *from usertbl;
select userid,birthyear from usertbl;
select userid as '아이디', birthyear as '생년월일' from usetbl;

select 
userid as '아이디', birthyear as '생년월일',concat(mobile1,'-',mobile2) as'연락처' 
from usertbl;


-- 02 select where(조건절- 비교연산자)
select *from usertbl where name='김경호'; -- 동등 비교 연산자(=)
select *from usertbl where userId='LSG'; -- 동등 비교 연산자
select *from usertbl where birthyear >=10970; -- 대소 비교 연산자
select *from usertbl where height <=170;      -- 대소 비교 연산자

-- 03 Select where(조건절 - 논리연산자)
 -- and 연산자(참 and 참)
select *from usertbl where birthyear >=1970 and height>=180;
-- or연산자 (거짓 and or 참, 참or 거짓)을 만족하는 경우
select *from usertbl where birthyear >=1970 or height>=180;  
-- between and 동일한 열에는 between을 사용할 수 있다
select *from usertbl where height>=170 and height<=180;
select *from usertbl where height between 170 and 180;

-- in(포함문자열(완성된문자열)),like (포함문자열(미완성문자열))
select *from usertbl where addr in('서울','경남');
select *from usertbl where addr='경남' or addr='서울';
select *from usertbl where name='김범수';
select *from usertbl where name like '김%'; --  %길이제한 없는 모든 문자
select *from usertbl where name like '%수'; --  %길이제한 없는 모든 문자 , 끝 글자가 '수'인 모든 문자;
select *from usertbl where name like '김__'; -- _ 개수만큼의 길이 제한 있는 모든 문자

select *from usertbl where name like '%경%';


select *from buytbl;
select *from buytbl where amount>=5; -- 구매량(amount)가 5개 이상인 행을 출력
select userid,prodname from buytbl where price>=50 or price >=500; 
select *from buytbl where amount>10 or amount>100; -- 구매량(amount)이 10이상 이거나 가격이 100 이상인 행 출력
select *from buytbl where userid like 'K%'; -- userid가K로 시작하는 행 출력
select *from buytbl where groupname='서적'or groupname='가전'; -- '서적'이거나'전자'인행 출력
select *from buytbl where prodname='책' or  userID like '%W';
select *from buytbl where groupname!='null'; -- groupname이 비어있지 않은 행만 출력 !=
-- 04 select 조건절 -서브쿼리
-- 김경호 보다 큰 키를 가지는 모든 열의 값
select height from usertbl where name='김경호'; -- 김경호의 키
select *from usertbl where height>=(select height from usertbl where name='김경호');

-- 성시경보다 나이가 많은(birthyear)가 많은 모든 열의 값 출력
select birthyear from usertbl where name='성시경'; -- 1979
select *from usertbl where birthyear<(select birthyear from usertbl where name='성시경');
select height from usertbl where name='성시경';
-- 지역이 경남인 height 보다 큰 행 출력
select *from usertbl where height>(select height from usertbl where name='성시경') and addr='경남';

-- 지역이 경남인 height 보다 큰 행 출력
select *from usertbl where height> (select height from usertbl where addr in ('경남'));
select height from usertbl where addr in ('경남');
-- all 모든 조건을 만족하는
select *from usertbl where height>all (select height from usertbl where addr in ('경남'));
-- ay(어느 조건이든 하나 이상 만족)
select * from usertbl
where height > any(select height from usertbl where addr in ('경남'));


-- 문제 buytbl
-- 1 amount가 10인행의 price보다 큰 행을 출력하세요(서브쿼리)
select *from buytbl where amount='10';
select *from buytbl where price > (select price from buytbl where amount='10');

-- 2 user id가 K로 시작하는 행의 amont 보다 큰행을 출력하세요
select *from buytbl
where amount> any(select amount from buytbl where userid like 'k%');
-- amount가 5인 행의 price보다 큰 행을 출력하세요
select *from buytbl
where price> all(select price from buytbl where amount=5);
		

