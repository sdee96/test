-- ---------
-- TRIGGER 특정 테이블에 INSERT UPDATE DELETE등의 데이터 변경 이벤트 발생 시
-- DBMS에서 자동적으로 실행되도록 구현한 프로그램
-- ------
-- 이벤트 속성 
-- ------
-- 트리거 작동시점
-- AFTER : 이벤트(조건 명령문) 발생 이후 트리거 실행
-- BEFORE : 이벤트(조건 명령문) 발생 이전 트리거 실행
-- 이벤트(조건 명령문)
-- DELETE : 삭제 했을 때 트리거 실행
-- INSERT : 삽입 했을 때 트리거 실행
-- UPDATE : 수정 했을 때 트리거 실행








use shopdb;
-- 01 After Trigger

drop table c_usertbl;
create table c_usertbl select * from usertbl;
select * from c_usertbl;
create table c_usertbl_bak like c_usertbl;
select * from c_usertbl_bak;
alter table c_usertbl_bak add column type char(5);
alter table c_usertbl_bak add column U_D_date char(5);
alter table c_usertbl_bak change column U_D_date U_D_date datetime;
desc c_usertbl_bak;
select * from c_usertbl_bak;

use shopdb;
drop table c_usertbl;
delimiter $$
create trigger trg_c_usertbl_update 
after update -- 업데이트 후 이 트리거가 동작됨
on c_usertbl
for each row
begin               
	insert into c_usertbl_bak values(
    old.userid,old.name,old.birthyear,old.addr,old.mobile1,old.mobile2,old.height,
    old.mDate,'수정',now()   -- '수정'부터 새로운 내용
    );                      -- 트리거 동작시 예전 값들은 OLD 에 임시로 저장 됨
							-- 새 데이터 INSERT로 삽입된 데이터 or UPDATE로 바뀐 데이터는 new에 저장 됨
                            
end $$
delimiter ;

show triggers;
show create trigger trg_c_usertbl_update;

select * from c_usertbl;
select * from c_usertbl_bak; -- 
update c_usertbl set name='바비' where userid='BBK';
update c_usertbl set addr='경남' where userid='EJW';


-- 02 삭제 트리거
delimiter $$
create trigger trg_c_usertbl_delete
after delete
on c_usertbl
for each row
begin
	insert into c_usertbl_bak values(
    old.userid,old.name,old.birthyear,old.addr,old.mobile1,old.mobile2,old.height,
    old.mDate,'삭제',now()
    );
end $$
delimiter ;
select *from c_usertbl;
delete from c_usertbl where userid='KKH';
select * from c_usertbl_bak;    -- delete 후 KKH가 bak 테이블에 들어감

-- buytbl의 c_buytbl의 구조+값복사
-- c_buytbl의 구조만 복사한 c_buytbl_bak 만들기
-- c_buytbl_bak 에 type char(5)와 mDate datetime 을 열로 추가
-- c_buytbl의 update시 c_buytbl_bak에 내용저장되는 trg_c_buytbl_update 트리거 만들기
-- c_buytbl의 delete시 c_buytbl_bak에 내용저장되는 trg_c_buytbl_delete 트리거 만들기