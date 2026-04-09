--
select uwflag,a.* from lccont a where prtno='5000118251009788';

/*
update lccont set uwflag='9' where prtno='5000118251009757';
*/

select a.* from ldtask a where TASKCLASS='YbtUploadImageTask';
select a.* from ldtask a where TASKCLASS='SynchronizationSendDealTask';

SELECT SYSVARVALUE FROM LDSYSVAR WHERE SYSVAR = 'PFFtp';--10.52.200.157,22,weblogic,weblogic%,/data/app/FileContent/BankFile/ccb/CallSvc/

select a.* from LPEDORITEM a where contno='2026033100010396';

select '1'
from lccont b
where b.contno = '5000118251009757'
  and b.appflag = '4'
  and exists (select 1 from lpedoritem where edortype in ('CT', 'GT') and edorstate = '0' and contno = b.contno)
  and rownum = 1
union
select '2'
from lccont d
where d.contno = '5000118251009757'
  and appflag = '4'
  and exists (select 1 from lpedoritem where edortype in ('WT', 'XT') and edorstate = '0' and contno = d.contno)
  and rownum = 1
union
select '4'
from lccontstate e
where e.contno = '5000118251009757'
  and e.statetype = 'Terminate'
  and e.state = '1'
  and e.statereason in ('01', '04')
  and rownum = 1
union
select CASE uwflag WHEN '9' THEN '5' WHEN '1' THEN '7' WHEN '2' THEN '7' WHEN 'a' THEN '7' ELSE 'A' END
from lccont c
where c.contno = '5000118251009757'
  and c.appflag = '0'
  and conttype = '1'
  and rownum = 1
union
select '8'
from lccont a
where a.contno = '5000118251009757'
  and appflag = '1'
  and rownum = 1;


select a.*
from LISDATA.LPEDORITEM a
where EDORSTATE = '0'
  and EDORTYPE = 'PU'
  and GRPCONTNO like '0000000000000000%'
  and exists(select 1 from lccont where /*AGENTCOM like '03%' and*/ SALECHNL = '03' and contno = a.contno)
  and exists(select 1 from lccont where contno = a.contno and appflag = '1' and a.UWFLAG = '9')
  and contno not in (select contno from LPEDORITEM where contno = a.contno and EDORSTATE = '0' and EDORTYPE = 'PT');

select a.*
from lcpol a
where appflag = '4'
--   and PAYTODATE <> a.PAYENDDATE
  and GRPCONTNO = '00000000000000000000'
  and not exists(select 1 from LCCONTHANGUPSTATE where contno = a.contno)
  and exists(select 1 from LCCONTSTATE where contno = a.contno and STATE = '1' and STATEREASON = '04')
  and exists(select 1 from lccont where AGENTCOM like '03%' and SALECHNL = '03' and contno = a.contno);

select prtno
from lccont a
where contno = '2025102900001176';

select contno
from lccont a
where prtno = '3000115100037920';

update lccont
set BANKCODE='0117',
    AGENTCOM='030101200106'
where contno = '2025102900001176';

select agentcom
from lccont a
where agentcom like '03%';


select contno,
       state,
       (select CODENAME from ldcode where codetype = 'contterminatereason' and code = a.STATEREASON) STATEREASON
from lccontstate a
where contno = '2015061800000228'
order by startdate;