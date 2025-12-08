select a.*
from lmriskapp a
where riskname in
      ('上海人寿无忧团体意外伤害保险', '上海人寿附加安心无忧团体意外医疗保险', '上海人寿安康团体重大疾病保险',
       '上海人寿附加守护安康住院团体医疗保险')
order by riskcode;

select *
from lccont
where GrpContNo = '3206915150822050'
  and insuredIdno = '350624199001100746';

select a.*
from lcpol a
where GRPCONTNO = '2025120400000366'
order by INSUREDNO, RISKCODE desc;

select *
from lcinsured
where InsuredNo = '1060099098'
  and contplancode is null;