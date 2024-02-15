use lmsdb;

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

select *from view_current_lecture;


-- 3 
select lec_name,sum(if(lec_time='09:00 - 12:00',1,0)) from view_current_lecture group by lec_name;



