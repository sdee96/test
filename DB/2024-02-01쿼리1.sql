-- 01 변수
-- 변하는 수
-- 수는 기본 선저장, 후처리를 원칙으로 한다
-- 저장된 수가 특정상황에 있어 바뀔 가능성이 있는 경우 이 수를 변수라고 한다

use shopdb;
set @var1 = 5;   -- 여기서 '=' 비교 연산자가 아닌 대입 연산자
set @var2 = 4.56;
select @var2;
set @var3 = '가수';

select @var1;
select @var2;
select @var3;
select @var1+@var2; -- 정수가 실수로 형변환되어 계산

select @var3 as 'TITLE', name, addr from usertbl;

-- LIMIT에서 변수 사용 prepare from execute가 한 세트
set @rowcnt = 3;
prepare sqlQuery01
from 'select *from usertbl order by height limit ?';

execute sqlQuery01 using @rowcnt;


-- 형변환(as date)숫자 사이 어떤 기호를 써도 날짜 형태로 변환해준다
-- 연산작업시(ex 대입연산,비교연산.... ) 자료형(data type)이 불일치시 자료형을 일치시키는 작업
-- 자동형변환(임식적형변환) : 시스템에 의한 형변환(데이터 손실을 최소하 방향)
-- 강제형변환(명시적형변환) : 프로그래머에 의한 형변환(프로그램 제작 목적에 따른 -> 데잍터 손실 우려가 비교적 큼)
select mdate from usertbl;
select cast('2024$01$01' as date); -- cast
select cast('2024@01@01' as date);
-- concat 연결
select num,
 concat(cast(price as char(10)),'X', cast(amount as char(10))) as'가격x수량',
 price*amount as '결과값'
 from buytbl; 
 
 
select 100+ 200;
select '100'+ 200; -- 문자열 + 숫자 문자열 안에 순수한 형태의 숫자만 있으면 알아서 형변환이 된다
select '100'+'200';
select 'a100'+'200';
select 2>1;   --  숫자 비교 연산시 참이면 1 거짓이면 0으로 표기된다
select 2>'1'; -- 비교연산시에도 문자열 안의 순수한 형태의 숫자만 있으면 알아서 형 변환이 된다
select 0 = 'mega';


-- 문제

-- 1.usertbl의 평균을 구하라(CAST를 이용, 평균키 정수형으로 형변환 할것)
select avg(height) from usertbl;
select cast(avg(height) as signed integer) from usertbl;
                                                                                                                                                                                                                                                                                                                   


-- 2. 2020년5월7일을 문자열을 DATE 자료 형으로 바꿔서 출력하세요
select cast('2020년5월7일' as date);