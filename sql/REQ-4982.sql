-- ID: REQ-4982
-- 标题: 臻鑫传家终身寿险（分红型）购买交清保额理赔模块需求

select riskcode, a.*
from lcpol a
where contno = '2026012900000586';

select amnt, a.*
from lcduty a
where contno = '2026012900000586';

--购买交清保额现价
select round(a.AMNT / 1000 * cv2 * (date'2027-04-01' - date'2027-01-30') / 365 +
             a.AMNT / 1000 * cv1 * (1 - (date'2027-04-01' - date'2027-01-30') / 365), 2) 现价,
       round(a.amnt * power(1.0175, dt - 1), 2)                                          比例
from lcduty a,
     PUA_1113002 b,
     lcpol c
where a.contno = c.contno
  and b.age = c.INSUREDAPPAGE
  and b.GENDER = c.INSUREDSEX
  and a.DUTYCODE like '%1001'
  and a.contno = '2026012900000586'
  and b.dt = 2;