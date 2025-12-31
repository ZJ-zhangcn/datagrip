/*
1、准备文件，文件路径：/data/app/FileContent/BankFile/bocm/PL/
2、j21-交行投保人适应性评估
*/

select PRTNO          投保单号,
       CUSTEVALUATION 客户是否完成适当性评估,
       PRODSUITABLE   产品适当性是否匹配,
       RISKSIGN       风险警示确认书是否签署,
       CUSTRISKLEVEL  客户风险评级
from LCCustEvaluation a
where prtno = '5000118251009449';

/*
delete from LCCustEvaluation;
*/
