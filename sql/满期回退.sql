select appflag,a.*,rowid from lcpol a where contno='2024061400002426';
select appflag,a.*,rowid from lccont a where contno='2024061400002426';

select sumpay,insuaccbala,baladate,a.*,rowid from lcinsureacc a where contno='2024061400002426';
select sumpay,insuaccbala,baladate,a.*,rowid from lcinsureaccclass a where contno='2024061400002426';
select a.*,rowid from lcinsureacctrace a where contno='2024061400002426' order by paydate desc;

select fee/*fee=feetrace表删除续期数据后的总和*/,baladate,a.*,rowid from lcinsureaccfee a where contno='2024061400002426';
select fee,baladate,a.*,rowid from lcinsureaccclassfee a where contno='2024061400002426';
select a.*,rowid from lcinsureaccfeetrace a where contno='2024061400002426' order by paydate desc;

select a.*,rowid from ljsget a where otherno='2024061400002426';
select a.*,rowid from ljsgetdraw a where contno='2024061400002426';
select a.*,rowid from ljaget a where otherno='2024061400002426';
select a.*,rowid from ljagetdraw a where contno='2024061400002426' order by getdate desc;

select a.*,rowid from lccontstate a where contno='2024061400002426';

select a.*,rowid from loprtmanager a where otherno='2024061400002426' order by standbyflag2 desc;

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
 where contno = '2024061400002426'
 for update;

