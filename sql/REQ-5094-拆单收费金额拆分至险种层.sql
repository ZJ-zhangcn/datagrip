select a.* from LYSENDTOBANK a where polno='2025101600000386';
select 1164227.02/3 from dual;
select a.* from ljspay a where otherno='2025101600000386';
select SPLITMONEY,ALLSUCCFLAG,RETURNMONEYFLAG,PAYCOUNT,a.* from splitcont a where contno='2025101600000386' /*and STARTPAYDATE=date'2029-01-10'*/;
select FEEOPERATIONTYPE,FEEFINATYPE,RISKCODE,SPLITMONEY,REMAINMONEY,ALLSUCCFLAG,RETURNMONEYFLAG,PAYCOUNT,a.* from splitcontdetail a where contno='2025101600000386' /*and STARTPAYDATE=date'2029-03-20'*/ order by SPLITGETNOTICENO,a.SPLITMONEY;
select riskcode,prem from lcpol a where contno='2025101600000386';
--1133200.00  31027.02  1164227.02

select round(400000 * 1133200.00 / 1164227.02), 400000 - round(400000 * 1133200.00 / 1164227.02)
from dual;
select a.* from ljaget a where otherno='7402121100330187';
select GETMONEY,a.* from LJSGETENDORSE a where contno='2025101600000386';
select GETMONEY,a.* from LJAGETENDORSE a where contno='2025101600000386' and FEEOPERATIONTYPE='CT';