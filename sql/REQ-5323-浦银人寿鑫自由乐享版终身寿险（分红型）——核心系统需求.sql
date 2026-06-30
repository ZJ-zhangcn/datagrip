--犹豫期
select HESITATEEND
from LMEdorWT
where riskcode = '1111004';

--还款利息
select round(2005.7 * 0.03 / 365 * (date '2026-07-20' - date '2026-06-20' - 1), 2) 还款利息
from dual;

--复效利息
select round(5000 * round(0.03 / 365, 8) * (date '2029-06-10' - date '2028-05-22'), 2) 复效利息
from dual;
--权限
update lpedorapp
set apppregrade='IPOS-12'
where EdorAcceptNo = '7402121100332591';

--当年度红利计算
--保费（保额）/1000*K值*红利因子
select round(b.amnt / 1000 * round(a.BONUSFACTOR, 2) * c.BONUSRATE, 2) 当年度红利
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
  and a.riskcode = '1111004'
  and date'2027-05-22' between c.CVALIDATE and c.ENDDATE
  and a.POLYEAR = '1'
  and b.contno = '2026052100002586'
order by to_number(POLYEAR);
--红利利息计算
--红利本金*日利率*计息天数
select round(194.37 * round(0.03 / 365, 8) * (date'2029-07-10' - date'2029-06-10'), 2) 红利利息
from dual;

--生存金
select a.*
from ljsgetdraw a
where contno = '2026050600002916';

--退保
--t≤PPP，未欠缴保费
select round(a.prem / 1000 * b.endcv *
             power(1 + 0.0375, (((date '2026-06-10' - date '2026-05-22') - 365) / 365)), 2) cash/*,
       round(a.prem * 1.2, 2)                                                               比例,
       round(a.amnt * power((1 + 0.0175), (select dt - 1 from dual)), 2)                    有效保险金额*/
from lcpol a,
     cv_1111004 b
where a.insuredsex = b.gender
  and a.insuredappage = b.age
  and a.payendyear = b.pt
  and a.contno = '2026052500000296'
  and b.dt = 1
order by dt;

--t≤PPP，欠缴保费
select round(a.prem / 1000 * b.endcv, 2) cash/*, round(a.prem * 3 * 1.2, 2) 比例*/
from lcpol a,
     cv_1111004 b
where a.insuredsex = b.gender
  and a.insuredappage = b.age
  and a.payendyear = b.pt
  and a.contno = '2026052100002456'
  and b.dt = 2;

--t>PPP，欠缴保费
select round(a.prem / 1000 * b.endcv, 2) cash
from lcpol a,
     cv_1111004 b
where a.insuredsex = b.gender
  and a.insuredappage = b.age
  and a.payendyear = b.pt
  and a.contno = '2026052100002586'
  and b.dt = 2;

--t>PPP，未欠缴保费
select round((a.prem / 1000 * b.endcv * (date '2029-12-10' - date '2029-05-22') / 365) +
             (a.prem / 1000 * b.begcv *
              (365 - (date '2029-12-10' - date '2029-05-22')) / 365), 2) cash,
       round(a.prem * 1.6, 2)                                            比例,
       round(a.amnt * power((1 + 0.0175), (select dt - 1 from dual)), 2) 有效保险金额
from lcpol a,
     cv_1111004 b
where a.insuredsex = b.gender
  and a.insuredappage = b.age
  and a.payendyear = b.pt
  and a.contno = '2026052100002096'
  and b.dt = 36
order by dt;

--减额交清
--最低公共保额配置
select *
from ldcode
where codetype = 'PublicPUlowestAmnt'
  and code = '000000';
--减额交清后保额
select round(6000 / 1000 * a.RPU, 2) 减额交清后保额
from cv_1111004 a,
     lcpol b
where a.AGE = b.INSUREDAPPAGE
  and a.GENDER = b.INSUREDSEX
  and a.PT = b.PAYENDYEAR
  and b.contno = '2026052100002456'
  and a.dt = '2';
