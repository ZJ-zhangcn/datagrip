-- id: req-5222
-- 标题: 交行银保通接口文件更新（适当性及保险数据每月核对）

/*
1、准备文件，文件路径：/data/app/filecontent/bankfile/bocm/pl/
2、j21-交行投保人适应性评估
*/

select prtno          投保单号,
       custevaluation 客户是否完成适当性评估,
       prodsuitable   产品适当性是否匹配,
       risksign       风险警示确认书是否签署,
       custrisklevel  客户风险评级
from lccustevaluation a
where prtno = '5000118251009658';

/*
delete from lccustevaluation;
*/
