drop database if exists univdb; 
-- univ db 만들기 
create database univdb; 
use univdb; 

drop table if exists student;
create table student (
    id     varchar(10) not null primary key, -- 1
    passwd varchar(20) not null,            -- 2                
    name   varchar(30) not null,            -- 3
    year   int         null, -- 입학년도      -- 4
    snum   varchar(10) null, -- 학번         -- 5
    depart varchar(20)  null, -- 학과         -- 6
    mobile1 varchar(3) null,                  -- 7
    mobile2 varchar(10) null,                 -- 8
    address varchar(65) null,                 -- 9
    email   varchar(30) null );                -- 10

drop table if exists board;
create table board (
    id    	int 		 not null primary key auto_increment, 			-- 1
    name 	varchar(20)  not null,           							-- 2                
    passwd  varchar(20)  not null,           							-- 3
    title   varchar(100) null,     										-- 4
    email   varchar(30)  null,      									-- 5
    regdate datetime     default current_timestamp,        									-- 6
    content text         null                 							-- 7
	);                

-- 데이터입력 5~6개
insert into student values
('gonji', 'young', '공지영', 2009, '2065787', '컴퓨터공학과', '016', '2975-9854', '인천시', 'gong@hotmail.com'),
('javajsp', 'java8394', '김정수', 2010, '1077818', '컴퓨터공학과', '011', '7649-9875', '서울시', 'java2@gmail.com'),
('jdbcmania', 'javajsptest', '김수현', 2009, '2044187', '컴퓨터공학과', '011', '87654-4983', '인천시', 'java@hanmail.com'),
('korea', '9943inner', '안익태', 2010, '1987372', '컴퓨터공학과', '017', '2670-4598', '천안시', 'wing@gmail.com'),
('novel', 'elephant', '조광근', 2011, '2056485', '기술경영과', '016', '3487-9919', '부산시', 'novel@hanmail.com'),
('tiger', 'lion', '강경태', 2010, '1011873', '인터넷비즈니스과', '011', NULL, NULL, NULL);

insert into board values
(0, '홍길동', '1234', '봄', 'hgd@gy.ac.kr',default, '봄, 우리가 가장 잘아는 기적'),
(0, '동미래', '1111', '여름', 'hgd@gy.ac.kr',default, '여름은 동사의 계절 뻗고 자라고 흐르고 솟는다'),
(0, '강은영', '1111', '나에게서', 'hgd@gy.ac.kr',default, '나에게서 시작한 이야기가 온세상을 울릴때까지'),
(0, '임상혁', '0000', '겨울', 'hgd@gy.ac.kr',default, '겨울, 모두가 따뜻해지는 시간');

-- 데이터 검색
select * from student; 

