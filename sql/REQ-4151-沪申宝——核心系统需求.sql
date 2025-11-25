select a.* from lmriskapp a where riskname like '%沪申宝%' 

select 330.66*prem/1000,amnt from lcpol a where contno='2024052800000116'

select 0*prem/1000*316/365+0*prem/1000*(365-316)/365+amnt-11*0.085*amnt from lcpol a where contno='2024052800000116'

select 241.47*12-241.47*12*0.085*11 from lcpol where contno='2024052800000116'

select 1317.45*prem/1000*power(1.05,(0-365)/365) from lcpol where contno='2024061900000186'

select 976.62*prem/1000*5/365+930.17*prem/1000*360/365 from lcpol where contno='2024060400000986'

select 1317.45*prem/1000-0 from lcpol where contno='2024061900000186'

select 541.83*prem/1000*power(1.05,(210-365)/365)+0 from lcpol where contno='2024060400000986'

select 541.83*prem/1000-0 from lcpol where contno='2024060400001716'

select 541.83*prem/1000-0 from lcpol where contno='2024060400001716'

select contno,prtno,makedate from lccont where prtno='5000118340528049';
select a.* from lcinsured a where contno='2024053000000426'
select a.* from ldperson a where customerno='1060093458'
select a.* from lcpol a where contno='2024061900000186'

select insuredappage,payendyear,insuredsex,a.* from lcpol a where contno='2024052800000116'

select a.contno      保单号,
       a.riskcode    险种编码,
       a.insuredappage as 被保人年龄,
       a.cvalidate   生效日期,
       a.payintv     交费方式,
       a.payendyear  交费期间,
       b.annuitygetage||'-周岁' as 年金领取起始时间,
       b.insugetmode as 保至年金领取后XX年,
       b.getyearmode as 后台保证领取期间,
       b.insuyear as 保险期间,
       b.enddate as 终止日期,
       c.getdutycode ||'-'|| (select getdutyname from lmdutyget where getdutycode = c.getdutycode) 给付责任,
       c.getstartdate 给付起领日期,
       c.getenddate 给付止领日期
  from lcpol a, lcduty b, lcget c
 where a.contno = b.contno
   and b.contno = c.contno
   and a.contno = '2023101500000686';
select insuyear,a.* from lcpol a where contno='2024100100000456'
select insuyear,a.* from lcduty a where contno='2024100100000456';