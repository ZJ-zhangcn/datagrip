/*
update lcinsureacctrace set makedate=paydate,modifydate=paydate where contno='2025121200000586' and moneytype != 'CXJJ';
update lcinsureacctrace set makedate=paydate+1,modifydate=paydate+1 where contno='2025121200000586' and moneytype = 'CXJJ';
update lcinsureaccfeetrace set makedate=paydate,modifydate=paydate where contno='2025121200000586';
*/


select a.*
from ldtask a
where TASKDESCRIBE like '%贷款%';

select a.*
from lcinsureacctrace a
where contno = '2025121200000586'
order by paydate, MODIFYDATE, MODIFYTIME;

--复效
select round(7596.34 * round(5 / 365, 8) * (date'2027-06-10' - date'2027-02-21'), 2) LX
from dual;

--退保
Select 9970.33 + round(round((power(1 + 0.03, 1 / 12) - 1) * 12 / 365, 8)/*将年利率0.03转化为日利率*/*
                       (date'2027-06-10' - date'2027-06-01' + 1) * 9970.33, 2)/*账户价值*/+
       round(0.20 / 30 * 20, 2) 基本保额应退金额
from dual;

Select round((9970.33 + round(round((power(1 + 0.03, 1 / 12) - 1) * 12 / 365, 8)/*将年利率0.03转化为日利率*/*
                              (date'2027-06-10' - date'2027-06-01' + 1) * 9970.33, 2)/*账户价值*/+
              round(0.20 / 30 * 20, 2)) * 0.04, 2) 退保费用
from dual;

--恢复交费
select round((9580 * 1.6 - 9580) / 1000 * round(0.4 / 365, 8) * (date'2028-01-01' - date'2027-12-20'), 2) FX
from dual;

select round((9640 * 1.6 - 9640) / 1000 * round(0.4 / 365, 8) * (date'2028-01-01' - date'2027-12-20'), 2) FX
from dual;

--追加保费
select round((19400 * 1.6 - 19400) / 1000 * round(0.4 / 365, 8) * (date'2028-01-01' - date'2027-12-20'), 2) FX
from dual;

--持续奖金
select (sum(money) + 42.33) * 0.023 CCJJ
from lcinsureacctrace a,
     lcpol b
where a.contno = b.contno
  and a.riskcode = b.riskcode
  and a.contno = '2025121200000586'
  and (a.EDORTYPE <> 'ZP' or a.MONEYTYPE <> 'BF' or a.EDORTYPE is null)
  and paydate < date'2031-12-13';
