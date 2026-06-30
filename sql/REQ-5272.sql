-- id: req-5272
-- 标题: 浦发银行适当性改造需求

select prtno          投保单号,
       custrisklevel  客户风险评级,
       custevaluation 客户是否完成适当性评估,
       prodsuitable   产品适当性是否匹配,
       risksign       风险警示确认书是否签署
from lccustevaluation a
where prtno = '5000118251009733'
order by serialno;

select prtno          投保单号,
       custrisklevel  客户风险评级,
       custevaluation 客户是否完成适当性评估,
       prodsuitable   产品适当性是否匹配,
       risksign       风险警示确认书是否签署
from lccustevaluation a
where bak1 = '0117'
order by prtno;

select a.* from lccustevaluation a where prtno = '5000118251009665';

/*
delete from lccustevaluation where bak1 = '0117';
*/
