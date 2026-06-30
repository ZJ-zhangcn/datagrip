--红利核对
--红利因子表
select bonusfactor, jqbonusfactor, a.*
from lobonusfactor a,
     lcpol b
where a.payendyear = b.payendyear
  and a.insuredsex = b.insuredsex
  and a.insuredappage = b.insuredappage
  and a.riskcode = b.riskcode
  and a.bonusgrade = 'H'
  and b.contno = '2026010700000166'
order by polyear;

--红利 k 值
select a.*
from bonusrate a,
     lcpol b
where a.riskcode = b.riskcode
  and b.contno = '2026010700000166';

--购买交清红利
select a.*
from pua_1116002 a,
     lcpol b
where a.gender = b.insuredsex
  and a.age = b.insuredappage
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