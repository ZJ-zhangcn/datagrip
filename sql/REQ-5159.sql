-- id: req-5159
-- 标题: 美盈盈养老年金（分红型）

select round(b.prem / 1000 * endcv * (date '2036-01-01' - date '2035-01-09') / 365 +
             b.prem / 1000 * begcv * (1 - (date '2036-01-01' - date '2035-01-09') / 365)/* +
           greatest(b.amnt - round(b.amnt * 0.0841 * 0, 2), 0)*/, 2) 现价,
       (select sumprem from lcprem where contno = b.contno)          已交保费
from cv_1131003 a,
     lcpol b,
     lcduty c
where a.age = b.insuredappage
  and a.gender = b.insuredsex
  and a.pt = b.payendyear
  and a.annuitygetage = c.annuitygetage
  and b.contno = c.contno
  and b.contno = '2026010900000366'
  and dt = '10'
order by dt;


select a.*
from ljaget a
where otherno = '2026010900000186';

select a.*
from lisdata.lysendtobank a
where polno = '2026010900000186';

select (300 - 14) * amnt * 0.0841
from lcpol a
where contno = '2026010900000366';

select a.*
from lisdata.ljsgetdraw a
where contno = '2026012000002426'
order by getdate;

select a.*
from ldperson a
where name like '%个险投保%'
order by customerno desc;

select a.*
from ljaget a
where otherno = '2026012100000506';

select a.*
from ljagetb a
where otherno = '2026012100000506';