select case
           when exists (select 1
                        from lcpol
                        where polno = '210010000408223'
                          and (payintv = 0 or (payintv = 12 and (paytodate = payenddate or (paytodate < payenddate and
                                                                                            paytodate >
                                                                                            to_date('2030-12-10', 'yyyy-mm-dd'))))))
               then (select 492.47 / 1000 * (p.cv2 * 0.07397260273972603 + p.cv1 * (1 - 0.07397260273972603))
                     from PUA_1136003 p
                     where p.age = '80'
                       and p.gender = '0'
                       and p.dt = '6')
           when exists (select 1
                        from lcpol
                        where polno = '210010000408223'
                          and payintv = 12
                          and paytodate < to_date('2030-12-10', 'yyyy-mm-dd')
                          and paytodate < payenddate)
               then (select 492.47 / 1000 * p.cv2
                     from PUA_1136003 p
                     where p.age = '80'
                       and p.gender = '0'
                       and p.dt = '6')
           else 0 end
from dual