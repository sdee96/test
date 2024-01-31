-- 제약조건


-- pk
create table tbl_a(
    id int primary key,
    name varchar(45)
    
    );
    
insert into tbl_a values(2,'홍길동');
insert into tbl_a values(1,'홍길동');
select *from tbl_a;

create table tbl_b(
	id int,
    name varchar(45) not null,
    primary key(id)
    );
    
desc tbl_b;    


create table tbl_c(
	id int,
    name varchar(45) not null,
    primary key(id,name)
    );
    
desc tbl_c;
select *from information_schema.columns where table_schema='shopdb' and column_key='PRI';

create table tbl_d(
	id int,
    name varchar(45) not null
);
    
 -- pk 추가 
alter table tbl_d add constraint  PK_tbl_d primary key(id,name);
desc tbl_d;
-- pk 삭제

alter table tbl_d drop primary key;

-- 문제

-- buytbl을 buytbl_copy로 구조 + 데이터 복사 (create table+select이용)하고 num을 primary key로 설정

create table buytbl_copy(select *from buytbl);
alter table buytbl_copy add constraint primary key(num);
desc buytbl_copy;
select *from buytbl_copy;

-- fk
create table tbl_a(
	id int primary key,
    name varchar(45)
    );

desc tbl_a;

create table tbl_b(
	num int primary key,
    tbl_a_id int,
    name varchar(45),
    constraint FK_tbl_b_tbl_a  foreign key(tbl_a_id) references tbl_a(id)
    );
    
desc tbl_b;
    

    

-- fk option
-- RESTRCT :  PK, FK 열의 값 변경 차단
-- CASCADE :  PK열의 값 on upadate, on delete이 변경시 FK열의 값도 함께 변경
-- SET NULL:  pK열의 값이 변경시 FK열의 값을 NULL로 설정
-- SET DEFAULT : PK열의 값이 변경시 FK열의 값은 Default로 설정된 기본값을 적용
-- NO ACTION : PK열의 값이 변경시 FK 열의 값은 변경 되지 않음으로 설정
create table tbl_c(
	num int primary key,
    tbl_a_id int,
    name varchar(45),
    constraint FK_tbl_c_tbl_a  foreign key(tbl_a_id) references tbl_a(id)
    on update cascade
    on delete set null
    );
    
-- 문제
-- userid를 FK 설정 (on delete resrtict on update cascade)
create table copy_buytbl(select *from buytbl);
desc copy_buytbl;
drop table copy_buytbl;

create table copy_buytbl(select *from buytbl);
desc copy_buytbl;
alter table copy_buytbl add constraint PK_copy_buytbl primary key(num);
alter table copy_buytbl add constraint FK_COpy_buytbl_usertbl foreign key(userid)
references usertbl(userid) on update restrict on delete cascade;

desc copy_buytbl;



-- unique(중복허용X ,NULL을 허용) - 통상적으로 Email 등록 할때 사용한다
create table tbl_a
(
	id int primary key,
    name varchar(45),
    email varchar(100) unique
    );
    
create table tbl_b
(
	id int primary key,
    name varchar(45),
    email varchar(100),
    constraint uk_email unique(email)
    );
    
create table tbl_c
(
	id int primary key,
    name varchar(45),
    email varchar(100) 
    );    
alter table tbl_c add constraint Uq_tbl_c_email unique(email); -- 추가
alter table tbl_c drop constraint uq_tbl_c_email ; -- 삭제   

-- check

create table tbl_d(
	id int primary key,
    name varchar(50),
    age int check(age>=20 and age<=50),
    addr varchar(50),
    constraint CK_ADDR check(addr in('대구','부산','대전'))
    );
desc tbl_d;

select * from information_schema.check_constraints;
alter table tbl_d drop check ;
select * from information_schema.check_constraints;


-- default
create table tbl_e(
	id int primary key,
    name varchar(45) default '이름없음'
    );
    

desc tbl_e;
insert into tbl_e values(1,'홍길동');
select *from tbl_e;
insert into tbl_e(id) values(2);
select *from tbl_e;

drop table tbl_e;

create table tbl_e(
	id int primary key,
    name varchar(45) default '이름없음',
    addr varchar(100)
);
desc tbl_e;

insert into tbl_e values(1,'홍길동',null);
select *from tbl_e;
insert into tbl_e(id) values(2);
select *from tbl_e;

alter table tbl_e alter column addr set default '대구';
select *from tbl_e;    
    













