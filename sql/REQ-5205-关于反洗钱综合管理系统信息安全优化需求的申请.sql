--个单满期终止
select a.*
from LCCONTSTATE a
where statetype = 'Terminate'
  and state = '1'
  and STATEREASON = '01'
  and exists(select 1
             from lccont
             where contno = a.contno
               and (APPNTNAME like '%银保投保%' or APPNTNAME like '%个险投保%'))
order by contno desc;

--团单分单满期终止
select a.*
from LCCONTSTATE a
where statetype = 'Terminate'
  and state = '1'
  and STATEREASON = '01'
  and exists(select 1
             from lccont
             where contno = a.contno
               and GRPCONTNO not like '000000000000000000%')
  and STARTDATE = MAKEDATE
order by contno desc;

select GRPCONTNO
from lccont a
where contno = '130011003719735';

--团单整单满期终止
select a.*
from LCGRPCONTSTATE a
where statetype = 'Terminate'
  and state = '1'
  and STATEREASON = '01'
  and exists(select 1 from lcgrpcont where grpcontno = a.grpcontno)
  and exists(select 1 from LCGRPPOL where grpcontno = a.grpcontno)
--and STARTDATE = MAKEDATE
order by grpcontno desc;

--个单理赔终止
select a.*
from LCCONTSTATE a
where statetype = 'Terminate'
  and state = '1'
  and STATEREASON = '04'
  and exists(select 1
             from lccont
             where contno = a.contno
               and (APPNTNAME like '%银保投保%' or APPNTNAME like '%个险投保%'))
  and STARTDATE = MAKEDATE
order by contno desc;

--团单分单理赔终止
select a.*
from LCCONTSTATE a
where statetype = 'Terminate'
  and state = '1'
  and STATEREASON = '04'
  and exists(select 1
             from lccont
             where contno = a.contno
               and GRPCONTNO not like '000000000000000000%')
  and STARTDATE = MAKEDATE
order by contno desc;

select GRPCONTNO
from lccont a
where contno = '130011003745276';

--团单整单理赔终止
select a.*
from LCGRPCONTSTATE a
where statetype = 'Terminate'
  and state = '1'
  and STATEREASON = '04'
  and exists(select 1 from lcgrpcont where grpcontno = a.grpcontno)
  and exists(select 1 from LCGRPPOL where grpcontno = a.grpcontno)
--and STARTDATE = MAKEDATE
order by grpcontno desc;