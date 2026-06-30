-- ID: REQ-5257
-- 标题: 中行适当性改造需求

select PRTNO          投保单号,
       CONTNO         保单号,
       CUSTEVALUATION 客户是否完成适当性评估,
       PRODSUITABLE   产品适当性是否匹配,
       RISKSIGN       风险警示确认书是否签署,
       CUSTRISKLEVEL  客户风险评级,
       CUSTPRODLEVEL  客户适配产品评级
from LCCustEvaluation a
where prtno = '5000118251009665'
order by SERIALNO;

select PRTNO          投保单号,
       CONTNO         保单号,
       CUSTEVALUATION 客户是否完成适当性评估,
       PRODSUITABLE   产品适当性是否匹配,
       RISKSIGN       风险警示确认书是否签署,
       CUSTRISKLEVEL  客户风险评级,
       CUSTPRODLEVEL  客户适配产品评级
from LCCustEvaluation a
where bak1 = '0103'
order by prtno;

select a.* from LCCustEvaluation a where prtno = '5000118251009665';

/*
delete from LCCustEvaluation where bak1 = '0103';
*/

select * from tranlog where rcode='0' and trancom='22' and funcflag='2017' and trandate='20260513'