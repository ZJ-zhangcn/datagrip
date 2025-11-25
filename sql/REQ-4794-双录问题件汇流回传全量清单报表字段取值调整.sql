SELECT *
FROM LEFragmentLogs
WHERE Bak1 = 'DQ'
  and FMProposalPrtNo in ('5000118250813076');
INSERT INTO LISDATA.LCCONTMOVIE (CONTNO, PRTNO, BATCHNO, MANAGECOM, APPNTNO, APPNTNAME, VIDEODATE, VIDEOTIME, UPLOADDATE, UPLOADTIME, UPLOADENDDATE, UPLOADENDTIME, QUALITYTESTDATE, QUALITYTESTTIME, QUALITYTESTOPERATOR, QUALITYTESTSTATE, QUALITYTESTDESC, IDTYPE, BANKCODE, AREACODE, BANKTELLER, FILEPATH, FILENAME, MAINRISKCODE, TRANDATE, POLAPPLYDATE, BANKACCNO, REPEATFLAG, BAK1, BAK2, BAK3, BAK4, BAK5, OPERATOR, MAKEDATE, MAKETIME, MODIFYDATE, MODIFYTIME, SUBQUALITYSTATE, SYSTEMAUDIT, RECHECKSTATUS, ISISSUE, QUALITYPHONE, QUALITYRESULT, QUALITYNUM, REJECTNUM, ISPERMANENT, PERMANENTTIME, UPERRORREASON, PUSHHUILIUTIME, HUILIURECEIVETIME, LASTOPERATOR, BUSINESSNO, NODENO, RECODATE, BUSITYPE, TASKPARAMS, POLICYPARAMS) VALUES ('3002004101304102', '3002004101304102', '20191019', '86010101', '1052283555', '养增十一', null, null, DATE '2020-06-10', '13:16:53', null, null, DATE '2019-10-21', '14:10:51', '焦锋', '3', '通过', null, '1', null, null, null, null, null, null, null, null, null, null, '1', '2', null, '102001R231564464655719034', 'jh', DATE '2021-10-13', '11:34:18', DATE '2025-07-11', '00:25:20', null, null, null, null, null, '2', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
select a.* from lccontmovie a where QUALITYTESTSTATE='8'

SELECT count(1)
FROM LEFragmentLogs d
         INNER JOIN lccontmovie c ON d.fmproposalprtno = c.prtno
         LEFT JOIN LCISSUEPOL a
                   ON a.proposalcontno = substr(c.prtno, 1, 16) and a.issuetype = '1000200' and a.MakeDate = d.makedate
         LEFT JOIN lccont aa ON aa.prtno = substr(c.prtno, 1, 16)
WHERE d.Bak1 = 'DQ'
  AND d.fmfuncflag = 'DQ002'
  AND d.fmobjctinfotype = '0'
  AND 1 = 1
  AND 1 = 1
  AND 1 = 1
  AND d.FMProposalPrtNo = '3002004101304102'
  AND 1 = 1
  AND 1 = 1


SELECT d.FMProposalPrtNo,
       CASE
           WHEN aa.appflag = 'B' THEN '未对账'
           WHEN aa.appflag = '1' THEN '承保'
           WHEN aa.appflag = '4' THEN '终止'
           WHEN aa.appflag = '0' AND aa.uwflag IN ('a', '1', '2') THEN '撤单'
           WHEN aa.appflag = '0' AND aa.uwflag NOT IN ('a', '1', '2') THEN '未承保'
           ELSE '' END,
       aa.appntname,
       aa.appntno,
       CASE
           WHEN a.BackObjType = '1' THEN '内部确认'
           WHEN a.BackObjType = '2' THEN '客户'
           WHEN a.BackObjType = '3' THEN '业务员'
           ELSE '' END,
       CASE WHEN a.needprint = 'Y' THEN '是' WHEN a.needprint = 'N' THEN '否' ELSE '' END,
       CASE WHEN nvl(a.ErrTrial, d.bak3) = 'Y' THEN '是' WHEN nvl(a.ErrTrial, d.bak3) = 'N' THEN '否' ELSE '' END,
       c.QualityTestDesc,
       a.IssueCont,
       a.operator,
       TO_CHAR(a.startdate, 'yyyy-mm-dd'),
       a.StartTime,
       d.makedate,
       d.maketime,
       TO_CHAR(c.QualityTestDate, 'yyyy-mm-dd') || '  ' || c.QualityTestTime,
       TO_CHAR(c.PUSHHUILIUTIME, 'yyyy-MM-dd HH24:mi:ss'),
       TO_CHAR(c.HUILIURECEIVETIME, 'yyyy-MM-dd HH24:mi:ss')
FROM LEFragmentLogs d
         INNER JOIN lccontmovie c ON d.fmproposalprtno = c.prtno
         LEFT JOIN LCISSUEPOL a
                   ON a.proposalcontno = substr(c.prtno, 1, 16) and a.issuetype = '1000200' and a.MakeDate = d.makedate
         LEFT JOIN lccont aa ON aa.prtno = substr(c.prtno, 1, 16)
WHERE d.Bak1 = 'DQ'
  AND d.fmfuncflag = 'DQ002'
  AND d.fmobjctinfotype = '0'
  AND 1 = 1
  AND 1 = 1
  AND 1 = 1
  AND d.FMProposalPrtNo = '3002004101304102'
  AND 1 = 1
  AND 1 = 1;