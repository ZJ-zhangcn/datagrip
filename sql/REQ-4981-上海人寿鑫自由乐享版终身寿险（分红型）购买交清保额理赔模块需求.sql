select amnt, a.*
from lcduty a
where contno = '2026010500000506';

--购买交清保额现价
select round(a.AMNT / 1000 * cv2 * (date'2034-01-01' - date'2033-01-06') / 365 +
             a.AMNT / 1000 * cv1 * (1 - (date'2034-01-01' - date'2033-01-06') / 365), 2) 现价,
       round(a.amnt * power(1.0175, dt - 1), 2)                                          比例
from lcduty a,
     PUA_1111002 b,
     lcpol c
where a.contno = c.contno
  and b.age = c.INSUREDAPPAGE
  and b.GENDER = c.INSUREDSEX
  and a.DUTYCODE like '%1001'
  and a.contno = '2026010500000506'
  and b.dt = 8;