--减额交清后的现金价值
select round(7821.66 / 1000 *
             (a.CV_RPUAFACTOREND * (date '2028-05-30' - date '2028-05-22') / 365 +
              a.CV_RPUAFACTORBEG * (365 - (date '2028-05-30' - date '2028-05-22')) / 365), 2) 减额交清后保额
from cv_1111004 a,
     lcpol b
where a.AGE = b.INSUREDAPPAGE
  and a.GENDER = b.INSUREDSEX
  and a.PT = b.PAYENDYEAR
  and b.contno = '2026052100002456'
  and a.dt = '3';
--减额交清后保费
select round(7821.66 * 1000 / a.RATE, 2) 减额交清后保费
from rt_1111004 a,
     lcpol b
where a.AGE = b.INSUREDAPPAGE
  and a.PT = b.PAYENDYEAR
  and a.GENDER = b.INSUREDSEX
  and b.contno = '2026052100002456';


-------------------------------------------------------------------------------------------------------------
--购买交清保额
--本年度购买交清保额=实际给付红利*1000/趸交净保费率
select round(a.amnt / 1000 * b.BonusFactor * nvl(c.bonusrate, '0'), 2) 当年度基本保额红利,
       decode(d.dt, 1, 0, round(e.amnt / 1000 * nvl(b.jqbonusfactor, 0) * nvl(c.bonusrate, '0'),
                                2))                                    已产生的减额交清红利,
       round(a.amnt / 1000 * b.BonusFactor * nvl(c.bonusrate, '0'), 2) +
       decode(d.dt, 1, 0, round(e.amnt / 1000 * nvl(b.jqbonusfactor, 0) * nvl(c.bonusrate, '0'),
                                2))                                    当年度总和,
       round((round(a.amnt / 1000 * b.BonusFactor * nvl(c.bonusrate, '0'), 2) +
              decode(d.dt, 1, 0, round(e.amnt / 1000 * nvl(b.jqbonusfactor, 0) * nvl(c.bonusrate, '0'),
                                       2))) * 1000 / PUACOST, 2)       当年度减额交清红利
from lcpol a,
     lobonusfactor b,
     BonusRate c,
     PUA_1111004 d,
     lcduty e
where a.riskcode = b.RISKCODE
  and a.riskcode = c.RISKCODE
  and b.INSUREDSEX = a.INSUREDSEX
  and b.InsuYear = a.INSUYEAR
  and b.INSUYEARFLAG = a.INSUYEARFLAG
  and b.PAYENDYEAR = a.PAYENDYEAR
  and b.PAYENDYEARFLAG = a.PAYENDYEARFLAG
  and b.INSUREDAPPAGE = a.INSUREDAPPAGE
  and b.INSUREDAPPAGE = d.AGE
  and b.INSUREDSEX = d.GENDER
  and b.PolYear = d.DT
  and a.contno = e.contno
  and to_date('2028-05-22', 'yyyy-mm-dd') between b.startdate and b.enddate
  and to_date('2028-05-22', 'yyyy-mm-dd') between c.cvalidate and c.enddate
  and b.bonusgrade = 'H'
  and b.annuitygetage = '0'
  and e.DUTYCODE like '%1001'/*dt='1'时注释掉*/
  and d.dt = '3'
  and a.contno = '2026052100002366'
order by d.dt;

select b.*
from lcpol a,
     lobonusfactor b
where a.riskcode = b.RISKCODE
  and b.INSUREDSEX = a.INSUREDSEX
  and b.InsuYear = a.INSUYEAR
  and b.INSUYEARFLAG = a.INSUYEARFLAG
  and b.PAYENDYEAR = a.PAYENDYEAR
  and b.PAYENDYEARFLAG = a.PAYENDYEARFLAG
  and b.INSUREDAPPAGE = a.INSUREDAPPAGE
  and b.BONUSGRADE = 'H'
  and a.contno = '2026052100002366'
