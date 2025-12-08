--1011005-上海人寿鑫自由乐福版终身寿险
--犹豫期配置
select HESITATEEND
from LMEdorWT a
where riskcode = '1011005';

select prem, cvalidate, a.*
from lcpol a
where contno = '2025120200000256';

select CUSTOMGETPOLDATE, GETPOLDATE, a.*
from lccont a
where contno = '2025120200000256';

select a.*
from lcappnt a
where APPNTNAME like '%个险投保%'
order by appntno desc;

--还款
select round(65578.49 * round(0.03 / 365, 8) * (date'2026-02-10' - date'2026-01-11'), 2) LX
from dual;

--复效
select round(50000.00 * round(0.03 / 365, 8) * (date'2028-12-10' - date'2027-12-03'), 2) LX
from dual;

--退保
--t≤PPP，年领未欠缴保费
select round(a.prem / 1000 * b.endcv *
             power(1 + 0.04,
                   (((date '2026-02-10' - date '2025-12-03') - 365) / 365)), 2) cash
from lcpol a,
     cv_1011005 b
where a.insuredsex = b.gender
  and a.insuredappage = b.age
  and a.payendyear = b.pt
  and a.contno = '2025120200000386'
  and b.dt = 1;

--t≤PPP，年领欠缴保费
select round(a.prem / 1000 * b.endcv, 2) cash
from lcpol a,
     cv_1011005 b
where a.insuredsex = b.gender
  and a.insuredappage = b.age
  and a.payendyear = b.pt
  and a.contno = '2025120200000526'
  and b.dt = 2;

--t>PPP，年领欠缴保费
select round(a.prem / 1000 * b.endcv, 2) cash
from lcpol a,
     cv_1011005 b
where a.insuredsex = b.gender
  and a.insuredappage = b.age
  and a.payendyear = b.pt
  and a.contno = '2025120200000386'
  and b.dt = 2;

--t>PPP，年领未欠缴保费
select round((a.prem / 1000 * b.endcv * (DATE '2031-01-10' - DATE '2030-12-06') / 365) +
             (a.prem / 1000 * b.begcv *
              (365 - (DATE '2031-01-10' - DATE '2030-12-06')) / 365), 2) cash
from lcpol a,
     cv_1011005 b
where a.insuredsex = b.gender
  and a.insuredappage = b.age
  and a.payendyear = b.pt
  and a.contno = '2025120500000286'
  and b.dt = 6;

--理赔
select 100000 * 1.6                                                      累计已交保险费乘以给付比例,
       round((a.prem / 1000 * b.endcv * (DATE '2027-01-10' - DATE '2026-12-03') / 365) +
             (a.prem / 1000 * b.begcv *
              (365 - (DATE '2027-01-10' - DATE '2026-12-03')) / 365), 2) 现金价值,
       round(amnt * power(1 + 0.02, dt - 1), 2)                          有效保险金额
from lcpol a,
     cv_1011005 b
where a.insuredsex = b.gender
  and a.insuredappage = b.age
  and a.payendyear = b.pt
  and a.contno = '2025120200000166'
  and b.dt = 2;

select prem * 1.2
from lcpol a
where contno = '2025120200000486';


--减额交清公共保额限制
select *
from ldcode a
where codetype = 'PublicPUlowestAmnt'
  and code = '000000';
--减额交清后保额计算
--u=0&未交纳年初应交保费&未发放年初生存保险金
select prem / 1000 * a.RPU 减额交清后保额
from cv_1011005 a,
     lcpol b
where pt = payendyear
  and age = insuredappage
  and gender = insuredsex
  and contno = '2025120200000526'
  and dt = 3 - 1;
--other
select round(210736.96 * 1000 / (a.END_AFACTOR * (date '2028-11-10' - date '2027-12-03') / 366 +
                                 a.BEG_AFACTOR * (1 - (date '2028-11-10' - date '2027-12-03') / 366)), 2) 减额交清后保额
from cv_1011005 a,
     lcpol b
where pt = payendyear
  and age = insuredappage
  and gender = insuredsex
  and contno = '2025120200000526'
  and dt = 3;
--减额交清后保费计算
select round(171247.56 * 1000 / a.rate, 2) 减额交清后保费
from rt_1011005 a,
     lcpol b
where pt = payendyear
  and age = insuredappage
  and gender = insuredsex
  and contno = '2025120200000526';
--减额交清后现价计算
select round((cast((171247.56 / 1000 * cv_rpuAfactorEnd) as decimal(18, 2)) *
              ((date '2028-11-10' - date '2027-12-03') / 366)) +
             (cast((171247.56 / 1000 * cv_rpuAfactorBeg) as decimal(18, 2)) *
              (1 - ((date '2028-11-10' - date '2027-12-03') / 366))), 2) cash
from cv_1011005 a,
     lcpol b
where pt = payendyear
  and age = insuredappage
  and gender = insuredsex
  and contno = '2025120200000526'
  and dt = 3;


--减保限额
--本年度第一次
select least(829011 * 0.2 / 829011 * 859896.99 - 0,
             859896.99)
from lcpol
where contno = '2025120500000286';
--本年度第二次
select least(829011 * 0.2 / 819370.18 * 849896.99 - 10000,
             849896.99)
from lcpol
where contno = '2025120500000286';
--减保后的保额
select round((1 - 10000 / 859896.99) * 829011, 2)
from cv_1011005 a,
     lcpol b
where pt = payendyear
  and age = insuredappage
  and gender = insuredsex
  and contno = '2025120500000286'
  and dt = 6;
--减保后的保费
select round(819370.18 * 1000 / rate, 2)
from rt_1011005 a,
     lcpol b
where pt = payendyear
  and age = insuredappage
  and gender = insuredsex
  and contno = '2025120500000286';