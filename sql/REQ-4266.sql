select appflag,(select codename from ldcode where codetype='bonusgetmode' and code=a.bonusgetmode) 红利领取方式,(select codename from ldcode where codetype='getlocation' and code=a.getform) 生存金领取方式,(select riskname from lmriskapp where riskcode=a.riskcode) riskname,contno,prtno,riskcode,signdate,cvalidate,enddate,paytodate,payenddate,payintv,amnt,prem,payendyear,insuyear,a.* from lcpol a
where contno in ('2024102100000126','2024102200000186','2024102200000316','2024102100000496') order by a.contno

select a.* from loloanmain a where contno in ('2024102100000126','2024102200000186','2024102200000316','') order by a.contno

select a.* from ldtask a where taskdescribe like '%贷款%' 

select a.* from LJABonusGet a where otherno='2024102200000316' order by BONUSYEAR desc;
select a.* from lobonuspol a where contno='2024102200000186' order by FISCALYEAR desc;
select a.* from ljaget a where otherno='2024102200000316'

select a.* from ljspay a where otherno='2024102200000316'

select * from ldcode where codetype='bonusgetmode';