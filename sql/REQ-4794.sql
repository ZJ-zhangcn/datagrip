-- id: req-4794
-- 标题: 双录问题件汇流回传全量清单报表字段取值调整

select *
from lefragmentlogs
where bak1 = 'DQ'
  and fmproposalprtno in ('5000118250813076');

/*
insert into lisdata.lccontmovie (contno, prtno, batchno, managecom, appntno, appntname, videodate, videotime, uploaddate, uploadtime, uploadenddate, uploadendtime, qualitytestdate, qualitytesttime, qualitytestoperator, qualityteststate, qualitytestdesc, idtype, bankcode, areacode, bankteller, filepath, filename, mainriskcode, trandate, polapplydate, bankaccno, repeatflag, bak1, bak2, bak3, bak4, bak5, operator, makedate, maketime, modifydate, modifytime, subqualitystate, systemaudit, recheckstatus, isissue, qualityphone, qualityresult, qualitynum, rejectnum, ispermanent, permanenttime, uperrorreason, pushhuiliutime, huiliureceivetime, lastoperator, businessno, nodeno, recodate, busitype, taskparams, policyparams) values ('3002004101304102', '3002004101304102', '20191019', '86010101', '1052283555', '养增十一', null, null, date '2020-06-10', '13:16:53', null, null, date '2019-10-21', '14:10:51', '焦锋', '3', '通过', null, '1', null, null, null, null, null, null, null, null, null, null, '1', '2', null, '102001R231564464655719034', 'jh', date '2021-10-13', '11:34:18', date '2025-07-11', '00:25:20', null, null, null, null, null, '2', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
*/
select a.* from lccontmovie a where qualityteststate='8'

select count(1)
from lefragmentlogs d
         inner join lccontmovie c on d.fmproposalprtno = c.prtno
         left join lcissuepol a
                   on a.proposalcontno = substr(c.prtno, 1, 16) and a.issuetype = '1000200' and a.makedate = d.makedate
         left join lccont aa on aa.prtno = substr(c.prtno, 1, 16)
where d.bak1 = 'DQ'
  and d.fmfuncflag = 'DQ002'
  and d.fmobjctinfotype = '0'
  and 1 = 1
  and 1 = 1
  and 1 = 1
  and d.fmproposalprtno = '3002004101304102'
  and 1 = 1
  and 1 = 1


select d.fmproposalprtno,
       case
           when aa.appflag = 'B' then '未对账'
           when aa.appflag = '1' then '承保'
           when aa.appflag = '4' then '终止'
           when aa.appflag = '0' and aa.uwflag in ('a', '1', '2') then '撤单'
           when aa.appflag = '0' and aa.uwflag not in ('a', '1', '2') then '未承保'
           else '' end,
       aa.appntname,
       aa.appntno,
       case
           when a.backobjtype = '1' then '内部确认'
           when a.backobjtype = '2' then '客户'
           when a.backobjtype = '3' then '业务员'
           else '' end,
       case when a.needprint = 'Y' then '是' when a.needprint = 'N' then '否' else '' end,
       case when nvl(a.errtrial, d.bak3) = 'Y' then '是' when nvl(a.errtrial, d.bak3) = 'N' then '否' else '' end,
       c.qualitytestdesc,
       a.issuecont,
       a.operator,
       to_char(a.startdate, 'yyyy-mm-dd'),
       a.starttime,
       d.makedate,
       d.maketime,
       to_char(c.qualitytestdate, 'yyyy-mm-dd') || '  ' || c.qualitytesttime,
       to_char(c.pushhuiliutime, 'yyyy-MM-dd HH24:mi:ss'),
       to_char(c.huiliureceivetime, 'yyyy-MM-dd HH24:mi:ss')
from lefragmentlogs d
         inner join lccontmovie c on d.fmproposalprtno = c.prtno
         left join lcissuepol a
                   on a.proposalcontno = substr(c.prtno, 1, 16) and a.issuetype = '1000200' and a.makedate = d.makedate
         left join lccont aa on aa.prtno = substr(c.prtno, 1, 16)
where d.bak1 = 'DQ'
  and d.fmfuncflag = 'DQ002'
  and d.fmobjctinfotype = '0'
  and 1 = 1
  and 1 = 1
  and 1 = 1
  and d.fmproposalprtno = '3002004101304102'
  and 1 = 1
  and 1 = 1;