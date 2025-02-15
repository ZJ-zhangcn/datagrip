select a.*,rowid from ldtask a where taskdescribe like '%自动导入出险人%' 

select sysvarvalue from ldsysvar where sysvar = 'SBTCX_login'
select sysvarvalue from ldsysvar where sysvar = 'CLAIMsbtsftp'
select a.sysvarvalue from ldsysvar a where a.sysvar = 'APPROOTDIR'

SELECT a.*,rowid FROM SBTClaimRiskerLog a WHERE fileName ='bbrqd.xls' AND filetype='LP' 

--快速理赔责任
select * from LMDutyGetClm where getdutykind ='200' and getdutycode='GG0064'
/*
insert into LMDutyGetClm (GETDUTYCODE, GETDUTYNAME, GETDUTYKIND, DEFAULTVAL, CALCODE, CNTERCALCODE, OTHCALCODE, INPFLAG, STATTYPE, MINGET, AFTERGET, MAXGET, CLAIMRATE, CLMDAYLMT, SUMCLMDAYLMT, DEDUCTIBLE, DEDUCTDAY, OBSPERIOD, DEADVALIFLAG, DEADTOPVALUEFLAG, NEEDRECOMPUTE, CASEPOLTYPE, DEFORMITYGRADE, FILTERCALCODE, EFFECTONMAINRISK)
values ('GG0064', '团体住院津贴保险金', '200', null, '062023', null, null, null, 'YL', null, '004', null, null, 0, 0, null, 0, 0, null, null, '1', null, null, null, null);
*/

SELECT count(distinct(a.clmno)) FROM  llclaimpolicy  a ,llregister b  where '1721029333000'='1721029333000' and  a.clmno =b.rgtno and b.rgtobjno='P86012025001030'

select count(1) from  LLRegister n where '1721029333000'='1721029333000' and   n.rgtobjno='P86012025001030'

select a.*,rowid from llclaimpolicy a where clmno='3631815101010199'

select a.*,rowid from ljaget a where otherno='2024071200000786'
