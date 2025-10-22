select appflag,a.* from lcpol a where contno='2025043000000586';
select appflag,a.* from lccont a where contno='2025043000000586';
select sumpay,insuaccbala,baladate,a.* from lcinsureacc a where contno='2025043000000586';
select sumpay,insuaccbala,baladate,a.* from lcinsureaccclass a where contno='2025043000000586';
select a.* from lcinsureacctrace a where contno='2025043000000586' order by paydate desc;
select fee/*fee=feetrace表删除续期数据后的总和*/,baladate,a.* from lcinsureaccfee a where contno='2025043000000586';
select fee,baladate,a.* from lcinsureaccclassfee a where contno='2025043000000586';
select a.* from lcinsureaccfeetrace a where contno='2025043000000586' order by paydate desc;
select a.* from ljsget a where otherno='2025043000000586';
select a.* from ljsgetdraw a where contno='2025043000000586';
select a.* from ljaget a where otherno='2025043000000586';
select a.* from ljagetdraw a where contno='2025043000000586' order by getdate desc;
select a.* from lccontstate a where contno='2025043000000586';
select a.* from loprtmanager a where otherno='2025043000000586' order by standbyflag2 desc;
--lcget
select contno,
       dutycode,
       getdutycode,
       (select getdutyname from lmdutygetalive where getdutycode = a.getdutycode and getdutykind = a.getdutykind union select distinct getdutyname from lmdutygetclm where getdutycode = a.getdutycode) getdutyname,
       (select codename from ldcode where codetype = 'bqannuitygetmode' and code = (select annuitygetmode from lcduty where contno=a.contno)) 生存金领取方式,
       gettodate,
       getstartdate,
       getenddate
  from lcget a
 where contno = '2025043000000586';

select a.* from lcget a where contno = '2025043000000586';