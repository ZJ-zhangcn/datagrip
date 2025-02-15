--退保
--t≤ppp，月领未欠缴保费
select a.prem / 1000 * b.endcv *
       power(1 + 0.045,
             (((date '2024-10-01' - date '2024-08-30') - 365) / 365)) +
       greatest(0 - 0, 0)
  from lcpol a, cv_1036003 b, lcduty c
 where insumode = c.insugetmode
   and a.insuredsex = b.gender
   and a.insuredappage = b.age
   and a.payendyear = b.pt
   and b.getyear = c.annuitygetage
   and b.getyearmode = c.getyearmode
   and a.polno = c.polno
   and a.contno = '2024082900000256'
   and b.dt = 1

--t≤PPP，月领欠缴保费
select a.prem / 1000 * b.endcv -
       (select nvl(sum(getmoney),0)
          from ljagetdraw
         where contno = a.contno
           and getdate between date '2025-08-18' and date '2025-10-01')
  from lcpol a, cv_1036003 b, lcduty c
 where insumode = c.insugetmode
   and a.insuredsex = b.gender
   and a.insuredappage = b.age
   and a.payendyear = b.pt
   and b.getyear = c.annuitygetage
   and b.getyearmode = c.getyearmode
   and a.polno = c.polno
   and a.contno = '2024081700004256'
   and b.dt = 1

--t>PPP，月领欠缴保费
select a.prem / 1000 * b.endcv -
       (select nvl(sum(getmoney),0)
          from ljagetdraw
         where contno = a.contno
           and getdate between date '2026-08-18' and date '2027-10-01')
  from lcpol a, cv_1036003 b, lcduty c
 where insumode = c.insugetmode
   and a.insuredsex = b.gender
   and a.insuredappage = b.age
   and a.payendyear = b.pt
   and b.getyear = c.annuitygetage
   and b.getyearmode = c.getyearmode
   and a.polno = c.polno
   and a.contno = '2024081700004256'
   and b.dt = 2

--t>PPP，月领未欠缴保费
select (a.prem / 1000 * b.endcv * (date '2033-10-01' - date '2033-08-18') / 366) +
       (a.prem / 1000 * b.begcv *
       (366 - (date '2033-10-01' - date '2033-08-18')) / 366) +
       greatest((a.amnt  -
                (select nvl(sum(getmoney), 0)
                    from ljagetdraw
                   where contno = a.contno
                     and getdate between date '2033-08-18' and date
                   '2033-10-01')),
                0)
  from lcpol a, cv_1036003 b, lcduty c
 where insumode = c.insugetmode
   and a.insuredsex = b.gender
   and a.insuredappage = b.age
   and a.payendyear = b.pt
   and b.getyear = c.annuitygetage
   and b.getyearmode = c.getyearmode
   and a.polno = c.polno
   and a.contno = '2024081700004256'
   and b.dt = 10

--t≤PPP，年领未欠缴保费
select a.prem / 1000 * b.endcv *
       power(1 + 0.045,
             (((date '2024-10-01' - date '2024-08-18') - 365) / 365))
  from lcpol a, cv_1036003 b, lcduty c
 where insumode = c.insugetmode
   and a.insuredsex = b.gender
   and a.insuredappage = b.age
   and a.payendyear = b.pt
   and b.getyear = c.annuitygetage
   and b.getyearmode = c.getyearmode
   and a.polno = c.polno
   and a.contno='2024081700004486'
   and b.dt = 1

--t≤PPP，年领欠缴保费
select a.prem / 1000 * b.endcv -
       (select nvl(sum(getmoney), 0)
          from ljagetdraw
         where contno = a.contno
           and getdate between date '2025-08-18' and date '2025-10-01')
  from lcpol a, cv_1036003 b, lcduty c
 where insumode = c.insugetmode
   and a.insuredsex = b.gender
   and a.insuredappage = b.age
   and a.payendyear = b.pt
   and b.getyear = c.annuitygetage
   and b.getyearmode = c.getyearmode
   and a.polno = c.polno
   and a.contno = '2024081700004486'
   and b.dt = 1

--t>PPP，年领欠缴保费
select a.prem / 1000 * b.endcv -
       (select nvl(sum(getmoney), 0)
          from ljagetdraw
         where contno = a.contno
           and getdate between date '2026-08-18' and date '2028-10-01')
  from lcpol a, cv_1036003 b, lcduty c
 where insumode = c.insugetmode
   and a.insuredsex = b.gender
   and a.insuredappage = b.age
   and a.payendyear = b.pt
   and b.getyear = c.annuitygetage
   and b.getyearmode = c.getyearmode
   and a.polno = c.polno
   and a.contno = '2024081700004486'
   and b.dt = 2

--t>PPP，年领未欠缴保费
select (a.prem / 1000 * b.endcv * (date '2034-08-18' - date '2034-08-18') / 365) +
       (a.prem / 1000 * b.begcv *
       (365 - (date '2034-08-18' - date '2034-08-18')) / 365)
  from lcpol a, cv_1036003 b, lcduty c
 where insumode = c.insugetmode
   and a.insuredsex = b.gender
   and a.insuredappage = b.age
   and a.payendyear = b.pt
   and b.getyear = c.annuitygetage
   and b.getyearmode = c.getyearmode
   and a.polno = c.polno
   and a.contno = '2024081700004486'
   and b.dt = 11
