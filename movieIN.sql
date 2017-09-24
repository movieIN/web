
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

insert into project values(SEQ_PID.nextval, 'test1', '���Ե�', 500000000, 17950000, '2017-05-07', 150000, '2017-01-02', 1000, 2000000000, 'R', 3200000, 3, 'newMake', 3, '001.png');
insert into project values(SEQ_PID.nextval, 'test1', '�Ƽ���', 200000000, 70000000, '2017-09-20', 79999, '2017-03-15', 1000, 2000000000, 'I', 6600000, 3, 'newMake', 3, '002.png');
insert into project values(SEQ_PID.nextval, 'test1', '�ú���', 700000000, 18000000, '2017-11-14', 81231, '2017-08-29', 1000, 2000000000,  'R', 7320000, 3, 'import', 3, '003.png');
insert into project values(SEQ_PID.nextval, 'test2', '�̺�����', 80000000, 120000000, '2017-12-25', 39995, '2017-04-05', 1000, 2000000000, 'I', 3000000, 3, 'import', 3, '004.png');
insert into project values(SEQ_PID.nextval, 'test2', '����', 40000000, 25000000, '2017-11-03', 90075, '2017-09-17', 1000, 2000000000,  'R', 1200000, 3, 'reshow', 3, '005.jpg');
insert into project values(SEQ_PID.nextval, 'test2', '����', 60000000, 150000000, '2017-10-20', 27776, '2017-09-15', 1000, 2000000000, 'I', 6000000, 3, 'reshow', 3, '006.jpg');
insert into project values(SEQ_PID.nextval, 'test2', 'ų���� ���𰡵�', 50000000, 20000000, '2017-09-25', 100034, '2017-03-03', 1000, 2000000000,  'R', 8350000, 3, 'marketing', 3, '007.jpg');
insert into project values(SEQ_PID.nextval, 'test2', 'ŷ����:��缭Ŭ', 100000000, 115000000, '2017-09-23', 123000, '2017-08-05', 1000, 2000000000, 'I', 9800000, 3, 'marketing', 3, '008.jpg');

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

insert into movie(seq_PID, title, genre1, genre2, genre3, director) values(61, '���Ե�', '�׼�', '���', '��Ÿ', '���¿�');
insert into movie(seq_PID, title, genre1, genre2, genre3, director) values(62, '�Ƽ���', '����', '�׼�', '��Ÿ', '�輺��');
insert into movie(seq_PID, title, genre1, genre2, genre3, director) values(63, 'ĸƾ �Ƹ޸�ī: �ú� ��', '�׼�', '������', '��Ÿ', '�ȼҴ� ���, �� ���');
insert into movie(seq_PID, title, genre1, genre2, genre3, director) values(64, '�̺�����', '���/�θǽ�','���', '��Ÿ', '�׾� ����');
insert into movie(seq_PID, title, genre1, genre2, genre3, director) values(67, 'ų���� ���𰡵�', '�׼�', '�ڹ̵�', '��Ÿ', '��Ʈ�� ����');

insert into movie values(66, '����', '���', '���/�θǽ�', '��Ÿ', '�� ī��', '�۷� ����', '������Ÿ �̱۷ι�', '�ٸ��̽��׾� ����', 'ĳ���� �ڻ��', 'Samson Films', '���̾ؾ��̵��׷�', to_date('17/11/01', 'yy/mm/dd'), 'Once', '���̾ؽó׸�');
insert into movie values(65, '����', '���', '��Ÿ', '', '������', '������', '�ȼ���', 'ȫ��ȣ', '�Ѹ��, ������', '�̾߱����', '�����Ʈ', to_date('17/09/27', 'yy/mm/dd'), '', '');
insert into movie values(68, 'ŷ����:��缭Ŭ', '�׼�', '��庥ó', '�ڹ̵�', '��Ʃ ��', '�ݸ� �۽�', '�ٸ��� ����', '�·� ����ư', '��ũ ��Ʈ��, �Ҹ� ����', '���� �ʸ���', '20���� ����', to_date('17/09/27', 'yy/mm/dd'), 'Kingsman: The Golden Circle', '20���� ����');

insert into company values(seq_CID.nextval, 66, 'test2', '���̾ؾ��̵��׷�', '����� ������ �Ｚ��133�� 999', to_date('12/03/15', 'yy/mm/dd'), '�̻���', 20, '��', 'http://www.jnc.com', 'jnc@naver.com');
insert into company values(seq_CID.nextval, 65, 'test2', '�����Ʈ', '����� ������ �Ϳ���25�� 28', to_date('10/07/29', 'yy/mm/dd'), '������', 77, '��', 'http://www.mvmt.co.kr', 'mvmt@gmail.com');
insert into company values(seq_CID.nextval, 68, 'test2', '20���� ����', '����� ���ı� ���Ĵ�� 167', to_date('03/12/21', 'yy/mm/dd'), '�ڼ���', 3, '��', 'http://20cntfy.net', '2ctfxy@gmail.com');

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

insert into reward values(65, 15000, '��ȭ Ƽ��2��');
insert into reward values(65, 30000, '��ȭ Ƽ��2��, ����');
insert into reward values(65, 50000, '�û�ȸ Ƽ��2��, ������');
insert into reward values(65, 100000, '�û�ȸ Ƽ��2��, ������, ������');
insert into reward values(65, 150000, '�û�ȸ Ƽ��2��, ���ڹ�');
commit;


select * from membership;
select * from project;
select * from likeproject;
select * from investproject;
select * from movie;
select * from company;
select * from interest;
select * from reward;