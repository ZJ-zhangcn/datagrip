-- ID: REQ-4926
-- 标题: 保单登记平台佣金报送-销管系统对接费控获取“佣金到账日期”字段的需求申请

select a.PAYSUCDATE lawage到账日期, b.PAYSUCDATE LACOMMISSION到账日期, a.*
from lawage a,
     lacommision b
where a.INDEXCALNO = b.wageno
  and a.AGENTCODE=b.AGENTCODE
  and a.indexcalno = '202408'
  and a.managecom like '8601%'
  and a.branchtype = '3'
  and a.paysucdate = date '2025-05-13';
select EnterAccDate,
       BankCode,
       BankName,
       BankAccNo,
       AccName,
       a.*
from LISDATA.TEMP_LACOMMISSION a
where PUSHDATE = date'2024-05-23';