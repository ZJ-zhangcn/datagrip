select appntname,idtype,idno,idexpdate from lcappnt a where contno='2015070100000218' 
--select idexpdate,birthday from lcinsured a where contno='2024072300004256' --1983;
select a.* from lcpol a where contno='2024072300004256'
select a.* from lcpol a where appntname = '兴业投保' and cvalidate=date'2024-06-04' and appflag='1'

select appflag,customgetpoldate,a.* from lccont a where contno='2024072300004386'

select a.* from lccontstate a where contno='2024072300004256'

select contno,
       dutycode,
       getdutycode,
       (select getdutyname from lmdutygetalive where getdutycode = a.getdutycode and getdutykind = a.getdutykind union select distinct getdutyname from lmdutygetclm where getdutycode = a.getdutycode) getdutyname,
       (select codename from ldcode where codetype = 'bqannuitygetmode' and code = (select annuitygetmode from lcduty where contno=a.contno)) 生存金领取方式,
       gettodate,
       getstartdate,
       getenddate,LiveGetType
  from lcget a
 where contno = '2024072300004386';
select a.* from ljsgetdraw a where contno='2024072300004386'
select a.* from ljagetdraw a where contno='2024072300004386'


select a.* from LMDutyGetalive a where GETDUTYCODE='IG0814';