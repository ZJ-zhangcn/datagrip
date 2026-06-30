-- ID: REQ-5231
-- 标题: 兴业银行银保通接口文档更新（适当性新规部分）

select PRTNO          投保单号,
       CONTNO         保单号,
       CUSTEVALUATION 客户是否完成适当性评估,
       PRODSUITABLE   产品适当性是否匹配,
       RISKSIGN       风险警示确认书是否签署,
       CUSTRISKLEVEL  客户风险评级
from LCCustEvaluation a
where prtno = '3000117150314139'
order by SERIALNO;

select a.*
from lccont a
where prtno = '3000117150314139';

select agentcom
from lacom
where bankcode = '2021623'
  and state = 'N'