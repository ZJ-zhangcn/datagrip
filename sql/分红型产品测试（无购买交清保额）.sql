--犹豫期
select HESITATEEND
from LMEdorWT
where riskcode = '1103011';

--还款利息
select round(8038.7 * 0.03 / 365 * (date '2026-07-10' - date '2026-06-10' - 1), 2) 还款利息
from dual;

--复效利息
select round(5000 * round(0.03 / 365, 8) * (date '2029-06-10' - date '2028-05-07'), 2) 复效利息
from dual;

--当年度红利计算
--保费（保额）/1000*K值*红利因子
select round(b.prem / 1000 * round(a.BONUSFACTOR, 2) * c.BONUSRATE, 2) 当年度红利
from lobonusfactor a,
     lcpol b,
     BonusRate c
where a.riskcode = b.riskcode
  and a.RISKCODE = c.RISKCODE
  and a.INSUREDSEX = b.INSUREDSEX
  and a.PAYENDYEAR = b.PAYENDYEAR
  and a.INSUREDAPPAGE = b.INSUREDAPPAGE
  and a.INSUYEAR = b.INSUYEAR
  and a.BONUSGRADE = 'H'
  and a.riskcode = '1103011'
  and date'2027-05-07' between c.CVALIDATE and c.ENDDATE
  --and a.POLYEAR = '1'
  and b.contno = '2026050600002916'
order by to_number(POLYEAR);
--红利利息计算
--红利本金*日利率*计息天数
select round(156.42 * round(0.03 / 365, 8) * (date'2028-01-10' - date'2027-05-07'), 2) 红利利息
from dual;

--生存金
select a.*
from ljsgetdraw a
where contno = '2026050600002916';

--退保
--t≤PPP，未欠缴保费
select round(a.prem / 1000 * b.endcv *
             power(1 + 0.0275, (((date '2026-06-10' - date '2026-05-07') - 365) / 365)), 2) cash
from lcpol a,
     cv_1103011 b
where a.insuredsex = b.gender
  and a.insuredappage = b.age
  and a.payendyear = b.pt
  and a.INSUYEAR = b.BP
  and a.contno = '2026050600002686'
  and b.dt = 1;

--t≤PPP，欠缴保费
select round(a.prem / 1000 * b.endcv, 2) cash
from lcpol a,
     cv_1103011 b
where a.insuredsex = b.gender
  and a.insuredappage = b.age
  and a.payendyear = b.pt
  and a.INSUYEAR = b.BP
  and a.contno = '2026050600002686'
  and b.dt = 1;

--t>PPP，欠缴保费
select round(a.prem / 1000 * b.endcv, 2) cash
from lcpol a,
     cv_1103011 b
where a.insuredsex = b.gender
  and a.insuredappage = b.age
  and a.payendyear = b.pt
  and a.INSUYEAR = b.BP
  and a.contno = '2026050600002686'
  and b.dt = 2;

--t>PPP，未欠缴保费
select round((a.prem / 1000 * b.endcv * (date '2029-06-10' - date '2029-05-07') / 365) +
             (a.prem / 1000 * b.begcv *
              (365 - (date '2029-06-10' - date '2029-05-07')) / 365), 2) cash
from lcpol a,
     cv_1103011 b
where a.insuredsex = b.gender
  and a.insuredappage = b.age
  and a.payendyear = b.pt
  and a.INSUYEAR = b.BP
  and a.contno = '2026050600002686'
  and b.dt = 4;

