select case
           when (select 1
                 from lccont
                 where '1761816233000' = '1761816233000'
                   and contno = '2025102900001486'
                   and exists(select 1
                              from lcpol
                              where contno = '2025102900001486' and riskcode not in ('1013004', '1013005', '1016007'))
                   and (months_between(sysdate, cvalidate) / 12) < 5) = 1 then 0
           when (select 1
                 from lcpol
                 where contno = '2025102900001486'
                   and riskcode not in ('1013004', '1013005', '1016007')
                   and payintv > 0
                   and (paytodate < payenddate or (sysdate < paytodate and paytodate = payenddate))) = 1 then 0
           else 1 end
from dual
