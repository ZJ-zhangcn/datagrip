--生存金自动转账反洗钱限额配置
select a.*,rowid from ldcode a where codetype='livinglimit'

--
select polno,riskcode,a.*,rowid from lcpol a where contno='2022102800000716'

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
 where contno = '2024041800000206'
 for update;

--
select IDStDate,IDEXPDATE,a.*,rowid from lcappnt a where contno='2024041800000206';
select IDStDate,IDEXPDATE,a.*,rowid from lcinsured a where contno='2024041800000206'

--
select bankonthewayflag,banksuccflag,prtnotestate,bankprovince,bankcity,bankcode,bankaccno,ENTERACCDATE,CONFDATE,ACCTYPE,a.*,rowid from ljaget a where otherno='2024041800000206' order by shoulddate desc;

--
select dtcode,ats_returnstate,transstate,payinfocode,payinfo,a.*,rowid from ats_transactions a where reqseqid='20250101_27345'
/*
update ats_transactions
   set dtcode          = '1',--抽档成功
       ats_returnstate = '2',--已反盘
       transstate      = '6',--退票处理
       payinfocode     = 'E1005',
       payinfo         = '账户已销户'
 where reqseqid = '20450419_27544'
*/

--
select a.*,rowid from ldcode1 a where codetype = 'cuxbankerror' and codename like '%证件%'

--
select serialno,paycode,a.*,rowid from lyreturnfrombankb a where paycode='86000020450370000019'

select a.*,rowid from lcdrawautoacctrace a where contno='2024041800000206'

select a.*,rowid from lcdrawfxqlimittrace a where contno='2024041800000206'

select a.*,rowid from lyrefundlog a where ACTUGETNO='86000020450370000019'
