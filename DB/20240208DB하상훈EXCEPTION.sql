-- -----------------
-- EXCEPTION(예외) 궁극적으로 프로그램이 정지되지 않는 것을 목표로 두어야함
-- -----------------
-- 경미한 오류의 일종
-- 실행오류의 하위 카테고리
-- 예외 발생시 프로그램의 Runtime이 유지되도록 처리하는 작업을 예외처리라고 한다

-- 예외발생
use shopdb;
select * from usertbl; 
select * from notable; -- 없는 테이블이기애 "예외" 발생
select * from buytbl;
insert into usertbl values(5);

-- 01,02
delimiter $$
create procedure Exception_Test02()
begin
	declare continue handler for 1146 select '해당 테이블이 없어요..' as 'Error_msg';
   	declare continue handler for 1136 select 'Insert시 value의 column이 다릅니다..' as 'Error_msg';
  
	select * from usertbl; 
	select * from notable;
	select * from buytbl;
    insert into usertbl values(1);
    select 'Result' as '끝';
end $$
delimiter ;

call Exception_Test02();


show errors;
-- 03 모든 예외 받기..
delimiter $$
create procedure Exception_Test03()
begin
	declare continue handler for SQLEXCEPTION select '예외가 발생했어요..' as 'Error_msg';

	select * from usertbl; 
	select * from notable;
	select * from buytbl;
    insert into usertbl values(1);
    select 'Result' as '끝';
end $$
delimiter ;

call Exception_Test03();


-- 04 예외코드 확인
drop procedure Exception_Test04;
delimiter $$
create procedure Exception_Test04()
begin
	declare continue handler for SQLEXCEPTION 
    begin
		show errors;
    end;

	select * from usertbl; 
	select * from notable;
	select * from buytbl;
    insert into usertbl values(1);
    select 'Result' as '끝';
end $$
delimiter ;
call Exception_Test04();


-- 05 Error_log 기록하는 테이블처리

create table tbl_std (id varchar(20) primary key, name char(10) , age int );
drop table tbl_std_errlog;
create table tbl_std_errlog(error_date datetime , error_code int ,error_msg text);
show errors;

drop procedure tbl_std_proc;
delimiter $$
create procedure tbl_std_proc(in id varchar(20),in name char(10),in age varchar(10))
begin 
	DECLARE error_code VARCHAR(5);
    DECLARE error_message VARCHAR(255);
	-- PK 중복 예외 처리
    declare continue handler for 1062 
    begin
		show errors;
		get DIAGNOSTICS CONDITION 1
			error_code = MYSQL_ERRNO,
            error_message = MESSAGE_TEXT;
		-- select error_code,error_message;
        insert into tbl_std_errlog values(now(),error_code,error_message);
    end;
    
    -- Exception Code 1265 
    declare continue handler for 1265 
    begin
		show errors;
		get DIAGNOSTICS CONDITION 1
			error_code = MYSQL_ERRNO,
            error_message = MESSAGE_TEXT;
		-- select error_code,error_message;
        insert into tbl_std_errlog values(now(),error_code,error_message);
        set age = 0;
        insert into tbl_std values(id,name,age);
        
    end;
    
	insert into tbl_std values(id,name,age);
    select * from tbl_std;
end $$
delimiter ;

call tbl_std_proc('aa','홍길동',10);
call tbl_std_proc('ab','남길동',20);
call tbl_std_proc('af','홍길동','5-');
select * from tbl_std_errlog;
select * from tbl_std;
show errors;	

delete from tbl_std;
-- 프로시저(예외처리 + 트랜잭션)
drop procedure tbl_std_proc_tx;
delimiter $$
create procedure tbl_std_proc_tx()
begin
	declare exit handler for SQLEXCEPTION
    begin
		show errors;
		rollback;
    end;
	start transaction;
		insert into tbl_std values('f','hoho',11);
		insert into tbl_std values('g','hoho',12);
		insert into tbl_std values('f','hoho',13);
		insert into tbl_std values('i','hoho',14);
		commit;
	select * from tbl_std;
        
    
end $$
delimiter ;

call tbl_std_proc_tx();