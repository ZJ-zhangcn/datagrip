select case
           when to_date('2028-12-06', 'yyyy-mm-dd') >= to_date('2025-11-06', 'yyyy-mm-dd') then
               greatest(
                       (case
                            when exists (select 1
                                         from lcpol
                                         where polno = '210310000005221'
                                           and (payintv = 0 or (payintv = 12 and (paytodate = payenddate or
                                                                                  (paytodate < payenddate and
                                                                                   paytodate >
                                                                                   to_date('2028-12-06', 'yyyy-mm-dd'))))))
                                then
                                (select 2203.76 / 1000 * (p.cv2 * 0.0821917808219178 + p.cv1 * (1 - 0.0821917808219178))
                                 from PUA_1113004 p
                                 where p.age = '46'
                                   and p.gender = '1'
                                   and p.dt = '4')
                            when exists (select 1
                                         from lcpol
                                         where polno = '210310000005221'
                                           and payintv = 12
                                           and paytodate < to_date('2028-12-06', 'yyyy-mm-dd')
                                           and paytodate < payenddate) then
                                (select 2203.76 / 1000 * p.cv2
                                 from PUA_1113004 p
                                 where p.age = '46'
                                   and p.gender = '1'
                                   and p.dt = '4')
                           end
                           ),
                       2203.76 * power((1 + 0.0175), 4 - 1)
               )
           else (case
                     when exists (select 1
                                  from lcpol
                                  where polno = '210310000005221'
                                    and (payintv = 0 or (payintv = 12 and (paytodate = payenddate or
                                                                           (paytodate < payenddate and paytodate >
                                                                                                       to_date('2028-12-06', 'yyyy-mm-dd'))))))
                         then
                         (select 2203.76 / 1000 * (p.cv2 * 0.0821917808219178 + p.cv1 * (1 - 0.0821917808219178))
                          from PUA_1113004 p
                          where p.age = '46'
                            and p.gender = '1'
                            and p.dt = '4')
                     when exists (select 1
                                  from lcpol
                                  where polno = '210310000005221'
                                    and payintv = 12
                                    and paytodate < to_date('2028-12-06', 'yyyy-mm-dd')
                                    and paytodate < payenddate) then
                         (select 2203.76 / 1000 * p.cv2
                          from PUA_1113004 p
                          where p.age = '46'
                            and p.gender = '1'
                            and p.dt = '4')
               end
               )
           end
from dual