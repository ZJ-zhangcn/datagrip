select distinct contno
  from lcpol a
 where appflag = '1'
   and payintv = '0'
   and (select count(polno) from lcpol where contno = a.contno) >= 2
   and not exists (select 1 from lccontstate where contno = a.contno)
   and cvalidate <= date '2024-09-20'
 order by contno desc;
select appflag,a.* from lcpol a where contno='2022030100055178'
select a.* from lmriskapp a where riskcode in (select riskcode from lcpol a where contno='2020040300012026')

select a.*
  from lcpol a
 where appflag = '4'
   and exists (select 1
          from lccontstate
         where contno = a.contno
           and statetype = 'Terminate'
           and statereason = '01')
   and exists (select 1
          from ljaget c, ljagetdraw b
         where b.actugetno = c.actugetno
           and b.contno = a.contno
           and b.getmoney <> 0
           and b.feefinatype = 'EF'
           and b.feeoperationtype = 'AG')
 order by cvalidate desc

select makedate,a.* from ljagetdraw a where contno='2024081600000116' order by getdate desc;
select contno,
       dutycode,
       getdutycode,
       (select getdutyname from lmdutygetalive where getdutycode = a.getdutycode and getdutykind = a.getdutykind union select distinct getdutyname from lmdutygetclm where getdutycode = a.getdutycode) getdutyname,
       --(select codename from ldcode where codetype = 'bqannuitygetmode' and code = (select annuitygetmode from lcduty where contno=a.contno)) 生存金领取方式,
       gettodate,
       getstartdate,
       getenddate,LiveGetType
  from lcget a
 where contno = '2020040300012026'

select a.* from TEMP_LCPolTransaction a where policyno='2024091800001486';
select Status,a.* from temp_LCLiability a where policyno='2024091800001486'

select a.* from lccontstate a where contno='2024091800001486';