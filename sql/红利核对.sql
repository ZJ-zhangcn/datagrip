--红利核对
--红利因子表
select BONUSFACTOR, JQBONUSFACTOR, a.*
from lobonusfactor a,
     lcpol b
where a.PAYENDYEAR = b.PAYENDYEAR
  and a.INSUREDSEX = b.INSUREDSEX
  and a.INSUREDAPPAGE = b.INSUREDAPPAGE
  and a.RISKCODE = b.RISKCODE
  and a.BONUSGRADE = 'H'
  and b.contno = '2026010700000166'
order by POLYEAR;

--红利 k 值
select a.*
from BonusRate a,
     lcpol b
where a.riskcode = b.RISKCODE
  and b.contno = '2026010700000166';

--购买交清红利
select a.*
from PUA_1116002 a,
     lcpol b
where a.GENDER = b.INSUREDSEX
  and a.AGE = b.INSUREDAPPAGE
  and b.contno = '2026010700000166'
order by dt;

--保单责任
select dutycode,
       getdutycode,
       (select getdutyname
        from lmdutygetalive
        where getdutycode = a.getdutycode
          and getdutykind = a.getdutykind
        union
        select distinct getdutyname
        from lmdutygetclm
        where getdutycode = a.getdutycode) getdutyname,
       a.*
from lcget a
where contno = '2026010700000166';