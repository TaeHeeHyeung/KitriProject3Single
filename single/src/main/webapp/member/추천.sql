delete sns_login;
commit;

delete single_user commit;

select * from sns_login ;

select * from single_user ;

select * from single_board ;


--!! �������� �±� ���� !!--
-- �Խñ�: �丮 ������  -�±� - #�޽��� �ʿ��� #���� #�����
-- �Խñ�: �丮 ������ - ��� -�±�- #�ö�� #�Ŷ�� ����� #��ä���
-- �Խñ�: �丮 ������ - �̻����� -�±�- #�񸮾� #�� Ű���� #��ִ�ũ 
-- �Խñ�: �丮 ������ - �̻����� -�±�- #�񸮾� #�� Ű���� #��ִ�ũ 
-- �Խñ�: ���뷯 �Խ���  - #���� ù ���Ź�ǰ #
-- �Խñ�: ���뷯 �Խ���  - #����ܾ�

-- �Խñ�: �����Ȱ �Խ��� - �±� - #� #1�� #�ȱ������100��
-- �Խñ�: �����Ȱ �Խ��� - �±� - #û�� #û�ҷ� #�Ϲݾ�������� (���ƿ�)
-- �Խñ�: �����Ȱ �Խ��� - �±� - #���� #�� #���׿��극���� #���� (���ƿ�) 
-- �Խñ�: �����Ȱ �Խ��� - �±� - #���� #������ #��Ŀ 
-- �Խñ�: �����Ȱ �Խ��� - �±� - #���� #����غ� #�ڿ����� (���ƿ�)
-- �Խñ�: �����Ȱ �Խ��� - �±� - #���� #���� 


--!! �׷� ��õ �ޱ� !!--
-- 1. �׷� �Խñ� ����Ʈ �о����(ALL)
-- �׷� �Խñ�: ��� - �±� - #���� #������
-- �׷� �Խñ�: ���͵� - �±� - #��������
-- �׷� �Խñ�: ���͵� - �±� - #�ڿ����� #���� 
-- �׷� �Խñ�: ģ�񵵸� - �±� - #�������
-- �׷� �Խñ�: ģ�񵵸� - �±� - #��ȭ�����ٳ��
-- �׷� �Խñ�: ����Ž�� - �±� - #ī��Ž��
-- �׷� �Խñ�: ����Ž�� - �±� - #���� #���Թ�

-- 2.�׷� �Ľ�
--1. ������ ���ƿ��� �Խñ��� �ؽ��±׵� ������
--2. ���ƿ��� �ؽ��±װ� ���Ե� �׷�� ã�ƿ���
--3. 


--hth0893@naver.com �� ���ƿ��� �Խñ۵�
select * from 
single_board b JOIN single_like l using (board_num)
where l.user_id = 'hth0893@naver.com';

--hth0893@naver.com �� ���ƿ��� �Խñ��� �ؽ��±� =>1
select chr(39)||'%'||LISTAGG(trim(hashtag_content), '%|%') WITHIN group(Order by hashtag_content)||'%'||chr(39)  from (select * from 
                    single_board b JOIN single_like l using (board_num)
                    where l.user_id = 'hth0893@naver.com') lt JOIN single_hashtag using (board_num);
                    
select chr(39)||LISTAGG(trim(hashtag_content), '|') WITHIN group(Order by hashtag_content)||chr(39)  
from (select * 
        from single_board b JOIN single_like l using (board_num)
        where l.user_id = 'hth0893@naver.com') lt JOIN single_hashtag using (board_num);
-- ����, �޽��� �ʿ���, ����� -> LISTAGG -> '����|�������ʿ���'


--'����' �ؽ��±׸� �����ϴ� �׷� =>2
select *
from single_group JOIN single_hashtag h using (group_num)
where UPPER(h.hashtag_content) like UPPER('%����%');


