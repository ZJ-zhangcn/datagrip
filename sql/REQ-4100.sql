-- id: req-4100
-- 标题: 生存金付费退票后优化

/*
退票：
5000118240416019  2024041600000556
5000118240418011  2024041800000116
5000118240418028  2024041800000206

投保人变更：
2019122500000766
5000118240419017  2024041900000306
*/
select a.* from lcpol a where prtno='5000118240419017'

select /*(select codename from ldcode a where codetype='appflag' and code=a.appflag) */appflag,(select codename from ldcode where codetype='bonusgetmode' and code=a.bonusgetmode) 红利领取方式,(select codename from ldcode where codetype='getlocation' and code=a.getform) 生存金领取方式,contno,prtno,riskcode,signdate,cvalidate,enddate,paytodate,payenddate,payintv,amnt,prem,payendyear,insuyear,a.* from lcpol a
where contno='2024050900000186'

--trustcompanyflag='Y'时为信托单
select appflag,trustcompanyflag,a.* from lccont a where contno='2024050900000186'

/*
update lccont set getpoldate=cvalidate-1,customgetpoldate=cvalidate-1 where prtno='5000118340418029'

update lccont set getpoldate=cvalidate-1,customgetpoldate=cvalidate-1 where contno='2024041900000306'
*/

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
 where contno = '2024050900000586';

--
select idstdate,idexpdate,a.* from lcappnt a where contno='2024041800000116';

select idstdate,idexpdate,a.* from lcinsured a where contno='2024041800000116'

/*
update lcappnt set idexpdate='2054-04-16' where contno='2024041800000116';

update lcinsured set idexpdate='2054-04-16' where contno='2024041800000116'
*/

--
select bankonthewayflag,banksuccflag,prtnotestate,bankprovince,bankcity,bankcode,bankaccno,enteraccdate,confdate,acctype,a.* from ljaget a where otherno='2024050900000586' order by shoulddate desc;

--个险保全表
select edorno 批单号,edortype,edorstate,edorvalidate 保全生效日期,getmoney,getinterest,a.* from lpedoritem a where contno='2024041800000116' order by edorvalidate desc;

--
select a.* from lyreturnfrombankb a where paycode='86000020250370001571'

/*
update ats_transactions
   set dtcode          = '1',--抽档成功
       ats_returnstate = '2',--已反盘
       transstate      = '6',--退票处理
       payinfocode     = 'E8001',
       payinfo         = '其他错误'
 where reqseqid = '20250510_43468'
*/

--
select a.* from ldtask a where taskdescribe like '%生存金%'

--退票批处理
select a.* from ldtask a where taskdescribe like '%退票%'

--系统原因or客户原因
select * from ldcode1 a where a.codetype = 'cuxbankerror' /*and a.code = 'ncux' and a.comcode != 'S' */and comcode='Y'

select a.* from lyreturnfrombankb a where paycode='86000020250370014963'

--红冲轨迹
select a.* from lyrefundlog a where actugetno='86000020440370000009' order by serialnot desc;