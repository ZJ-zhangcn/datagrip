select a.* from lmriskapp a where riskname = '上海人寿大金刚个人综合意外伤害保险'--1075001
select a.* from lmriskapp a where riskname = '上海人寿附加团体工伤意外医疗保险'--2062014

select a.* from lcpol a where riskcode='1075001' and appflag='1' order by cvalidate desc;
select distinct grpcontno, contno
  from lcpol a
 where riskcode = '2062014'
   and appflag = '1'
   and cvalidate <= date '2024-08-28'
   and exists (select 1
          from lcget
         where contno = a.contno
           and dutycode = 'GD1011')
 order by grpcontno desc; --2023092100000156

select signdate,cvalidate,a.* from lcpol a where contno='130011000504817'
select signdate,a.* from lccont a where contno='2023041200000966'

select riskcode,signdate,a.* from lcpol a where grpcontno='2023092100000156' and riskcode='2062014'


select a.* from lmduty a where dutycode in (select dutycode from lmriskduty where riskcode = '2062014')

select contno,
       dutycode,
       getdutycode,
       (select getdutyname from lmdutygetalive where getdutycode = a.getdutycode and getdutykind = a.getdutykind union select distinct getdutyname from lmdutygetclm where getdutycode = a.getdutycode) getdutyname,
       --(select codename from ldcode where codetype = 'bqannuitygetmode' and code = (select annuitygetmode from lcduty where contno=a.contno)) 生存金领取方式,
       gettodate,
       getstartdate,
       getenddate,LiveGetType
  from lcget a
 where contno = '2024041700000386'

select a.* from TEMP_LCPolTransaction a where policyno='2024041700000386'
select AllowanceType,a.* from temp_LCLiability a where policyno='130011000504817'
