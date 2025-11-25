select a.* from lcpol a where appntname like '%银保投保%' and a.insuredappage<18 

select a.* from lcpol a where contno='2023051100000986'
select a.* from lcappnt a where contno='2023051100000986'
select a.* from lcinsured a where contno='2024082000000176'
select a.* from lcaddress a where customerno in (select appntno from lcappnt  where contno='2023051100000986')
select a.* from lcaddress a where customerno in (select insuredno from lcinsured  where contno='2024082000000176')

select a.* from lmriskapp a where riskcode='1051016'
select * from ldcode where codetype = 'QuickRisk' and comcode = 'Y'--2024082000000176  1051016;
select a.*
  from lcpol a
 where appflag = '1'
      /*and riskcode in (select code
       from ldcode
      where codetype = 'QuickRisk'
        and comcode = 'Y')*/
   and insuredappage < 18
   and not exists
 (select 1 from lcconthangupstate where contno = a.contno)
   and grpcontno = '00000000000000000000'
   and not exists (select 1
          from lccontstate
         where statetype = 'Available'
           and enddate is not null
           and contno = a.contno)
   and not exists (select 1
          from lccontstate
         where statetype = 'DefedPay'
           and contno = a.contno)
 order by cvalidate desc

select a.appntname,a.idtype,a.idno,b.mobile,idstdate,idexpdate from lcappnt a,lcaddress b where a.appntno=b.customerno and a.addressno=b.addressno and a.contno='2024082000000176'

select a.* from lcappnt a where contno='2020100900028278'

 SELECT *
   FROM ldcriticalillness a, ldcode1 b
  WHERE 1 = 1
    and a.cicode = b.code1
    and b.code like '1056006%'
  ORDER BY cicode

select a.* from ldcode a where;