order by to_number(POLYEAR);

select a.*
from lobonusfactor a
where RISKCODE = '1111004';

select a.*
from BonusRate a
where riskcode = '1111004'
order by CVALIDATE;

select GETMONEY, JQAMNT, a.*
from LJABonusGet a
where contno = '2026052100002366'
order by makedate, maketime;

--退保
--红利宣告交清基本保险金额应退金额
select round((154.94 + a.amnt) / 1000 * cv2 * (date'2029-06-10' - date'2029-05-22') / 365 +
             (154.94 + a.amnt) / 1000 * cv1 * (1 - (date'2029-06-10' - date'2029-05-22') / 365), 2) cash
from lcduty a,
     PUA_1111004 b,
     lcpol c
where a.contno = c.contno
  and b.age = c.INSUREDAPPAGE
  and b.GENDER = c.INSUREDSEX
  and a.DUTYCODE like '%1001'
  and a.contno = '2026052100002366'
  and b.dt = 4;

--累积交清基本保险金额减保限额
select round(a.AMNT / 1000 * cv2 * (date'2029-12-10' - date'2029-05-22') / 365 +
             a.AMNT / 1000 * cv1 * (1 - (date'2029-12-10' - date'2029-05-22') / 365), 2) cash,
       round(a.amnt * power((1 + 0.0175), (select dt - 1 from dual)), 2) 有效保险金额
from lcduty a,
     PUA_1111004 b,
     lcpol c
where a.contno = c.contno
  and b.age = c.INSUREDAPPAGE
  and b.GENDER = c.INSUREDSEX
  and a.DUTYCODE like '%1001'
  and a.contno = '2026052100002366'
  and b.dt = 15
order by dt;
--累积交清基本保险金额减保后保额  select (1-第t次减保的金额/第t次减保前的现金价值)*第t次减保前的保额 from dual;
select round((1 - 200 / 288.12) * 303.4, 2) 减保后保额
from dual;

--基本保额减保限额
select least(round(a.amnt * 0.2 / a.amnt * ((a.prem / 1000 * b.endcv * (date '2031-06-10' - date '2031-05-22') / 366) +
                                            (a.prem / 1000 * b.begcv *
                                             (366 - (date '2031-06-10' - date '2031-05-22')) / 366)) - 0, 2),
             round(((a.prem / 1000 * b.endcv * (date '2031-06-10' - date '2031-05-22') / 366) +
                    (a.prem / 1000 * b.begcv *
                     (366 - (date '2031-06-10' - date '2031-05-22')) / 366)), 2)) 减保限额
from lcpol a,
     cv_1111004 b,
     lcduty c
where a.insuredsex = b.gender
  and a.insuredappage = b.age
  and a.payendyear = b.pt
  and a.contno = c.contno
  and c.dutycode = 'ID0545'
  and a.contno = '2026052100002366'
  and b.dt = 6;

--减保后保额
select round((1 - 1000 / ((a.prem / 1000 * b.endcv * (date '2031-06-10' - date '2031-05-22') / 365) +
                          (a.prem / 1000 * b.begcv *
                           (365 - (date '2031-06-10' - date '2031-05-22')) / 365))) * 10351.99, 2) 减保后保额
from lcpol a,
     cv_1111004 b,
     lcduty c
where a.insuredsex = b.gender
  and a.insuredappage = b.age
  and a.payendyear = b.pt
  and a.contno = c.contno
  and c.dutycode = 'ID0545'
  and a.contno = '2026052100002366'
  and b.dt = 6;

--减保后保费
select round(9377.56 * 1000 / rate, 2) 减保后保费
from lcpol a,
     rt_1111004 b
where a.insuredsex = b.gender
  and a.insuredappage = b.age
  and a.payendyear = b.pt
  and a.contno = '2026052100002366';


