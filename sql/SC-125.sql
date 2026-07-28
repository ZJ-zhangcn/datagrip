-- id: SC-125
-- 标题: 浦银人寿康爱保A款医疗保险续保功能开发需求

SELECT b.APPNTNO,
       b.APPNTNAME,
       b.IDNO,
       c.INSUREDNO,
       c.NAME,
       c.IDNO,
       a.INSUREDAPPAGE,
       a.CVALIDATE,
       a.ENDDATE,
       a.ContPlanCode,
       a.prtno,
       a.CONTNO
FROM LCPOL a,
     LCAPPNT b,
     LCINSURED c
WHERE a.CONTNO = b.CONTNO
  and a.CONTNO = c.CONTNO
  and (a.CONTNO = '2026071400000956'
    or a.PRTNO = '');
SELECT INSUREDAPPAGE,
       APPNTNO,
       INSUREDNO,
       INSUREDNAME,
       CVALIDATE,
       ENDDATE,
       ContPlanCode,
       a.*
FROM LCPOL a
WHERE contno = '5000111000019605';
SELECT CONTPLANCODE, a.*
FROM LCINSURED a
WHERE CONTNO = '2026071400000956';
SELECT CONTNO, SALECHANNELS, a.*
FROM LCCONT a
WHERE CONTNO = '2026071400000956';
SELECT a.*
FROM ldtask a
WHERE TASKDESCRIBE like '%趸交%';
SELECT a.*
FROM ldtask a
WHERE TASKDESCRIBE like '%分单%';
SELECT a.*
FROM ldtask a
WHERE TASKDESCRIBE like '%续保%';
SELECT a.*
FROM ldtask a
WHERE TASKDESCRIBE like '%逾期投保单自动撤件批处理%';
SELECT a.*
FROM ldtask a
WHERE TASKDESCRIBE like '%碎片化%';
SELECT a.*
FROM LMCalMode a
WHERE riskcode = '1061001';
SELECT KINDCODE, a.*
FROM LMRISKAPP a
WHERE RISKCODE = '1056033'
  and KINDCODE in ('L', 'S');

SELECT SSFlag, a.*
FROM LCDUTY a
WHERE CONTNO = '2026071400000956';

SELECT c.contno,
       p.polno,
       p.riskcode,
       p.appflag,
       p.enddate        AS 满期日,
       (p.enddate - 30) AS 可抽档起始日, -- 含当天
       p.enddate - 1    AS 可抽档截止日, -- 不含当天
       TRUNC(SYSDATE)   AS 当前系统日,
       CASE
           WHEN p.riskcode NOT IN (SELECT DISTINCT code
                                   FROM ldcode1
                                   WHERE codetype = 'renewalrisk'
                                     AND codename <> '0000000')
               THEN '不在可续保险种配置中，不能抽档'
           WHEN p.appflag <> '1'
               THEN '保单非有效状态(appflag<>1)，不能抽档'
           WHEN EXISTS (SELECT 1 FROM lccontrenewal r WHERE r.contno = c.contno)
               THEN '已在续保抽档表中，不会再次抽档'
           WHEN TRUNC(SYSDATE) < (p.enddate - 30)
               THEN '未到抽档期，最早可抽档日=' || TO_CHAR(p.enddate - 30, 'yyyy-mm-dd')
           WHEN TRUNC(SYSDATE) BETWEEN (p.enddate - 30) AND p.enddate
               THEN '当前在抽档窗口内，今天可抽档'
           WHEN TRUNC(SYSDATE) > p.enddate
               THEN '已过满期日，按批处理逻辑会置超期，不能再按正常规则抽档'
           ELSE '其他情况，需人工核对'
           END          AS 抽档判断说明
FROM lccont c
         JOIN lcpol p ON p.contno = c.contno
WHERE p.riskcode IN (SELECT DISTINCT code
                     FROM ldcode1
                     WHERE codetype = 'renewalrisk'
                       AND codename <> '0000000')
  and c.contno = '2026071400000776';

