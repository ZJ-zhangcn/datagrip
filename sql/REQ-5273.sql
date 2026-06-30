-- id: req-5273
-- 标题: 浦发银行客户身份影像资料传输及其他接口改造需求

--
select uwflag, a.*
from lccont a
where prtno = '5000118251009788';

/*
update lccont set uwflag='9' where prtno='5000118251009757';
*/

select a.*
from ldtask a
where taskclass = 'YbtUploadImageTask';

select a.*
from ldtaskplan a
where taskcode = '000233';

select a.*
from ldtask a
where taskclass = 'SynchronizationSendDealTask';

select sysvarvalue
from ldsysvar
where sysvar = 'PFFtp';--10.52.200.157,22,weblogic,weblogic%,/data/app/filecontent/bankfile/ccb/callsvc/

select a.*
from lpedoritem a
where contno = '2026033100010396';

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

select case uwflag when '9' then '5' when '1' then '7' when '2' then '7' when 'a' then '7' else 'A' end
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
from lpedoritem a
where edorstate = '0'
  and edortype = 'PU'
  and grpcontno like '0000000000000000%'
  and exists(select 1 from lccont where /*agentcom like '03%' and*/ salechnl = '03' and contno = a.contno)
  and exists(select 1 from lccont where contno = a.contno and appflag = '1' and a.uwflag = '9')
  and contno not in (select contno from lpedoritem where contno = a.contno and edorstate = '0' and edortype = 'PT');

select a.*
from lcpol a
where appflag = '4'
--   and paytodate <> a.payenddate
  and grpcontno = '00000000000000000000'
  and not exists(select 1 from lcconthangupstate where contno = a.contno)
  and exists(select 1 from lccontstate where contno = a.contno and state = '1' and statereason = '04')
  and exists(select 1 from lccont where agentcom like '03%' and salechnl = '03' and contno = a.contno);

select prtno
from lccont a
where contno = '2025102900001176';

select contno
from lccont a
where prtno = '3000115100037920';

/*
update lccont
set bankcode='0117',
    agentcom='030101200106'
where contno = '2025102900001176';
*/

select agentcom
from lccont a
where agentcom like '03%';


select contno,
       state,
       (select codename from ldcode where codetype = 'contterminatereason' and code = a.statereason) statereason
from lccontstate a
where contno = '2015061800000228'
order by startdate;