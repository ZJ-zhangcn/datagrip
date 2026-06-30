-- id: req-5257
-- 标题: 中行适当性改造需求

select prtno          投保单号,
       contno         保单号,
       custevaluation 客户是否完成适当性评估,
       prodsuitable   产品适当性是否匹配,
       risksign       风险警示确认书是否签署,
       custrisklevel  客户风险评级,
       custprodlevel  客户适配产品评级
from lccustevaluation a
where prtno = '5000118251009665'
order by serialno;

select prtno          投保单号,
       contno         保单号,
       custevaluation 客户是否完成适当性评估,
       prodsuitable   产品适当性是否匹配,
       risksign       风险警示确认书是否签署,
       custrisklevel  客户风险评级,
       custprodlevel  客户适配产品评级
from lccustevaluation a
where bak1 = '0103'
order by prtno;

select a.* from lccustevaluation a where prtno = '5000118251009665';

/*
delete from lccustevaluation where bak1 = '0103';
*/

select * from tranlog where rcode='0' and trancom='22' and funcflag='2017' and trandate='20260513'