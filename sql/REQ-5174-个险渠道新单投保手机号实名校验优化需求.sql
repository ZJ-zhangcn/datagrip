select APPNTNO, INSUREDNO, SALECHANNELS, a.*
from lccont a
where (APPNTNO = '1060099603'
    or INSUREDNO = '1060099603')
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


select APPNTNO, INSUREDNO, SALECHANNELS, a.*
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

select APPNTNO, INSUREDNO, a.*
from lccont a
where prtno = '5000118351203251';

select state, a.*
from lcmobileCheckInfo a
where CUSTOMERNO in ('1060099603', '1060099604');

/*
update lcmobileCheckInfo set state='2' where CUSTOMERNO in ('1060099603', '1060099604');

delete from lcmobileCheckInfo where CUSTOMERNO in ('1060099603', '1060099604');
*/

select name, idno, sex, mobile, ADDRESS
from ldperson a,
     lcaddress b
where a.CUSTOMERNO = b.CUSTOMERNO
  and b.ADDRESSNO = '1'
  and a.CUSTOMERNO in ('1060099603', '1060099604')
order by b.MODIFYDATE desc, b.MODIFYTIME desc;

select ISSUETYPE, issuecont
from lcissuepol a
where /*ISSUETYPE = '5004'
  and issuecont like '%实名验证%'
  and */ContNo = '5000111000019458';