-- ����, �������ʿ��� ->WHERE REGEXP_LIKE('����', 'ȫ|��|��') -- �׷��� 
--���� ����ǥ�� �ʿ����.
select *
from single_group JOIN single_hashtag h using (group_num)
where REGEXP_LIKE(hashtag_content,
                                                    (select LISTAGG(trim(hashtag_content), '|') WITHIN group(Order by hashtag_content)  
                                                    from (select * 
                                                            from single_board b JOIN single_like l using (board_num)
                                                            where l.user_id = 'hth0893@naver.com') lt JOIN single_hashtag using (board_num)
                                                    )
                                );
                    


select *
from single_group JOIN single_hashtag h using (group_num)
where REGEXP_LIKE( hashtag_content,(select  '����|��ȣ'
                                                         from dual)
                             );

--���ƿ��� �Խñ��� �ؽ��±װ� �ϳ��� �����ϴ� �׷�  -> 1 join 2


select * 
from single_group JOIN single_hashtag h using (group_num)
where UPPER(h.hashtag_content) like (select '%'||UPPER(hashtag_content)||'%' 
                                                        from (select * from (select * from 
                                                                single_board b JOIN single_like l using (board_num)
                                                                where l.user_id = 'hth0893@naver.com') lt JOIN single_hashtag using (board_num)));
                                
    
select '%'||UPPER('����')||'%'  from dual;

select * from single_like;
select * from single_hashtag;
select * from single_board;

insert into single_like values(1,'hth0893@naver.com');










delete single_group_member;
commit;

select * from single_user;

select * from sns_login;

select * from single_stamp;

select * from single_hashtag;


select * from  single_board;

select * from  single_board_list;

commit;


select user_id userId, user_password userPassword, user_nickname userNickname, user_profile userProfile, user_name userName, user_birthday userBirthday
                       , user_gender userGender, user_phone userPhone, user_zipcode userZipcode, user_address userAddress, user_addressdetail userAddressDetail
                       , user_joindate userJoindate, user_outdate userOutdate, user_statecode userStatecode
                       , auth_key authKey, auth_state authState
	from single_user join sns_login using(user_id)
    where user_id = 'hth0893@naver.com';
    
	
    

update single_user 
set auth_key ='auth'
where user_id  = 'userId';

select *
	from single_user
	where user_id = 'hth0893@naver.com';

select * from sns_login;

commit;


select user_id, user_password, user_nickname, user_name, user_profile, user_birthday
                        ,user_gender, user_phone, user_zipcode, user_address, user_addressdetail, user_joindate, user_outdate, user_statecode
                        ,auth_key, auth_state
	from single_user
	where user_id = 'hth0893@naver.com';



insert into single_user (user_id, user_password, user_nickname, user_name, user_profile, user_birthday,
                        user_gender, user_phone, user_zipcode,user_address, user_addressdetail, user_joindate, user_outdate, user_statecode,
                        auth_key, auth_state)
values(#{userId}, #{userPassword},#{userNickname},#{userName},#{userProfile},to_date(#{userBirthday},'MMDDYYYY')
                        ,#{userGender},#{userPhone},#{userZipcode},#{userAddress},#{userAddressDetail},#{userJoindate},#{userOutdate},#{userStatecode}
                        ,#{auth_key}, #{auth_state});		
                        
                        
                        
insert into single_user (user_id, user_password, user_nickname, user_name, user_profile, user_birthday
                        , user_gender, user_phone, user_zipcode,user_address, user_addressdetail, user_joindate, user_outdate, user_statecode
                        , auth_key, auth_state)
values ('userId', 'userPassword', 'usernickname', 'username', 'userprofile', to_date(01111993,'MMDDYYYY')
                        ,'F', '01074490893', '�����ڵ�', '�����ּ�', '�����', sysdate, sysdate, '0'
                        , 'authuuid', '0');		

select user_id, user_password, user_nickname, user_name, user_profile, user_birthday,
                        user_gender, user_phone, user_zipcode,user_address, user_addressdetail, user_joindate, user_outdate, user_statecode,
                        auth_key, auth_state
from single_user;

select  to_date(01111993,'MMDDYYYY') from  dual;