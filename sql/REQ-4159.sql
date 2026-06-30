-- id: req-4159
-- 标题: 生存金自动转账成功校验优化需求

select a.* from ldtask a where taskdescribe like '%自动导入出险人%'

select sysvarvalue from ldsysvar where sysvar = 'SBTCX_login'

select sysvarvalue from ldsysvar where sysvar = 'CLAIMsbtsftp'

select a.sysvarvalue from ldsysvar a where a.sysvar = 'APPROOTDIR'

select a.* from sbtclaimriskerlog a where filename ='bbrqd.xls' and filetype='LP'

--快速理赔责任
select * from lmdutygetclm where getdutykind ='200' and getdutycode='GG0064'

/*
insert into lmdutygetclm (getdutycode, getdutyname, getdutykind, defaultval, calcode, cntercalcode, othcalcode, inpflag, stattype, minget, afterget, maxget, claimrate, clmdaylmt, sumclmdaylmt, deductible, deductday, obsperiod, deadvaliflag, deadtopvalueflag, needrecompute, casepoltype, deformitygrade, filtercalcode, effectonmainrisk)
values ('GG0064', '团体住院津贴保险金', '200', null, '062023', null, null, null, 'YL', null, '004', null, null, 0, 0, null, 0, 0, null, null, '1', null, null, null, null);
*/

select count(distinct(a.clmno)) from  llclaimpolicy  a ,llregister b  where '1721029333000'='1721029333000' and  a.clmno =b.rgtno and b.rgtobjno='P86012025001030'

select count(1) from  llregister n where '1721029333000'='1721029333000' and   n.rgtobjno='P86012025001030'

select a.* from llclaimpolicy a where clmno='3631815101010199'

select a.* from ljaget a where otherno='2024071200000786';