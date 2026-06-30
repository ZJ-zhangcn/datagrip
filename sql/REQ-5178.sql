-- id: req-5178
-- 标题: 上海人寿沪申宝（永康版）年金保险1017——核心系统需求

--犹豫期天数
select hesitateend, a.*
from lmedorwt a
where riskcode = '1036012';

--还款利息
select round(34636.38 * round(0.03 / 365, 8) * (date'2026-01-20' - date'2025-12-02'), 2) lx
from dual;

--生存金
select amnt
from lcpol a
where contno = '2025102300000286';

select a.*
from ljagetdraw a
where contno = '2025102300000286'
order by getdate;

select sum(a.本金) 本金,
       sum(a.利息) 利息
from (select sum(case when moneytype = 'YF' then money else 0 end) as 本金,
             sum(case when moneytype = 'YFLX' then money else 0 end) +
             round(sum(case when moneytype = 'YF' or moneytype = 'YFLX' then money else 0 end) * round(0.06 / 365, 8) *
                   ((date '2034-12-01' - date '2034-10-24')), 2)   as 利息
      from lcinsureacctrace
      where contno = '2025102300000286'
      group by otherno) a;

--复效利息
select round(50000 * round(0.03 / 365, 8) * (date'2029-01-20' - date'2027-10-24'), 2) +
       round(50000 * round(0.03 / 365, 8) * (date'2029-01-20' - date'2028-10-24'), 2) 利息
from dual;
--退保
--t≤ppp，年领未欠缴保费
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

--t≤ppp，年领欠缴保费
select round(a.prem / 1000 * b.endcv - 8430.00, 2) cash
from lcpol a,
     cv_1036012 b
where a.insuredsex = b.gender
  and a.insuredappage = b.age
  and a.payendyear = b.pt
  and a.contno = '2025102300000286'
  and b.dt = 6;

--t>ppp，年领欠缴保费
select round(a.prem / 1000 * b.endcv - 8430.00, 2) cash
from lcpol a,
     cv_1036012 b
where a.insuredsex = b.gender
  and a.insuredappage = b.age
  and a.payendyear = b.pt
  and a.contno = '2025102300000286'
  and b.dt = 8;

--t>ppp，年领未欠缴保费
select round((a.prem / 1000 * b.endcv * (date '2034-12-01' - date '2034-10-24') / 365) +
             (a.prem / 1000 * b.begcv *
              (365 - (date '2034-12-01' - date '2034-10-24')) / 365), 2) cash
from lcpol a,
     cv_1036012 b
where a.insuredsex = b.gender
  and a.insuredappage = b.age
  and a.payendyear = b.pt
  and a.contno = '2025102300000286'
  and b.dt = 10;