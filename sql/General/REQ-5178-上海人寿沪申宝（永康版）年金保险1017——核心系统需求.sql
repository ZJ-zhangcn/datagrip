--犹豫期天数
select HESITATEEND, a.*
from LMEdorWT a
where RISKCODE = '1036012';
--还款利息
select round(34636.38 * round(0.03 / 365, 8) * (date'2026-01-20' - date'2025-12-02'), 2) LX
from dual;
--生存金
select amnt
from lcpol a
where contno = '2025102300000286';

select a.*
from LJAGETDRAW a
where contno = '2025102300000286'
order by getdate;

SELECT SUM(A.本金) 本金,
       SUM(A.利息) 利息
FROM (SELECT SUM(CASE WHEN MONEYTYPE = 'YF' THEN MONEY ELSE 0 END) AS 本金,
             SUM(CASE WHEN MONEYTYPE = 'YFLX' THEN MONEY ELSE 0 END) +
             ROUND(SUM(CASE WHEN MONEYTYPE = 'YF' OR MONEYTYPE = 'YFLX' THEN MONEY ELSE 0 END) * ROUND(0.06 / 365, 8) *
                   ((DATE '2034-12-01' - DATE '2034-10-24')), 2)   AS 利息
      FROM LCINSUREACCTRACE
      WHERE contno = '2025102300000286'
      GROUP BY OTHERNO) A;

--复效利息
select round(50000 * round(0.03 / 365, 8) * (date'2029-01-20' - date'2027-10-24'), 2) +
       round(50000 * round(0.03 / 365, 8) * (date'2029-01-20' - date'2028-10-24'), 2) 利息
from dual;
--退保
--t≤PPP，年领未欠缴保费
select round(a.prem / 1000 * b.endcv *
             power(1 + 0.04,
                   (((date '2026-01-20' - date '2025-10-23') - 365) / 365)), 2) cash
from lcpol a,
     cv_1036012 b
where a.insuredsex = b.gender
  and a.insuredappage = b.age
  and a.payendyear = b.pt
  and a.contno = '2025102300000286'
  and b.dt = 1;
--t≤PPP，年领欠缴保费
select round(a.prem / 1000 * b.endcv - 8430.00, 2) cash
from lcpol a,
     cv_1036012 b
where a.insuredsex = b.gender
  and a.insuredappage = b.age
  and a.payendyear = b.pt
  and a.contno = '2025102300000286'
  and b.dt = 6;
--t>PPP，年领欠缴保费
select round(a.prem / 1000 * b.endcv - 8430.00, 2) cash
from lcpol a,
     cv_1036012 b
where a.insuredsex = b.gender
  and a.insuredappage = b.age
  and a.payendyear = b.pt
  and a.contno = '2025102300000286'
  and b.dt = 8;
--t>PPP，年领未欠缴保费
select round((a.prem / 1000 * b.endcv * (DATE '2034-12-01' - DATE '2034-10-24') / 365) +
             (a.prem / 1000 * b.begcv *
              (365 - (DATE '2034-12-01' - DATE '2034-10-24')) / 365), 2) cash
from lcpol a,
     cv_1036012 b
where a.insuredsex = b.gender
  and a.insuredappage = b.age
  and a.payendyear = b.pt
  and a.contno = '2025102300000286'
  and b.dt = 10;