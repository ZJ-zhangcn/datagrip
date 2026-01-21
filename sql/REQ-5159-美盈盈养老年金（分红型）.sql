select round(b.prem / 1000 * ENDCV * (date '2036-01-01' - date '2035-01-09') / 365 +
             b.prem / 1000 * BEGCV * (1 - (date '2036-01-01' - date '2035-01-09') / 365)/* +
           greatest(b.amnt - round(b.amnt * 0.0841 * 0, 2), 0)*/, 2) 现价,
       (select SUMPREM from lcprem where contno = b.contno)          已交保费
from cv_1131003 a,
     lcpol b,
     lcduty c
where a.AGE = b.INSUREDAPPAGE
  and a.GENDER = b.INSUREDSEX
  and a.pt = b.PAYENDYEAR
  and a.ANNUITYGETAGE = c.ANNUITYGETAGE
  and b.CONTNO = c.CONTNO
  and b.contno = '2026010900000366'
  and dt = '10'
order by dt;


select a.*
from ljaget a
where otherno = '2026010900000186';

select a.*
from LISDATA.LYSENDTOBANK a
where polno = '2026010900000186';

select (300 - 14) * amnt * 0.0841
from lcpol a
where contno = '2026010900000366';

select a.*
from LISDATA.LJSGETDRAW a
where contno = '2026012000002426'
order by getdate;

select a.*
from ldperson a
where name like '%个险投保%'
order by CUSTOMERNO desc;

select a.*
from ljaget a
where otherno = '2026012100000506';

select a.*
from ljagetb a
where otherno = '2026012100000506';