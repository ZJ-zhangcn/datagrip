--t≤PPP，月领未欠缴保费
select a.prem / 1000 * b.endcv *
       power(1 + 0.035,
             (((date '2025-01-01' - date '2024-08-10') - 365) / 365)) +
       greatest(0 - 0, 0)
  from lcpol a, cv_1033028 b
 where a.insuredsex = b.gender
   and a.insuredappage = b.age
   and a.payendyear = b.pt
   and a.contno='2024080900002056'
   and b.dt = 1

--t≤PPP，月领欠缴保费
select a.prem / 1000 * b.endcv -
       (select sum(getmoney)
          from ljagetdraw
         where contno = a.contno
           and getdate between date '2025-08-10' and date '2025-10-01')
  from lcpol a, cv_1033028 b
 where a.insuredsex = b.gender
   and a.insuredappage = b.age
   and a.payendyear = b.pt
   and a.contno = '2024080900002056'
   and b.dt = 1

--t>PPP，月领欠缴保费
select a.prem / 1000 * b.endcv -
       (select nvl(sum(getmoney),0)
          from ljagetdraw
         where contno = a.contno
           and getdate between date '2026-08-10' and date '2027-08-10')
  from lcpol a, cv_1033028 b
 where a.insuredsex = b.gender
   and a.insuredappage = b.age
   and a.payendyear = b.pt
   and a.contno = '2024080900002056'
   and b.dt = 2

--t>PPP，月领未欠缴保费
select (a.prem / 1000 * b.endcv * (date '2027-10-01' - date '2027-08-10') / 366) +
       (a.prem / 1000 * b.begcv *
       (366 - (date '2027-10-01' - date '2027-08-10')) / 366) +
       greatest((a.amnt * 1.8 * 3 -
                (select nvl(sum(getmoney), 0)
                    from ljagetdraw
                   where contno = a.contno
                     and getdate between date '2027-08-10' and date
                   '2027-10-01')),
                0)
  from lcpol a, cv_1033028 b
 where a.insuredsex = b.gender
   and a.insuredappage = b.age
   and a.payendyear = b.pt
   and a.contno = '2024080900002056'
   and b.dt = 4

--t≤PPP，年领未欠缴保费
select a.prem / 1000 * b.endcv *
       power(1 + 0.035,
             (((date '2024-10-01' - date '2024-08-17') - 365) / 365))
  from lcpol a, cv_1033028 b
 where a.insuredsex = b.gender
   and a.insuredappage = b.age
   and a.payendyear = b.pt
   and a.contno='2024081600000576'
   and b.dt = 1

--t≤PPP，年领欠缴保费
select a.prem / 1000 * b.endcv -
       (select nvl(sum(getmoney), 0)
          from ljagetdraw
         where contno = a.contno
           and getdate between date '2025-08-10' and date '2025-10-01')
  from lcpol a, cv_1033028 b
 where a.insuredsex = b.gender
   and a.insuredappage = b.age
   and a.payendyear = b.pt
   and a.contno = '2024080900002186'
   and b.dt = 1

--t>PPP，年领欠缴保费
select a.prem / 1000 * b.endcv -
       (select nvl(sum(getmoney), 0)
          from ljagetdraw
         where contno = a.contno
           and getdate between date '2026-08-10' and date '2028-10-01')
  from lcpol a, cv_1033028 b
 where a.insuredsex = b.gender
   and a.insuredappage = b.age
   and a.payendyear = b.pt
   and a.contno = '2024080900002186'
   and b.dt = 2

--t>PPP，年领未欠缴保费
select (a.prem / 1000 * b.endcv * (date '2043-08-01' - date '2042-08-14') / 365) +
       (a.prem / 1000 * b.begcv *
       (365 - (date '2043-08-01' - date '2042-08-14')) / 365)
  from lcpol a, cv_1033028 b
 where a.insuredsex = b.gender
   and a.insuredappage = b.age
   and a.payendyear = b.pt
   and a.contno = '2024081300011316'
   and b.dt = 19
