create table tbl_sd(select *from tbl_a);
desc tbl_sd;

alter table tbl_sd add constraint FK_TBL_SD_TBL_a foreign key(tbl_a_id) references tbl_a(id);
drop table tbl_b;
create table tbl_b(
	num int primary key,
    tbl_a_id int,
    name varchar(45),
    constraint FK_tbl_b_tbl_a  foreign key(tbl_a_id) references tbl_a(id)
    );


create table buytbl_sd(select *from buytbl);
desc buytbl_sd;
select *from buytbl_sd;
alter table buytbl_sd add constraint PK_buytbl_sd primary key(num);
alter table buytbl_sd add constraint FK_buytbl_sd_usertbl foreign key(userid) references usertbl(userid);

alter table buytbl_sd drop foreign key FK_buytbl_sd_usertbl;
alter table buytbl_sd add constraint FK_buy_tbl_sd_usertbl foreign key(userid) references usertbl(userid)
on update cascade on delete cascade; 
-- on upadate on delete을 따로 변경하는 sql문은 작성할 수 없다
-- drop foreign key를 사용후 다시 alter table 테이블명 add constraint ~~~ on upade ~~~ on delete ~~ 하여야한다

