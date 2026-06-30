-- id: req-4270
-- 标题: 银保信银行卡实名认证提示话术优化需求

--手工单开关
select a.* from ldcode a where codetype='YZTIDCHECK_State' and code='01';

select a.* from ldcode a where codetype = 'CHECK_STAUTS' and code='01';

--app、经代通开关
select a.* from ldcode a where codetype = 'appcheckstate' and code='01';

select a.* from lcaddress a where customerno='1060094739'

select a.* from ldcalcheck a where fremark like '%银保信银行卡实名认证未通过%'

select * from lccontmovie where '1725849074000'='1725849074000' and  contno='5000118240908017'

/*
insert into lccontmovie (contno, prtno, batchno, managecom, appntno, appntname, videodate, videotime, uploaddate, uploadtime, uploadenddate, uploadendtime, qualitytestdate, qualitytesttime, qualitytestoperator, qualityteststate, qualitytestdesc, idtype, bankcode, areacode, bankteller, filepath, filename, mainriskcode, trandate, polapplydate, bankaccno, repeatflag, bak1, bak2, bak3, bak4, bak5, operator, makedate, maketime, modifydate, modifytime, subqualitystate, systemaudit, recheckstatus, isissue, qualityphone, qualityresult, qualitynum, rejectnum, ispermanent, permanenttime, uperrorreason, pushhuiliutime, huiliureceivetime, lastoperator, businessno, nodeno, recodate, busitype, taskparams, policyparams)
values ('5000118240908017', '5000118240908017', '20240909', '86010101', '1060094739', '银保投保二三', null, null, to_date('10-06-2020', 'dd-mm-yyyy'), '13:16:53', null, null, to_date('21-10-2019', 'dd-mm-yyyy'), '14:10:51', '焦锋', '3', '通过', null, '1', null, null, null, null, null, null, null, null, null, null, '1', '2', null, '102001R231564464655719034', 'jh', to_date('13-10-2021', 'dd-mm-yyyy'), '11:34:18', to_date('13-10-2021', 'dd-mm-yyyy'), '11:34:18', null, null, null, null, null, '2', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
*/
