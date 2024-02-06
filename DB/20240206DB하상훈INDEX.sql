-- INDEX로 지정된 열은 기본적으로 정렬 처리가 된다(모든 DBMS에 해당X)
-- MYSQL INDEX 검색 알고리즘 종류

-- B-Tree : 기본값, 대부분의 데이터 index에 잘 적용되어 사용
-- hash : 해시 함수를 이용한 index, 정확한 일치 검색에 사용(포함검색시에 다소 성능이 저하될 수 있음)
-- Full-text : 전체 텍스트 검색에 사용되는 index, 텍스트 검색 기능 향상시 유리
-- Spatial : 공간 데이터(위도/경도 등을 담는 지도데이터)를 처리하기 위한 index , 지리 정보 검색에 유리

-- MYSQL INDEX TYPE

-- 클러스터형 인덱스 --

-- PK열에 기본적으로 적용되는 index, 사전편찬 순서에 맞게 정렬이 된다 (기본 : B- Tree)
-- 한테이블에 한개만 생성
-- 실제 데이터의 정렬이 인덱스의 순서로 정렬
-- 보조 인데스보다 빠른 속도

-- 보조(secondary) 인덱스 : PK이외 다른 제약조건이나 수동으로 설정시 적용(기본 : B- Tree)
-- 한 테이블에 여러 index를 생성

use testdb;
-- 01 제약조건 PK 설정시 unique index 확인
create table tbl_a(
	col1 int primary key,
    col2 int
    );
desc tbl_a;
show index from tbl_a;

-- 02 제약조건 unique 설정시 unique index 확인
create table tbl_b
(
	col1 int primary key,
    col2 int unique,
    col3 int);

desc tbl_b;
show index from tbl_b;

-- 03 index 삭제
alter table tbl_b drop primary key; -- 프라이머리키 드롭
show index from tbl_b;
alter table tbl_b drop constraint col2; -- 제약조건을 드롭
desc tbl_b;
show index from tbl_b;
-- alter table tbl_b drop index [인덱스명];


-- 보조 인덱스 추가
create table tbl_c
(
	col1 int primary key,
    col2 int,
    col3 int,
    unique index col2_index(col2)
    );
show index from tbl_c;

create table tbl_d
(
	col1 int primary key,
    col2 int,
    col3 int,
    unique index col2_3_index(col2,col3)
    );
show index from tbl_d;

create table tbl_e
(
	col1 int primary key,
    col2 int,
    col3 int
    );
show index from tbl_e;
create index col2_idx on tbl_e(col2);
show index from tbl_e;

create table tbl_f
(
	col1 int primary key,
    tbl_e_col1 int,
    col3 int,
    constraint fk_tbl_f_tbl_e foreign key(tbl_e_col1) references tbl_e(col1)
    on update cascade
    on delete cascade);
    show index from tbl_f; -- FK도 곧 인덱스
    
    
    
    
-- 04 테이블 생성시 index 설정
create table test_03
(
	col1 int primary key,
    col2 int,
    col3 int,
    index col2_3_index(col2,col3)
    );
show index from test_03;

create table test_04
(
	col1 int primary key,
    col2 int,
    col3 int,
    unique index col2_3_index(col2,col3)
    );
show index from test_04;

-- 05 테이블 생성 이후 index 설정
create table test_05
(
	col1 int,
    col2 int,
    col3 int
    );
show index from test_05;
create index col1_idx on test_05(col1); -- non unique?
create unique index col2_idx on test_05(col2);
show index from test_05;

use shopdb;
create table test_06
(
	num int primary key,
    userid char(8) not null,
    constraint fk_usertbl_test_06 foreign key(userid) 
    references usertbl(userid)
    on update cascade
    on delete cascade
    );
show index from test_06;



















