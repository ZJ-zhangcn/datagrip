select greatest(round(a.AMNT / 1000 * cv2 * (date'2028-12-06' - date'2028-11-06') / 365 +
                      a.AMNT / 1000 * cv1 * (1 - (date'2028-12-06' - date'2028-11-06') / 365), 2),
                round(a.AMNT * power(1.0175, b.dt - 1), 2)) cash
from lcduty a,
     PUA_1113004 b,
     lcpol c
where a.contno = c.contno
  and b.age = c.INSUREDAPPAGE
  and b.GENDER = c.INSUREDSEX
  and a.DUTYCODE like '%1001'
  and a.contno = '2025110500000666'
  and b.dt = 4;


select a.* from lduser a where USERNAME='¿Ì≈‚ ‹¿Ì'