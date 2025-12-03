select a.* from LISDATA.LJSGET a where otherno='2025111200000296';
select a.* from LISDATA.LJSGETDRAW a where contno='2025111200000296';

select a.amnt + b.amnt
from lcpol a,
     lcduty b
where a.contno = b.contno
  and LENGTH(dutycode) = 10
  and a.contno = '2025111200000296';