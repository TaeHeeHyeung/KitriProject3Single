--���� �ű�� �˰��� (
select 
    sg.group_num
    , count(sc.calendar_num) as calPoint
    , count(chat.chat_content) chatPoint
    , count(sh.homework_subject) homeworkPoint
    , count(sc.calendar_num) + count(chat.chat_content) + count(sh.homework_subject) result
from single_group sg 
    left outer join single_calendar sc
        on sg.group_num =sc.group_num
    left outer join single_chat chat
        on sg.group_num = chat.group_num
    left outer join single_homework sh
        on sg.group_num = sh.group_num
where sg.group_statecode = '1'
--and parseStr �� and ���ǿ� ���� 
group by sg.group_num
order by result desc;


--order by ���� �׽�Ʈ�ڵ�
select *
from single_group sg 
    left outer join single_calendar sc
        on sg.group_num =sc.group_num
    left outer join single_chat chat
        on sg.group_num = chat.group_num
    left outer join single_homework sh
        on sg.group_num = sh.group_num
    join single_hashtag st on st.group_num = st.group_num
where sg.group_statecode = '1'
and REGEXP_LIKE(hashtag_content,'��ȭ|ģ��|����|����|CGV|CG') ;

-- �̱�
--select *
select group_num
from single_hashtag h
    join
--grade function 
    (
    select sg.group_num groupNum
        , count(sc.calendar_num) as calPoint
        , count(chat.chat_content) chatPoint
        , count(sh.homework_subject) homeworkPoint
        , count(sc.calendar_num) + count(chat.chat_content) + count(sh.homework_subject) sumGrade --����
     from single_group sg 
        left outer join single_calendar sc --�����̸���
            on sg.group_num =sc.group_num
        left outer join single_chat chat --ä���� ����
            on sg.group_num = chat.group_num
        left outer join single_homework sh --������ ����
            on sg.group_num = sh.group_num
     where sg.group_statecode = '1'
     group by sg.group_num
    ) r
--grade function end
on (r.groupNum = h.group_num)
where REGEXP_LIKE(h.hashtag_content,'��ȭ|ģ��|����|����|CGV|CG') 
group by group_num, group_num, hashtag_type_num,board_num, calpoint,chatpoint, homeworkpoint,sumGrade
order by sumGrade desc
;

select group_num, hashtag_content from single_group
join single_hashtag using(group_num);

select * from single_hashtag;

select * from single_group;



-- �׽�Ʈ �ڵ� ��������
select 
    count(chat.chat_content)
from single_group sg 
    left outer join single_calendar sc
        on sg.group_num =sc.group_num
    left outer join single_chat chat
        on sg.group_num = chat.group_num
    left outer join single_homework sh
        on sg.group_num = sh.group_num
where sg.group_statecode = '1'
and sg.group_num = '1';