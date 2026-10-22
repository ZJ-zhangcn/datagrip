SELECT prtno          投保单号,
       contno         保单号,
       makedate       交易日期,
       /*trantime       交易发生时间,
       salestaff      销售人代码,
       nodeno         网点号,
       bak2           险种代码,
       salecertno     个人或机构标志,*/
       custevaluation 客户是否完成适当性评估,
       prodsuitable   产品适当性是否匹配,
       risksign       风险警示确认书是否签署,
       custrisklevel  客户风险评级,
       custprodlevel  客户适配产品分类等级,
       riskcodelevel  产品风险等级
FROM LCCustEvaluation a
WHERE bak1 = '0117'
/*  and prtno = '5000118260812211'*/;


