-- id: req-5091
-- 标题: 团单被保险人主险险种存储及增加主险校验的需求

select a.*
from lmriskapp a
where riskname in
      ('上海人寿无忧团体意外伤害保险', '上海人寿附加安心无忧团体意外医疗保险', '上海人寿安康团体重大疾病保险',
       '上海人寿附加守护安康住院团体医疗保险')
order by riskcode;

select *
from lccont
where grpcontno = '3206915150822050'
  and insuredidno = '350624199001100746';

select a.*
from lcpol a
where grpcontno = '2025120400000366'
order by insuredno, riskcode desc;

select *
from lcinsured
where insuredno = '1060099098'
  and contplancode is null;