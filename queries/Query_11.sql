select case
           when to_date('2026-12-01', 'yyyy-mm-dd') >= to_date('2028-11-01', 'yyyy-mm-dd') and
                to_date('2026-12-01', 'yyyy-mm-dd') >= to_date('2026-11-01', 'yyyy-mm-dd') then
               greatest(
                       (case
                            when exists (select 1
                                         from lcpol
                                         where polno = '210010000408178'
                                           and (payintv = 0 or (payintv = 12 and (paytodate = payenddate or
                                                                                  (paytodate < payenddate and
                                                                                   paytodate >
                                                                                   to_date('2026-12-01', 'yyyy-mm-dd'))))))
                                then
                                (select 1530.05 / 1000 * (p.cv2 * 0.0821917808219178 + p.cv1 * (1 - 0.0821917808219178))
                                 from PUA_1113004 p
                                 where p.age = '15'
                                   and p.gender = '0'
                                   and p.dt = '2')
                            when exists (select 1
                                         from lcpol
                                         where polno = '210010000408178'
                                           and payintv = 12
                                           and paytodate < to_date('2026-12-01', 'yyyy-mm-dd')
                                           and paytodate < payenddate) then
                                (select 1530.05 / 1000 * p.cv2
                                 from PUA_1113004 p
                                 where p.age = '15'
                                   and p.gender = '0'
                                   and p.dt = '2')
                           end
                           ),
                       1530.05 * power((1 + 0.02), 2 - 1)
               )
           else (case
                     when exists (select 1
                                  from lcpol
                                  where polno = '210010000408178'
                                    and (payintv = 0 or (payintv = 12 and (paytodate = payenddate or
                                                                           (paytodate < payenddate and paytodate >
                                                                                                       to_date('2026-12-01', 'yyyy-mm-dd'))))))
                         then
                         (select 1530.05 / 1000 * (p.cv2 * 0.0821917808219178 + p.cv1 * (1 - 0.0821917808219178))
                          from PUA_1113004 p
                          where p.age = '15'
                            and p.gender = '0'
                            and p.dt = '2')
                     when exists (select 1
                                  from lcpol
                                  where polno = '210010000408178'
                                    and payintv = 12
                                    and paytodate < to_date('2026-12-01', 'yyyy-mm-dd')
                                    and paytodate < payenddate) then
                         (select 1530.05 / 1000 * p.cv2
                          from PUA_1113004 p
                          where p.age = '15'
                            and p.gender = '0'
                            and p.dt = '2')
               end
               )
           end
from dual