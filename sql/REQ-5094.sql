-- id: req-5094
-- 标题: 拆单收费金额拆分至险种层

select a.* from lysendtobank a where polno='2025102400000486';

select 1164227.02/3 from dual;

select a.* from ljspay a where otherno='2025102400000486';

select splitmoney,allsuccflag,returnmoneyflag,paycount,a.* from splitcont a where contno='2025102400000486' /*and startpaydate=date'2029-01-10'*/;

select feeoperationtype,feefinatype,riskcode,splitmoney,remainmoney,allsuccflag,returnmoneyflag,paycount,a.* from splitcontdetail a where contno='2025102400000486' /*and startpaydate=date'2029-03-20'*/ order by splitgetnoticeno,a.splitmoney;

select riskcode,prem from lcpol a where contno='2025102400000486';

--1133200.00  31027.02  1164227.02

select round(400000 * 1133200.00 / 1164227.02), 400000 - round(400000 * 1133200.00 / 1164227.02)
from dual;

select a.* from ljaget a where otherno='7402121100330187';

select getmoney,a.* from ljsgetendorse a where contno='2025102400000486';

select getmoney,a.* from ljagetendorse a where contno='2025102400000486' and feeoperationtype='CT';