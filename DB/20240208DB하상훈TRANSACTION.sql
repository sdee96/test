-- ------------
-- TRANSACTION
-- ------------
-- 데이터베이스의 상태를 변환시키는 작업 단위
-- 트랜잭션의 성질 --
-- 원자성 : 트랜잭션 내의 모든 명령은 반드시 완벽히 수행되어야 한다
--      : 어느 하나라도 오류가 발생하면 트랜잭션 전부가 취소되어야한다
--      : 트랜잭션의 연산은 모두가 반영되도록 Commit되거나 전혀 반영되지 않도록 Rollback이 되어야 한다
--        commit연산 : 하나의 트랜잭션이 성고적으로 끝나서 데이터베이스가 일관성이 있는 상태에 있음을 의미
--        rollback연산 : 하나의 트랜잭션 처리가 비정상적으로 종료되어 트랜잭션의 원자성이
--                     깨진 상태를 의미
--                    : 트랜잭션의 원자성을 지키기 위해 해당 트랜잭션이 행한 모든 연산을 재시작하거나 취소함
-- 일관성 : 트랜잭션의 작업 처리 결과는 항상 일관성이 있어야 한다
-- 독립성,격리성 : 트랜잭션 수행 시 다른 트랜잭션 연산에 끼어들지 못하도록 보장
--           : 수행죽인 트랜잭션은 완전히 완료될 때 까지 다른 트랜잭션에서의 수행 결과를 참조할 수 없음

-- 영속성,지속성 : 성공적으로 완료된 트랜잭션의 결과는 시스템이 고장나더라도 영구적으로 반영되어야 한다


create table tbl_tx(
	no int primary key,
    name varchar(20),
    age int,
    gender char(1)
    );

select *from tbl_tx;

insert into tbl_tx values(1,'aa','55','W'); -- auto commit
insert into tbl_tx values(2,'bb','44','M');
select *from tbl_tx;



start transaction; -- 오토커밋이 사라짐,  일반적으로 예외처리와 같이 사용된다
insert into tbl_tx values(3,'cc','55','W');
insert into tbl_tx values(4,'dd','55','M');
insert into tbl_tx values(5,'ee','55','W');
rollback;

start transaction;
	savepoint s1;
    insert into tbl_tx values(3,'cc','55','W');
	insert into tbl_tx values(4,'dd','55','M');
    savepoint s2;
    insert into tbl_tx values(5,'cc','55','W');
	insert into tbl_tx values(6,'dd','55','M');
    savepoint s3;
    insert into tbl_tx values(7,'cc','55','W');
	insert into tbl_tx values(8,'dd','55','M');
	rollback to s2; -- savepoint s2 이전의 SQL문 실행결과는 그대로 남으며 s2 이후 모든 내용은 롤백이 된다
    
    
drop procedure Tx_test;
delimiter $$
delete from tbl_tx;
create procedure Tx_test()
begin	
	declare continue handler for SQLEXCEPTION -- 예외처리를 위한 수단
    begin
		show errors;
        rollback;                                
        
	end;
	start transaction;
		insert into tbl_tx values(1,'dd','55','M');
        insert into tbl_tx values(2,'dd','55','M');
        insert into tbl_tx values(2,'dd','55','M');
            

    commit;

end $$


delimiter ; 

call tx_test();
select *from tbl_tx;
