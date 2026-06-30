-- id: req-4926
-- 标题: 保单登记平台佣金报送-销管系统对接费控获取“佣金到账日期”字段的需求申请

select a.paysucdate lawage到账日期, b.paysucdate lacommission到账日期, a.*
from lawage a,
     lacommision b
where a.indexcalno = b.wageno
  and a.agentcode=b.agentcode
  and a.indexcalno = '202408'
  and a.managecom like '8601%'
  and a.branchtype = '3'
  and a.paysucdate = date '2025-05-13';

select enteraccdate,
       bankcode,
       bankname,
       bankaccno,
       accname,
       a.*
from lisdata.temp_lacommission a
where pushdate = date'2024-05-23';