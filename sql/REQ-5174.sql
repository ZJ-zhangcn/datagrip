-- id: req-5174
-- 标题: 个险渠道新单投保手机号实名校验优化需求

select appntno, insuredno, salechannels, a.*
from lccont a
where (appntno = '1001736301'
    or insuredno = '1001736302')
  and appflag = '1'
  and salechannels = '020502';

/*
update lccont
set appflag='4',
    salechannels = '020502'
where contno in ('2026010600000156','2026010600000286');

update lccont
set appflag='1',
    salechannels = '020502'
where contno in ('','2026010600000286');
*/


select appntno, appntname, insuredno, insuredname, salechannels, a.*
from lccont a
where (appntno = '1060099604'
    or insuredno = '1060099604')
  and appflag = '1'
  and salechannels = '020502';

/*
update lccont
set appflag='1',
    salechannels = '020502'
where contno in ('2025122400002506', '2025122400002696', '2025122400002786');
*/

select appntno,
       appntname,
       appntidno,
       insuredno,
       insuredname,
       insuredidno,
       salechannels,
       a.*
from lccont a
where prtno = '5000118351203640';

--不一致-2  一致-1
select state, a.*
from lcmobilecheckinfo a
where customerno in ('1001736301', '1001736302');

select /*state, */a.*
from lcmobilecheckinfo a
where name like '个险投保%';

/*

insert into lcmobilecheckinfo (contno, customerno, customertype, name, idcard, mobile, managecom, reqcode, reqmessage,
                               reqdata, seqno, state, operator, makedate, maketime, modifydate, modifytime,
                               standbyflag1, standbyflag2)
values ('5000118351203640', '1001736302', 'I', '个险被保二三', '230707195001101339', '17703129999', '860101', '10000',
        '成功', '{"state":"2"}', 'YYV34FW1260108132832439', '2', 'app', date '2026-01-08', '13:28:36',
        date '2026-01-08', '13:28:36', '1874', null);

*/

/*
update lcmobilecheckinfo set state='2' where customerno in ('1060099603', '1060099604');

delete from lcmobilecheckinfo where customerno in ('1060099603', '1060099604');
*/

select name, idno, sex, mobile, address
from ldperson a,
     lcaddress b
where a.customerno = b.customerno
  and b.addressno = '1'
  and a.customerno in ('1004564960', '')
order by b.modifydate desc, b.modifytime desc;

select issuetype, issuecont
from lcissuepol a
where /*issuetype = '5004'
  and issuecont like '%实名验证%'
  and */contno = '5489223416585164';