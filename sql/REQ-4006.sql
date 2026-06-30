-- id: req-4006
-- 标题: 稳赢添添长赢版二期需求

select * from lmdutygetclm where getdutycode='IG0797' and getdutykind='103';

select a.* from ldcode a where codetype = 'getdutykind' and code like '%03';

select a.* from loprtmanager a where otherno='2024032500000126';

select * from llcaseinfo where clmno='3631815101009908';

select a.* from lcpol a where contno='2024022000001426';

select printcount,inputoperator,a.* from lccont a where contno='2024030100000416';

select a.* from lmriskapp a where riskcode='1333006';

select a.* from ldtask a where taskdescribe like '%生存金%';

select a.* from es_doc_main a where doccode='3631815101009916';

select a.* from ljspay a where otherno='2024022000001426';

select a.* from ljsget a where otherno='2024032500000306';

select a.* from ljsgetdraw a where contno='2024032500000306' order by a.getdate desc;

select a.* from ljaget a where otherno='2024032000000266';

select getdutycode,feeoperationtype,feefinatype,getmoney,getdate,a.* from ljagetdraw a where contno='2024032500000126' order by a.getdate desc,a.modifydate desc,a.modifytime desc;

select getdutycode,moneytype,paydate,a.* from lcinsureacctrace a where contno='2024012300000696' /*and getdutycode='IG0797' and moneytype='YFLX'*/ order by a.paydate desc,a.modifydate desc,a.modifytime desc;

select a.* from lcinsureacc a where contno='2024012300000696';

select a.* from lcinsureaccclass a where contno='2024012300000696' order by accfounddate desc,modifytime desc;

--lcget
select contno,
       dutycode,
       getdutycode,
       (select getdutyname from lmdutygetalive where getdutycode = a.getdutycode and getdutykind = a.getdutykind union select distinct getdutyname from lmdutygetclm where getdutycode = a.getdutycode) getdutyname,
       --(select codename from ldcode where codetype = 'bqannuitygetmode' and code = (select annuitygetmode from lcduty where contno=a.contno)) 生存金领取方式,
       gettodate,
       getstartdate,
       getenddate,
       livegettype
  from lcget a
 where contno = '2024022000001426';

select a.* from lmrisksort a where riskcode='1033024';

select a.* from cv_1033024 a;

select a.endcv * b.prem / 1000 * power(1.04, (0-365)/ 365)+greatest(880-1*0.085*880,0)
  from cv_1033024 a, lcpol b
 where gender = insuredsex
   and pt = payendyear
   --and bp = insuyear
   and age = insuredappage
   and dt = '3'
   and contno = '2024030500000586';