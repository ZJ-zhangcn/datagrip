select round(86540 / 1000 * 12.94 * 1.2, 2) 基本保险金额红利
from dual;--1343.79

select round(1343.79 * 1000 / 1008.9357, 2) 累积购买交情保额
from dual;--1331.89

select round(100000 / 1000 * 946.52 * (date '2031-01-20' - date '2031-01-01') / 365 +
             100000 / 1000 * 915.37 * (1 - (date '2031-01-20' - date '2031-01-01') / 365), 2) cash
from dual;--91699.15

select least(round(86540 * 0.2 / 86540 * 91699.15 - 0, 2), 91699.15) 基本保额限额
from dual;--18339.83

select round((1 - 10000 / 91699.15) * 86540, 2) 减保后保额
from dual;

select round(1331.89 / 1000 * 916.68 * (date '2031-01-20' - date '2031-01-01') / 365 +
             1331.89 / 1000 * 884.42 * (1 - (date '2031-01-20' - date '2031-01-01') / 365), 2) 购买交清保额限额
from dual;--1180.19

select a.*
from BONUSRATE a
where riskcode = '1116002';

select a.*
from lcduty a
where contno = '2025123100000396';

select GETMONEY, JQAMNT, a.*
from LJABONUSGET a
where contno = '2025123100000396';

select amnt, a.*
from lcpol a
where contno = '2025123100000396';

select case
           when (0 = 0 and 2 <= 1) or (0 = 12 and 2 <= 1000 and 2 in ('1', '2')) then
               100000.0 / 1000 * c.endcv *
               power((1 + 0.0375), (0.052054794520547946 - 1))
           when (0 = 0 and 2 > 1) or (0 = 12 and 2 > 1000 and 2 in ('1', '2')) then
               100000.0 / 1000 *
               (c.endcv * 0.052054794520547946 + c.begcv * (1 - 0.052054794520547946))
           when 0 = 12 and 2 = 0 then
               100000.0 / 1000 * c.endcv
           else 0 end
from CV_1116002 c
where c.gender = (select insuredsex from lcpol where polno = '210010000408333')
  and c.age = (select insuredappage from lcpol where polno = '210010000408333')
  and c.pt = '1000'
  and c.dt = '2'