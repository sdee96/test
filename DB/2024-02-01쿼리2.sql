-- ----------
-- 내장함수
-- ----------
-- concat(),concat_ws()

select concat('hello', '=', 'world',5,6);
select concat_ws("-"'hello',  'world',5,6); -- concat ws 구분자를 삽입할 수 있다

-- Substring()
select substring("HELLO WORLD",6);  -- 6번 인덱스부터 마지막 문자까지
select substring("HELLO WORLD",1,6);  -- 1번 index부터  6개 문자

select substring_index("HELLO MY NAME IS  HA"," ",3);
select userid,substring_index(mDate,'-',2)as '가입연월' from usertbl;

-- length() 문자열의 길이를 반환
select length("HELLO WORLD"); --  공백도 문자로 셈한다
select length(lastname) from classicmodels.employees;

-- LOWER() , UPPDER()


-- Trim() - 앞 뒤 공백을 제거

select trim("           HELLO WORLD      ");


-- bin , oct , hex

select bin(1);
select bin(2);
select bin(3);
select bin(4);
select bin(5);
select bin(6);
select bin(7);
select bin(8);
select bin(9);
select bin(10);
select bin(11);
select bin(12);
select bin(13);
select bin(14);
select bin(15);
select bin(16);
-- reverse
-- space
-- repeat
-- locate
-- Format

-- 날짜 관련 함수
select year(mdate) from usertbl;
select month(mdate) from usertbl;
select day(mdate) from usertbl;

select date(now());
select curdate();
select time(now());
select curtime();

-- 현재 날짜시간에서 연,월,일,시,분,초를 각각 추출해내고
-- 다음과 같은 포맷팅으로 출력하세요
-- YYYY#MM#DD-HH:mm:ss
select now();
select year(now());
select month(now());
select date(now());
select hour(now());
select minute(now());
select second(now());

select replace(curdate(),'-','#'); -- 대상 , 대체하고싶은 문자 , 대체할 문자
select replace(curtime(),':','|');
select concat(replace(curdate(),'-','#')," ",replace(curtime(),':','|'));


