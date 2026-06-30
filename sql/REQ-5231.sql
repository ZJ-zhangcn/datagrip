-- id: req-5231
-- 标题: 兴业银行银保通接口文档更新（适当性新规部分）

select prtno          投保单号,
       contno         保单号,
       custevaluation 客户是否完成适当性评估,
       prodsuitable   产品适当性是否匹配,
       risksign       风险警示确认书是否签署,
       custrisklevel  客户风险评级
from lccustevaluation a
where prtno = '3000117150314139'
order by serialno;

select a.*
from lccont a
where prtno = '3000117150314139';

select agentcom
from lacom
where bankcode = '2021623'
  and state = 'N'