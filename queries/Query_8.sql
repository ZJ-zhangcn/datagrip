select case
           when (0 = 0 and 6 <= 1) or (0 = 12 and 6 <= 1000 and 2 in ('1', '2')) then
               100000.0 / 1000 * c.endcv *
               power((1 + 0.0375), (0.16712328767123288 - 1))
           when (0 = 0 and 6 > 1) or (0 = 12 and 6 > 1000 and 2 in ('1', '2')) then
               100000.0 / 1000 *
               (c.endcv * 0.16712328767123288 + c.begcv * (1 - 0.16712328767123288))
           when 0 = 12 and 2 = 0 then
               100000.0 / 1000 * c.endcv
           else 0 end
from CV_1113004 c
where c.gender = (select insuredsex from lcpol where polno = '210010000408166')
  and c.age = (select insuredappage from lcpol where polno = '210010000408166')
  and c.pt = '1000'
  and c.dt = '6';


select round(a.amnt * 0.2 / a.amnt * round((a.prem / 1000 * b.endcv * (DATE '2030-12-30' - DATE '2030-10-30') / 365) +
             (a.prem / 1000 * b.begcv *
              (365 - (DATE '2030-12-30' - DATE '2030-10-30')) / 365), 2) - 0, 2) оч╤Н
from dual;
