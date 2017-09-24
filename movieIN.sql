
delete from company;
delete from feedback;
delete from interest;
delete from investproject;
delete from likeproject;
delete from membership;
delete from movie;
delete from news;
delete from project;
delete from reward;

insert into membership values(SEQ_ID.nextval, 'test1',
'test1', 'test1@gmail.com', 'test1', '010-1111-1111',
sysdate);
insert into membership values(SEQ_ID.nextval, 'test2',
'test2', 'test2@naver.com', 'test2', '010-1111-1111',
sysdate);

select * from membership;

insert into project values(SEQ_PID.nextval, 'test1', '군함도', 500000000, 17950000, '2017-05-07', 150000, '2017-01-02', 1000, 2000000000, 'R', 3200000, 3, 'newMake', 3, '001.png');
insert into project values(SEQ_PID.nextval, 'test1', '아수라', 200000000, 70000000, '2017-09-20', 79999, '2017-03-15', 1000, 2000000000, 'I', 6600000, 3, 'newMake', 3, '002.png');
insert into project values(SEQ_PID.nextval, 'test1', '시빌워', 700000000, 18000000, '2017-11-14', 81231, '2017-08-29', 1000, 2000000000,  'R', 7320000, 3, 'import', 3, '003.png');
insert into project values(SEQ_PID.nextval, 'test2', '미비포유', 80000000, 120000000, '2017-12-25', 39995, '2017-04-05', 1000, 2000000000, 'I', 3000000, 3, 'import', 3, '004.png');
insert into project values(SEQ_PID.nextval, 'test2', '분장', 40000000, 25000000, '2017-11-03', 90075, '2017-09-17', 1000, 2000000000,  'R', 1200000, 3, 'reshow', 3, '005.jpg');
insert into project values(SEQ_PID.nextval, 'test2', '원스', 60000000, 150000000, '2017-10-20', 27776, '2017-09-15', 1000, 2000000000, 'I', 6000000, 3, 'reshow', 3, '006.jpg');
insert into project values(SEQ_PID.nextval, 'test2', '킬러의 보디가드', 50000000, 20000000, '2017-09-25', 100034, '2017-03-03', 1000, 2000000000,  'R', 8350000, 3, 'marketing', 3, '007.jpg');
insert into project values(SEQ_PID.nextval, 'test2', '킹스맨:골든서클', 100000000, 115000000, '2017-09-23', 123000, '2017-08-05', 1000, 2000000000, 'I', 9800000, 3, 'marketing', 3, '008.jpg');

select * from project;

insert into likeproject values(61, 'test2');
insert into likeproject values(62, 'test2');
insert into likeproject values(64, 'test1');
insert into likeproject values(66, 'test1');
insert into likeproject values(68, 'test1');

select * from likeproject;

insert into investproject values(68, 'test1', 100000);
insert into investproject values(67, 'test1', 200000);
insert into investproject values(61, 'test2', 140000);

select * from investproject;
commit;

update project set purpose='marketing' where seq_PID = 65;

insert into movie(seq_PID, title, genre1, genre2, genre3, director) values(61, '군함도', '액션', '드라마', '기타', '류승완');
insert into movie(seq_PID, title, genre1, genre2, genre3, director) values(62, '아수라', '범죄', '액션', '기타', '김성수');
insert into movie(seq_PID, title, genre1, genre2, genre3, director) values(63, '캡틴 아메리카: 시빌 워', '액션', '스릴러', '기타', '안소니 루소, 조 루소');
insert into movie(seq_PID, title, genre1, genre2, genre3, director) values(64, '미비포유', '멜로/로맨스','드라마', '기타', '테아 샤록');
insert into movie(seq_PID, title, genre1, genre2, genre3, director) values(67, '킬러의 보디가드', '액션', '코미디', '기타', '패트릭 휴즈');

insert into movie values(66, '원스', '드라마', '멜로/로맨스', '기타', '존 카니', '글렌 헨사드', '마르게타 이글로바', '앨리이스테어 폴리', '캐서린 핸사드', 'Samson Films', '제이앤씨미디어그룹', to_date('17/11/01', 'yy/mm/dd'), 'Once', '조이앤시네마');
insert into movie values(65, '분장', '드라마', '기타', '', '남연우', '남연우', '안성민', '홍정호', '한명수, 양조아', '이야기수컷', '무브먼트', to_date('17/09/27', 'yy/mm/dd'), '', '');
insert into movie values(68, '킹스맨:골든서클', '액션', '어드벤처', '코미디', '매튜 본', '콜린 퍼스', '줄리안 무어', '태런 에저튼', '마크 스트롱, 할리 베리', '마브 필름스', '20세기 폭스', to_date('17/09/27', 'yy/mm/dd'), 'Kingsman: The Golden Circle', '20세기 폭스');

insert into company values(seq_CID.nextval, 66, 'test2', '제이앤씨미디어그룹', '서울시 강남구 삼성로133길 999', to_date('12/03/15', 'yy/mm/dd'), '이상협', 20, '무', 'http://www.jnc.com', 'jnc@naver.com');
insert into company values(seq_CID.nextval, 65, 'test2', '무브먼트', '서울시 마포구 와우산로25길 28', to_date('10/07/29', 'yy/mm/dd'), '지은빛', 77, '무', 'http://www.mvmt.co.kr', 'mvmt@gmail.com');
insert into company values(seq_CID.nextval, 68, 'test2', '20세기 폭스', '서울시 송파구 송파대로 167', to_date('03/12/21', 'yy/mm/dd'), '박성령', 3, '무', 'http://20cntfy.net', '2ctfxy@gmail.com');

select * from project where seq_PID = 68;
update project set imgurl = '008.png' where seq_pid=68;

insert into interest values(68, 300000, -100);
insert into interest values(68, 1500000, -26);
insert into interest values(68, 2000000, 3);
insert into interest values(68, 4000000, 73);
insert into interest values(68, 5000000, 108);

insert into interest values(66, 100000, -100);
insert into interest values(66, 1500000, -3);
insert into interest values(66, 2000000, 8);
insert into interest values(66, 4000000, 120);
insert into interest values(66, 5000000, 250);

insert into reward values(65, 15000, '영화 티켓2장');
insert into reward values(65, 30000, '영화 티켓2장, 엽서');
insert into reward values(65, 50000, '시사회 티켓2장, 포스터');
insert into reward values(65, 100000, '시사회 티켓2장, 스탬프, 포스터');
insert into reward values(65, 150000, '시사회 티켓2장, 에코백');
commit;


select * from membership;
select * from project;
select * from likeproject;
select * from investproject;
select * from movie;
select * from company;
select * from interest;
select * from reward;