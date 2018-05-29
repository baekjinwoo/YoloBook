SELECT table_name, constraint_name, constraint_type FROM   USER_CONSTRAINTS
SELECT constraint_name, status FROM ALL_CONSTRAINTS
ALTER TABLE member DROP CONSTRAINT member_id1_pk CASCADE;
drop table member
drop table program
drop table book
drop table person

--회원테이블
create table person(
mnumber number(10) primary key not null,
id varchar2(30),
pw varchar2(30),
email varchar2(100),
phone varchar2(100),
username varchar2(100)
);

--프로그램 테이블
create table program(
pnumber number(10) primary key not null,
pname varchar2(100),
starttime varchar2(10),
endtime varchar2(10),
day date,
price varchar2(100),
limit number(30)
);

--예약테이블
create table book(
mnumber constraint mnumber_fk references person(mnumber),
pnumber constraint pnumber_fk references program(pnumber)
);

--시퀀스
create sequence mnumber_seq increment by 1 start with 1 NOMAXVALUE;
create sequence pnumber_seq increment by 1 start with 1 NOMAXVALUE;

insert into program values(pnumber_seq.nextval, '가죽공예', '1시00분', '2시00분', '2017-05-11', '10000원', 5)

select member_seq from dual;
select * from program
drop sequence mnumber_seq
drop sequence pnumber_seq

delete program where pnumber>=1
