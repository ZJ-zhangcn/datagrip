select APPNTNO, INSUREDNO, SALECHANNELS, a.*
from lccont a
where (APPNTNO = '1001736301'
    or INSUREDNO = '1001736302')
  and appflag = '1'
  and SALECHANNELS = '020502';
/*
update lccont
set appflag='4',
    SALECHANNELS = '020502'
where CONTNO IN ('2026010600000156','2026010600000286');

update lccont
set appflag='1',
    SALECHANNELS = '020502'
where CONTNO IN ('','2026010600000286');
*/


select APPNTNO, APPNTNAME, INSUREDNO, INSUREDNAME, SALECHANNELS, a.*
from lccont a
where (APPNTNO = '1060099604'
    or INSUREDNO = '1060099604')
  and appflag = '1'
  and SALECHANNELS = '020502';
/*
update lccont
set appflag='1',
    SALECHANNELS = '020502'
where CONTNO IN ('2025122400002506', '2025122400002696', '2025122400002786');
*/

select APPNTNO,
       APPNTNAME,
       APPNTIDNO,
       INSUREDNO,
       INSUREDNAME,
       INSUREDIDNO,
       SALECHANNELS,
       a.*
from lccont a
where prtno = '5000118351203640';

--不一致-2  一致-1
select state, a.*
from lcmobileCheckInfo a
where CUSTOMERNO in ('1001736301', '1001736302');

select /*state, */a.*
from lcmobileCheckInfo a
where name like '个险投保%';
/*

INSERT INTO LCMOBILECHECKINFO (CONTNO, CUSTOMERNO, CUSTOMERTYPE, NAME, IDCARD, MOBILE, MANAGECOM, REQCODE, REQMESSAGE,
                               REQDATA, SEQNO, STATE, OPERATOR, MAKEDATE, MAKETIME, MODIFYDATE, MODIFYTIME,
                               STANDBYFLAG1, STANDBYFLAG2)
VALUES ('5000118351203640', '1001736302', 'I', '个险被保二三', '230707195001101339', '17703129999', '860101', '10000',
        '成功', '{"state":"2"}', 'YYV34FW1260108132832439', '2', 'app', DATE '2026-01-08', '13:28:36',
        DATE '2026-01-08', '13:28:36', '1874', null);

*/

/*
update lcmobileCheckInfo set state='2' where CUSTOMERNO in ('1060099603', '1060099604');

delete from lcmobileCheckInfo where CUSTOMERNO in ('1060099603', '1060099604');
*/

select name, idno, sex, mobile, ADDRESS
from ldperson a,
     lcaddress b
where a.CUSTOMERNO = b.CUSTOMERNO
  and b.ADDRESSNO = '1'
  and a.CUSTOMERNO in ('1004564960', '')
order by b.MODIFYDATE desc, b.MODIFYTIME desc;

select ISSUETYPE, issuecont
from lcissuepol a
where /*ISSUETYPE = '5004'
  and issuecont like '%实名验证%'
  and */ContNo = '5489223416585164';