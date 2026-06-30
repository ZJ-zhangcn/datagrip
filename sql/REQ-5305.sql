-- id: req-5305
-- 标题: 浦银人寿年年红两全保险（分红型）——核心系统需求

--犹豫期
select hesitateend
from lmedorwt
where riskcode = '1103011';

--还款利息
select round(8038.7 * 0.03 / 365 * (date '2026-07-10' - date '2026-06-10' - 1), 2) 还款利息
from dual;

--复效利息
select round(5000 * round(0.03 / 365, 8) * (date '2029-06-10' - date '2028-05-07'), 2) 复效利息
from dual;

--当年度红利计算
--保费（保额）/1000*k值*红利因子
select round(b.prem / 1000 * round(a.bonusfactor, 2) * c.bonusrate, 2) 当年度红利
from lobonusfactor a,
     lcpol b,
     bonusrate c
where a.riskcode = b.riskcode
  and a.riskcode = c.riskcode
  and a.insuredsex = b.insuredsex
  and a.payendyear = b.payendyear
  and a.insuredappage = b.insuredappage
  and a.insuyear = b.insuyear
  and a.bonusgrade = 'H'
  and a.riskcode = '1103011'
  and date'2027-05-07' between c.cvalidate and c.enddate
  --and a.polyear = '1'
  and b.contno = '2026050600002916'
order by to_number(polyear);
--红利利息计算
--红利本金*日利率*计息天数
select round(156.42 * round(0.03 / 365, 8) * (date'2028-01-10' - date'2027-05-07'), 2) 红利利息
from dual;

--生存金
select a.*
from ljsgetdraw a
where contno = '2026050600002916';

--退保
--t≤ppp，未欠缴保费
select round(a.prem / 1000 * b.endcv *
             power(1 + 0.0275, (((date '2026-06-10' - date '2026-05-07') - 365) / 365)), 2) cash
from lcpol a,
     cv_1103011 b
where a.insuredsex = b.gender
  and a.insuredappage = b.age
  and a.payendyear = b.pt
  and a.insuyear = b.bp
  and a.contno = '2026050600002686'
  and b.dt = 1;

--t≤ppp，欠缴保费
select round(a.prem / 1000 * b.endcv, 2) cash
from lcpol a,
     cv_1103011 b
where a.insuredsex = b.gender
  and a.insuredappage = b.age
  and a.payendyear = b.pt
  and a.insuyear = b.bp
  and a.contno = '2026050600002686'
  and b.dt = 1;

--t>ppp，欠缴保费
select round(a.prem / 1000 * b.endcv, 2) cash
from lcpol a,
     cv_1103011 b
where a.insuredsex = b.gender
  and a.insuredappage = b.age
  and a.payendyear = b.pt
  and a.insuyear = b.bp
  and a.contno = '2026050600002686'
  and b.dt = 2;

--t>ppp，未欠缴保费
select round((a.prem / 1000 * b.endcv * (date '2029-06-10' - date '2029-05-07') / 365) +
             (a.prem / 1000 * b.begcv *
              (365 - (date '2029-06-10' - date '2029-05-07')) / 365), 2) cash
from lcpol a,
     cv_1103011 b
where a.insuredsex = b.gender
  and a.insuredappage = b.age
  and a.payendyear = b.pt
  and a.insuyear = b.bp
  and a.contno = '2026050600002686'
  and b.dt = 4;

