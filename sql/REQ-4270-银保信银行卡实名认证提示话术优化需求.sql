--手工单开关
select a.* from ldcode a where codetype='YZTIDCHECK_State' and code='01';
select a.* from ldcode a where codetype = 'CHECK_STAUTS' and code='01';
--app、经代通开关
select a.* from ldcode a where codetype = 'appcheckstate' and code='01';
select a.* from lcaddress a where customerno='1060094739'

select a.* from ldcalcheck a where FREMARK like '%银保信银行卡实名认证未通过%'

select * from lccontmovie where '1725849074000'='1725849074000' and  contno='5000118240908017'

insert into lccontmovie (CONTNO, PRTNO, BATCHNO, MANAGECOM, APPNTNO, APPNTNAME, VIDEODATE, VIDEOTIME, UPLOADDATE, UPLOADTIME, UPLOADENDDATE, UPLOADENDTIME, QUALITYTESTDATE, QUALITYTESTTIME, QUALITYTESTOPERATOR, QUALITYTESTSTATE, QUALITYTESTDESC, IDTYPE, BANKCODE, AREACODE, BANKTELLER, FILEPATH, FILENAME, MAINRISKCODE, TRANDATE, POLAPPLYDATE, BANKACCNO, REPEATFLAG, BAK1, BAK2, BAK3, BAK4, BAK5, OPERATOR, MAKEDATE, MAKETIME, MODIFYDATE, MODIFYTIME, SUBQUALITYSTATE, SYSTEMAUDIT, RECHECKSTATUS, ISISSUE, QUALITYPHONE, QUALITYRESULT, QUALITYNUM, REJECTNUM, ISPERMANENT, PERMANENTTIME, UPERRORREASON, PUSHHUILIUTIME, HUILIURECEIVETIME, LASTOPERATOR, BUSINESSNO, NODENO, RECODATE, BUSITYPE, TASKPARAMS, POLICYPARAMS)
values ('5000118240908017', '5000118240908017', '20240909', '86010101', '1060094739', '银保投保二三', null, null, to_date('10-06-2020', 'dd-mm-yyyy'), '13:16:53', null, null, to_date('21-10-2019', 'dd-mm-yyyy'), '14:10:51', '焦锋', '3', '通过', null, '1', null, null, null, null, null, null, null, null, null, null, '1', '2', null, '102001R231564464655719034', 'jh', to_date('13-10-2021', 'dd-mm-yyyy'), '11:34:18', to_date('13-10-2021', 'dd-mm-yyyy'), '11:34:18', null, null, null, null, null, '2', null, null, null, null, null, null, null, null, null, null, null, null, null, null);