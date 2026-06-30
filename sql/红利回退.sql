select * from ljaget where otherno='2026052500000296';

--delete
select leavingmoney,a.* from lcpol a where contno='2026052500000296';

/*
update lcpol a set leavingmoney=1540.80 where contno='2025042500000206';
*/
select a.* from lobonuspol a where contno='2026052500000296' order by fiscalyear;

select * from ljabonusget where contno='2026052500000296' order by bonusyear;

--delete
select * from lcinsureacctrace where contno='2026052500000296' order by paydate;

--delete
select a.* from lcinsureacc a where contno='2026052500000296';

select a.* from lcinsureaccclass a where contno='2026052500000296';

/*
update lcinsureacc a set a.insuaccbala=25223.15,a.baladate=date'2031-04-26' where contno='2026052500000296' and acctype='004';

update lcinsureaccclass a set a.insuaccbala=25223.15,a.baladate=date'2031-04-26' where contno='2026052500000296' and acctype='004';
*/

--购买减额交清
select a.* from lcduty a where contno='2026052500000296';
--amnt;

/*
insert into lcduty (polno,dutycode,contno,mult,standprem,prem,sumprem,amnt,riskamnt,payintv,payyears,years,floatrate,firstpaydate,firstmonth,paytodate,payenddate,payendyearflag,payendyear,getyearflag,getyear,insuyearflag,insuyear,acciyearflag,acciyear,enddate,accienddate,freeflag,freerate,freestartdate,freeenddate,getstartdate,getstarttype,livegetmode,deadgetmode,bonusgetmode,ssflag,peakline,getlimit,getrate,calrule,premtoamnt,standbyflag1,standbyflag2,standbyflag3,operator,makedate,maketime,modifydate,modifytime,cvalidate,getintv,ascriptionrulecode,payrulecode,currency,payday,dailylimit,getlimittype,nogetday,annuitygetmode,annuitygetage,insugetmode,getyearmode) values ('210310000005247','ID0504','2026052500000296',0,50000,50000,50000,890,890,0,1000,1000,1,timestamp '2025-11-18 00:00:00.000000',0,timestamp '3025-11-19 00:00:00.000000',timestamp '3025-11-19 00:00:00.000000','Y',1000,'Y',5,'Y',1000,null,0,timestamp '3025-11-19 00:00:00.000000',null,null,0,null,null,timestamp '2025-11-19 00:00:00.000000','S','0',null,'3',null,0,0,0,'0','P',null,null,null,'fuhe001',timestamp '2025-11-18 00:00:00.000000','15:07:49',timestamp '2026-11-17 00:00:00.000000','00:09:14',timestamp '2025-11-19 00:00:00.000000',0,null,null,'01',0,0,null,0,'0',0,null,null);
*/

select
       prem, amnt, payendyear,
       a.paytodate, payenddate, a.bonusgetmode,
       a.*
from lcpol a where contno='2026052500000296'