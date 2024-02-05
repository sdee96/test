-- 1 
create table tbl_member(
	member_id int not null,
    member_name varchar(10) not null,
    member_identity varchar(10) null,
    member_grade char(2) not null,
    member_addr varchar(100) not null,
    member_phone varchar(20) null
    );

desc tbl_member;

create table tbl_book(
	book_code int not null,
    classification int not null,
    book_autor varchar(45) null,
    book_name varchar(45) null,
    publisher varchar(45) null,
    isrental char(1) not null);
desc tbl_book;

create table tbl_rental(
	rental_id int not null,
    book_code int not null,
    member_id int not null
    );
desc tbl_book;

-- 2
desc tbl_member;
alter table tbl_member add constraint pk_member_id primary key(member_id);
alter table tbl_member modify member_id int not null auto_increment;

desc tbl_member;

-- 3 
alter table tbl_book add constraint pk_book_code primary key(book_code);
alter table tbl_book modify book_code int not null auto_increment;
desc tbl_book;

-- 4
alter table tbl_rental add constraint pk_renal_id primary key(rental_id);
alter table tbl_rental modify rental_id int not null auto_increment;
desc tbl_rental;

-- 5
alter table tbl_rental add constraint fk_tbl_rental_book_code foreign key(book_code)
references tbl_book(book_code) on update restrict  on delete cascade;

desc tbl_rental;

-- 6 
alter table tbl_rental add constraint fk_tbl_rental_member_id foreign key(member_id)
references tbl_member(member_id) on update cascade on delete cascade;
desc tbl_rental;

-- 7 
insert into tbl_member values(111,'aaa','111','일반','대구','010-111-2222');
select *from tbl_member;
insert into tbl_member values(222,'bbb','222','VIP','울산','010-111-2222');
select *from tbl_member;
insert into tbl_member values(333,'ccc','333','VIP','인천','010-111-2222');
insert into tbl_member values(444,'ddd','444','일반','부산','010-111-2222');
insert into tbl_member values(555,'eee','555','VIP','서울','010-111-2222');
insert into tbl_member values(666,'fff','666','일반','경기','010-111-2222');
select *from tbl_member;

insert into tbl_book values(1010,1,'윤성우','열혈C','오렌지미디어','1');
insert into tbl_book values(1011,1,'남궁성','JAVA의정석','00미디어','1');
insert into tbl_book values(1012,1,'남길동','이것이리눅스다','한빛미디어','1');
insert into tbl_book values(2010,2,'데일카네기','인간관계론','00미디어','1');
insert into tbl_book values(2011,2,'홍길동','미움받을용기','00미디어','1');
select *from tbl_book;

insert into tbl_rental values(1,1010,111);
insert into tbl_rental values(2,1011,222);
insert into tbl_rental values(3,1012,333);
select *from tbl_rental;

-- 8 

use testdb;
select * from information_schema.table_constraints;

-- 9 






-- 10

create or replace view view_showRental
as
select rental_id,member_name,book_name

from tbl_rental R
inner join tbl_member M
on R.member_id=M.member_id
inner join tbl_book B
on R.book_code=B.book_code;

select *from view_showrental;





