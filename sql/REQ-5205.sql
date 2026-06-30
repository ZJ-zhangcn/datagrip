-- id: req-5205
-- 标题: 关于反洗钱综合管理系统信息安全优化需求的申请

--个单满期终止
select a.*
from lccontstate a
where statetype = 'Terminate'
  and state = '1'
  and statereason = '01'
  and exists(select 1
             from lccont
             where contno = a.contno
               and (appntname like '%银保投保%' or appntname like '%个险投保%'))
order by contno desc;

--团单分单满期终止
select a.*
from lccontstate a
where statetype = 'Terminate'
  and state = '1'
  and statereason = '01'
  and exists(select 1
             from lccont
             where contno = a.contno
               and grpcontno not like '000000000000000000%')
  and startdate = makedate
order by contno desc;

select grpcontno
from lccont a
where contno = '130011003719735';

--团单整单满期终止
select a.*
from lcgrpcontstate a
where statetype = 'Terminate'
  and state = '1'
  and statereason = '01'
  and exists(select 1 from lcgrpcont where grpcontno = a.grpcontno)
  and exists(select 1 from lcgrppol where grpcontno = a.grpcontno)
--and startdate = makedate
order by grpcontno desc;

--个单理赔终止
select a.*
from lccontstate a
where statetype = 'Terminate'
  and state = '1'
  and statereason = '04'
  and exists(select 1
             from lccont
             where contno = a.contno
               and (appntname like '%银保投保%' or appntname like '%个险投保%'))
  and startdate = makedate
order by contno desc;

--团单分单理赔终止
select a.*
from lccontstate a
where statetype = 'Terminate'
  and state = '1'
  and statereason = '04'
  and exists(select 1
             from lccont
             where contno = a.contno
               and grpcontno not like '000000000000000000%')
  and startdate = makedate
order by contno desc;

select grpcontno
from lccont a
where contno = '130011003745276';

--团单整单理赔终止
select a.*
from lcgrpcontstate a
where statetype = 'Terminate'
  and state = '1'
  and statereason = '04'
  and exists(select 1 from lcgrpcont where grpcontno = a.grpcontno)
  and exists(select 1 from lcgrppol where grpcontno = a.grpcontno)
--and startdate = makedate
order by grpcontno desc;