use lmsdb;

show tables;
-- 1
select distinct no,lec_duration,lec_time,t_name,lec_name,tbl_current_lecture.class_no
from tbl_current_lecture
inner join tbl_classroom
on tbl_current_lecture.class_no = tbl_classroom.class_no
inner join tbl_teacher
on tbl_current_lecture.t_id=tbl_teacher.t_id
inner join tbl_lecture
on tbl_current_lecture.lec_code=tbl_lecture.lec_code;



-- 2 위 결과를 완성하는 view 테이브을 만드세요
create or replace view view_current_lecture
as
select distinct no,lec_duration,lec_time,t_name,lec_name,tbl_current_lecture.class_no
from tbl_current_lecture
inner join tbl_classroom
on tbl_current_lecture.class_no = tbl_classroom.class_no
inner join tbl_teacher
on tbl_current_lecture.t_id=tbl_teacher.t_id
inner join tbl_lecture
on tbl_current_lecture.lec_code=tbl_lecture.lec_code;

select * from view_current_lecture;
-- 3 
select lec_name,
sum(if(lec_time='09:00 - 12:00',1,0)) as '09:00~12:00',
sum(if(lec_time='13:00 - 15:00',1,0)) as '13:00~15:00',
sum(if(lec_time='15:00 - 17:00',1,0)) as '15:00~17:00'
from view_current_lecture group by lec_name with rollup;
-- 4
delimiter $$
create procedure proc_insert_tbl_registration(in sid varchar(45), in lcode int, iduration varchar(100))
	begin 
		DECLARE error_code varchar(5);
        DECLARE error_message varchar(255);
        
        declare continue handler for 1062
        begin
			show errors;
            get DIAGNOSTICS CONDITION 1
				error_code = MYSQL_ERRNO,
                error_message = MESSAGE_TEXT;
			insert into tbl_errlog values (error_code,now(),error_message);
		end;
        
	
		DECLARE continue handler for 1452
        begin
			show errors;
			get DIAGNOSTICS CONDITION 1
				error_code=MYSQL_ERRNO,
                error_message=MESSAGE_TEXT;
			
            insert into tbl_errlog values (error_code,now(),error_message);
            
		end;
        select *from tbl_errlog;
	
    end $$
    delimiter ; 
    
    call proc_insert_tbl_registration('20190001','1001','2023-05-22 - 2023-06-21');
	call proc_insert_tbl_registration('20190001','1001','2023-05-22 ~ 2023-06-21');
    select *from tbl_errlog;
    
-- 5
delimiter $$
create trigger tbl_student_update_trg
after update on tbl_student
for each row
	begin
		insert into tbl_student_bak values (old.s_id,old.s_name,old.s_phone,now(),null);
	end $$
    
delimiter ; 


show triggers;

insert into tbl_student values('20191234','나나나','010-1234-1234');
select *from tbl_student;
update tbl_student set s_name='우우우' where s_id='20191234';
select *from tbl_student_bak;

-- 6
delimiter $$
create trigger tbl_teacher_update_trg
after update on tbl_teacher
for each row
	begin
		insert into tbl_teacher_bak values(old.t_id,old.t_name,old.t_phone,old.t_addr,now(),null);
	end $$
delimiter ;
show triggers;

select *from tbl_teacher;
insert into tbl_teacher values(7,'아무개','010-222-333','대구광역시 달서구');
update tbl_teacher set t_name='아무무' where t_id=7;
update tbl_teacher set t_phone='010-7777-7777' where t_id=7;
select *from tbl_teacher_bak;

-- 7

delimiter $$
create trigger tbl_student_delete_trg
after delete on  tbl_student
for each row
	begin
		insert into tbl_student_bak values(old.s_id,old.s_name,old.s_phone,null,now());
        
	end $$
    
delimiter ;

show triggers;
delete from tbl_student where s_id='20191234';
select *from tbl_student_bak;

-- 8 
delimiter $$
create trigger tbl_teacher_delete_trg
after delete on tbl_teacher
for each row
	begin
		insert into tbl_teacher_bak values(old.t_id,old.t_name,old.t_phone,old.t_addr,null,now());
        
	end $$
    
delimiter ;
drop trigger if exists tbl_teacher_delete_trg;
show triggers;
select *from tbl_teacher;
delete from tbl_teacher where t_id=7;
select *from tbl_teacher_bak;

