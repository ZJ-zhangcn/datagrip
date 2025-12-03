select *
from LDPubRate
where CalType = '000005'
  and riskcode = '1033033'
  and RLType = 'R'
  and SCType = 'C'
  and YMDinterest = 'Y'
 -- and StartDate <= to_date('2069-06-13', 'yyyy-mm-dd')
  --and EndDate >= to_date('2069-06-13', 'yyyy-mm-dd')
  and Currency = '01'
  and state = '1'