select PRTNO          投保单号,
       CUSTRISKLEVEL  客户风险评级,
       CUSTEVALUATION 客户是否完成适当性评估,
       PRODSUITABLE   产品适当性是否匹配,
       RISKSIGN       风险警示确认书是否签署
from LCCustEvaluation a
where prtno = '5000118251009733'
order by SERIALNO;

select PRTNO          投保单号,
       CUSTRISKLEVEL  客户风险评级,
       CUSTEVALUATION 客户是否完成适当性评估,
       PRODSUITABLE   产品适当性是否匹配,
       RISKSIGN       风险警示确认书是否签署
from LCCustEvaluation a
where bak1 = '0117'
order by prtno;

select a.* from LCCustEvaluation a where prtno = '5000118251009665';
delete from LCCustEvaluation where bak1 = '0117';