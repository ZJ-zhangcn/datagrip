--团单有效LCGRPCONTXBBAK
SELECT b.grpcontno                          AS 承保单号,
       b.GrpName                            AS 投保单位,
       b.SaleChannels                       AS 销售渠道,
       b.CValiDate                          AS 生效日期,
       b.Peoples                            AS 团体人数,
       (SELECT COUNT(1)
        FROM lcinsured li
        WHERE grpcontno = b.grpcontno
          AND EXISTS (SELECT 1
                      FROM lcpol
                      WHERE contno = li.contno
                        AND appflag = '1')) AS 承保人数,
       (SELECT COUNT(1)
        FROM lcinsured li
        WHERE grpcontno = b.grpcontno
          AND sex = '0'
          AND EXISTS (SELECT 1
                      FROM lcpol
                      WHERE contno = li.contno
                        AND appflag = '1')) AS 男性被保人人数,
       (SELECT COUNT(1)
        FROM lcinsured li
        WHERE grpcontno = b.grpcontno
          AND sex = '1'
          AND EXISTS (SELECT 1
                      FROM lcpol
                      WHERE contno = li.contno
                        AND appflag = '1')) AS 女性被保人人数,
       (SELECT TO_CHAR(AVG(TRUNC(MONTHS_BETWEEN(TO_DATE('2026-04-22', 'yyyy-mm-dd'), Birthday) / 12)), '999999999.99')
        FROM lcinsured li
        WHERE grpcontno = b.grpcontno
          AND EXISTS (SELECT 1
                      FROM lcpol
                      WHERE contno = li.contno
                        AND appflag = '1')) AS 平均年龄,
       (SELECT MAX(TRUNC(MONTHS_BETWEEN(TO_DATE('2026-04-22', 'yyyy-mm-dd'), Birthday) / 12))
        FROM lcinsured li
        WHERE grpcontno = b.grpcontno
          AND EXISTS (SELECT 1
                      FROM lcpol
                      WHERE contno = li.contno
                        AND appflag = '1')) AS 最大年龄,
       (SELECT MIN(TRUNC(MONTHS_BETWEEN(TO_DATE('2026-04-22', 'yyyy-mm-dd'), Birthday) / 12))
        FROM lcinsured li
        WHERE grpcontno = b.grpcontno
          AND EXISTS (SELECT 1
                      FROM lcpol
                      WHERE contno = li.contno
                        AND appflag = '1')) AS 最小年龄,
       (SELECT MAX(Salary)
        FROM lcinsured li
        WHERE grpcontno = b.grpcontno
          AND EXISTS (SELECT 1
                      FROM lcpol
                      WHERE contno = li.contno
                        AND appflag = '1')) AS 最高月薪,
       (SELECT AVG(Salary)
        FROM lcinsured li
        WHERE grpcontno = b.grpcontno
          AND EXISTS (SELECT 1
                      FROM lcpol
                      WHERE contno = li.contno
                        AND appflag = '1')) AS 平均月薪,
       DECODE(PayIntv, 0, '0', '12')        AS 交费方式,
       GrpSpec                              AS 特别约定信息,
       (SELECT amnt
        FROM lcgrppol
        WHERE riskcode = '2062050'
          AND b.GRPCONTNO = GRPCONTNO)      AS 公共保额保额,
       (SELECT (SELECT (SELECT SUM(pag.sumactupaymoney)
                        FROM ljapaygrp pag
                        WHERE pag.grppolno = gp.grppolno
                          AND EXISTS (SELECT 1
                                      FROM ljapay ap
                                      WHERE ap.payno = pag.payno
                                        AND ap.incomeno = b.grpcontno)) +
                       (SELECT NVL(SUM(agd.getmoney), 0)
                        FROM ljagetendorse agd
                        WHERE agd.grppolno = gp.grppolno
                          AND agd.getflag <> '1'
                          AND EXISTS (SELECT 1
                                      FROM lpedoritem pd
                                      WHERE pd.edorno = agd.endorsementno
                                        AND pd.edorstate = '0'))
                FROM DUAL) -
               (SELECT NVL(SUM(agd.getmoney) * -1, 0)
                FROM ljagetendorse agd
                WHERE agd.grppolno = gp.grppolno
                  AND agd.getflag = '1'
                  AND EXISTS (SELECT 1
                              FROM lpedoritem pd
                              WHERE pd.edorno = agd.endorsementno
                                AND pd.edorstate = '0'))
        FROM lcgrppol gp
        WHERE gp.riskcode = '2062050'
          AND b.GRPCONTNO = gp.GRPCONTNO)   AS 公共保额保费,
       '2026-04-22'                         AS 最后更新日期,
       '16:41:51'                           AS 最后更新时间
FROM LCGRPCONT b
WHERE b.grpcontno = '2026042200000556';

--团单终止LCGRPCONTXBBAK
SELECT b.grpcontno                                        AS 承保单号,
       b.grpname                                          AS 投保单位,
       b.SaleChannels                                     AS 销售渠道,
       b.CValiDate                                        AS 生效日期,
       b.Peoples                                          AS 团体人数,
       (SELECT COUNT(1)
        FROM lcinsured li
        WHERE grpcontno = b.grpcontno
          AND EXISTS (SELECT 1
                      FROM lcpol
                      WHERE contno = li.contno
                        AND enddate = DATE '2025-01-08')) AS 承保人数,
       (SELECT COUNT(1)
        FROM lcinsured li
        WHERE grpcontno = b.grpcontno
          AND sex = '0'
          AND EXISTS (SELECT 1
                      FROM lcpol
                      WHERE contno = li.contno
                        AND enddate = DATE '2025-01-08')) AS 男性被保人人数,
       (SELECT COUNT(1)
        FROM lcinsured li
        WHERE grpcontno = b.grpcontno
          AND sex = '1'
          AND EXISTS (SELECT 1
                      FROM lcpol
                      WHERE contno = li.contno
                        AND enddate = DATE '2025-01-08')) AS 女性被保人人数,
       (SELECT TO_CHAR(AVG(TRUNC(MONTHS_BETWEEN(TO_DATE('2026-04-22', 'yyyy-mm-dd'), Birthday) / 12)), '999999999.99')
        FROM lcinsured li
        WHERE grpcontno = b.grpcontno
          AND EXISTS (SELECT 1
                      FROM lcpol
                      WHERE contno = li.contno
                        AND enddate = DATE '2025-01-08')) AS 平均年龄,
       (SELECT MAX(TRUNC(MONTHS_BETWEEN(TO_DATE('2026-04-22', 'yyyy-mm-dd'), Birthday) / 12))
        FROM lcinsured li
        WHERE grpcontno = b.grpcontno
          AND EXISTS (SELECT 1
                      FROM lcpol
                      WHERE contno = li.contno
                        AND enddate = DATE '2025-01-08')) AS 最大年龄,
       (SELECT MIN(TRUNC(MONTHS_BETWEEN(TO_DATE('2026-04-22', 'yyyy-mm-dd'), Birthday) / 12))
        FROM lcinsured li
        WHERE grpcontno = b.grpcontno
          AND EXISTS (SELECT 1
                      FROM lcpol
                      WHERE contno = li.contno
                        AND enddate = DATE '2025-01-08')) AS 最小年龄,
       (SELECT MAX(Salary)
        FROM lcinsured li
        WHERE grpcontno = b.grpcontno
          AND EXISTS (SELECT 1
                      FROM lcpol
                      WHERE contno = li.contno
                        AND enddate = DATE '2025-01-08')) AS 最高月薪,
       (SELECT AVG(Salary)
        FROM lcinsured li
        WHERE grpcontno = b.grpcontno
          AND EXISTS (SELECT 1
                      FROM lcpol
                      WHERE contno = li.contno
                        AND enddate = DATE '2025-01-08')) AS 平均月薪,
       DECODE(PayIntv, 0, '0', '12')                      AS 交费方式,
       GrpSpec                                            AS 特别约定信息,
       (SELECT amnt
        FROM lcgrppol
        WHERE riskcode = '2062050'
          AND b.GRPCONTNO = GRPCONTNO)                    AS 公共保额保额,
       (SELECT (SELECT (SELECT SUM(pag.sumactupaymoney)
                        FROM ljapaygrp pag
                        WHERE pag.grppolno = gp.grppolno
                          AND EXISTS (SELECT 1
                                      FROM ljapay ap
                                      WHERE ap.payno = pag.payno
                                        AND ap.incomeno = b.grpcontno))
                           + (SELECT NVL(SUM(agd.getmoney), 0)
                              FROM ljagetendorse agd
                              WHERE agd.grppolno = gp.grppolno
                                AND agd.getflag <> '1'
                                AND EXISTS (SELECT 1
                                            FROM lpedoritem pd
                                            WHERE pd.edorno = agd.endorsementno
                                              AND pd.edorstate = '0'))
                FROM dual)
                   - (SELECT NVL(SUM(agd.getmoney) * -1, 0)
                      FROM ljagetendorse agd
                      WHERE agd.grppolno = gp.grppolno
                        AND agd.getflag = '1'
                        AND EXISTS (SELECT 1
                                    FROM lpedoritem pd
                                    WHERE pd.edorno = agd.endorsementno
                                      AND pd.edorstate = '0'))
        FROM lcgrppol gp
        WHERE gp.riskcode = '2062050'
          AND b.GRPCONTNO = gp.GRPCONTNO)                 AS 公共保额保费,
       '2026-04-22'                                       AS 最后更新日期,
       '17:53:35'                                         AS 最后更新时间
FROM LCGRPCONT b
WHERE b.grpcontno = '2024022200000576';


--团单有效LCCONTPLANXBBAK
SELECT a.grpcontno                         AS 保单号,
       a.contplancode                      AS 计划别,
       a.contplanname                      AS 计划名称,
       a.HealthInsFlag                     AS 有无社保,
       (SELECT COUNT(1)
        FROM lcinsured li
        WHERE grpcontno = b.grpcontno
          AND contplancode = a.contplancode
          AND occupationtype = '0'
          AND EXISTS(SELECT 1
                     FROM lcpol
                     WHERE contno = li.contno
                       AND appflag = '1')) AS 被保险人属性,
       (SELECT COUNT(1)
        FROM lcinsured li
        WHERE grpcontno = b.grpcontno
          AND contplancode = a.contplancode
          AND occupationtype = '1'
          AND EXISTS(SELECT 1
                     FROM lcpol
                     WHERE contno = li.contno
                       AND appflag = '1')) AS 一类人数,
       (SELECT COUNT(1)
        FROM lcinsured li
        WHERE grpcontno = b.grpcontno
          AND contplancode = a.contplancode
          AND occupationtype = '2'
          AND EXISTS(SELECT 1
                     FROM lcpol
                     WHERE contno = li.contno
                       AND appflag = '1')) AS 二类人数,
       (SELECT COUNT(1)
        FROM lcinsured li
        WHERE grpcontno = b.grpcontno
          AND contplancode = a.contplancode
          AND occupationtype = '3'
          AND EXISTS(SELECT 1
                     FROM lcpol
                     WHERE contno = li.contno
                       AND appflag = '1')) AS 三类人数,
       (SELECT COUNT(1)
        FROM lcinsured li
        WHERE grpcontno = b.grpcontno
          AND contplancode = a.contplancode
          AND occupationtype = '4'
          AND EXISTS(SELECT 1
                     FROM lcpol
                     WHERE contno = li.contno
                       AND appflag = '1')) AS 四类人数,
       (SELECT COUNT(1)
        FROM lcinsured li
        WHERE grpcontno = b.grpcontno
          AND contplancode = a.contplancode
          AND occupationtype = '5'
          AND EXISTS(SELECT 1
                     FROM lcpol
                     WHERE contno = li.contno
                       AND appflag = '1')) AS 五类人数,
       (SELECT COUNT(1)
        FROM lcinsured li
        WHERE grpcontno = b.grpcontno
          AND contplancode = a.contplancode
          AND occupationtype = '6'
          AND EXISTS(SELECT 1
                     FROM lcpol
                     WHERE contno = li.contno
                       AND appflag = '1')) AS 六类人数,
       CASE
           WHEN (SELECT COUNT(1)
                 FROM LCContPlanDutyParam
                 WHERE GrpContNo = a.grpcontno
                   AND ContPlanCode = a.contplancode
                   AND calfactor = 'CalRule'
                   AND riskcode <> '2062050'
                   AND calfactorvalue = '3') =
                (SELECT COUNT(DISTINCT (dutycode))
                 FROM LCContPlanDutyParam
                 WHERE GrpContNo = a.grpcontno
                   AND ContPlanCode = a.contplancode
                   AND riskcode <> '2062050')
               THEN (SELECT NVL(TO_CHAR(SUM(TO_NUMBER(calfactorvalue)), 'fm999999999.00'), 0)
                     FROM LCContPlanDutyParam
                     WHERE GrpContNo = a.GrpContNo
                       AND ContPlanCode = a.ContPlanCode
                       AND calfactor = 'Prem'
                       AND riskcode <> '2062050')
           ELSE '0.00'
           END                             AS 人均保费,
       '2026-04-22'                        AS 最后更新日期,
       '16:41:51'                          AS 最后更新时间
FROM LCCONTPLAN a,
     LCGRPCONT b
WHERE a.grpcontno = b.grpcontno
  AND a.grpcontno = '2026042200000556';

--团单终止LCCONTPLANXBBAK
SELECT a.grpcontno                                        AS 保单号,
       a.contplancode                                     AS 计划别,
       a.contplanname                                     AS 计划名称,
       a.HealthInsFlag                                    AS 有无社保,
       (SELECT COUNT(1)
        FROM lcinsured li
        WHERE li.grpcontno = b.grpcontno
          AND li.contplancode = a.contplancode
          AND li.occupationtype = '0'
          AND EXISTS (SELECT 1
                      FROM lcpol
                      WHERE contno = li.contno
                        AND enddate = DATE '2025-01-08')) AS 被保险人属性,
       (SELECT COUNT(1)
        FROM lcinsured li
        WHERE grpcontno = b.grpcontno
          AND contplancode = a.contplancode
          AND occupationtype = '1'
          AND EXISTS (SELECT 1
                      FROM lcpol
                      WHERE contno = li.contno
                        AND enddate = DATE '2025-01-08')) AS 一类人数,
       (SELECT COUNT(1)
        FROM lcinsured li
        WHERE grpcontno = b.grpcontno
          AND contplancode = a.contplancode
          AND occupationtype = '2'
          AND EXISTS (SELECT 1
                      FROM lcpol
                      WHERE contno = li.contno
                        AND enddate = DATE '2025-01-08')) AS 二类人数,
       (SELECT COUNT(1)
        FROM lcinsured li
        WHERE grpcontno = b.grpcontno
          AND contplancode = a.contplancode
          AND occupationtype = '3'
          AND EXISTS (SELECT 1
                      FROM lcpol
                      WHERE contno = li.contno
                        AND enddate = DATE '2025-01-08')) AS 三类人数,
       (SELECT COUNT(1)
        FROM lcinsured li
        WHERE grpcontno = b.grpcontno
          AND contplancode = a.contplancode
          AND occupationtype = '4'
          AND EXISTS (SELECT 1
                      FROM lcpol
                      WHERE contno = li.contno
                        AND enddate = DATE '2025-01-08')) AS 四类人数,
       (SELECT COUNT(1)
        FROM lcinsured li
        WHERE grpcontno = b.grpcontno
          AND contplancode = a.contplancode
          AND occupationtype = '5'
          AND EXISTS (SELECT 1
                      FROM lcpol
                      WHERE contno = li.contno
                        AND enddate = DATE '2025-01-08')) AS 五类人数,
       (SELECT COUNT(1)
        FROM lcinsured li
        WHERE grpcontno = b.grpcontno
          AND contplancode = a.contplancode
          AND occupationtype = '6'
          AND EXISTS (SELECT 1
                      FROM lcpol
                      WHERE contno = li.contno
                        AND enddate = DATE '2025-01-08')) AS 六类人数,
       CASE
           WHEN (SELECT COUNT(1)
                 FROM LCContPlanDutyParam
                 WHERE GrpContNo = a.grpcontno
                   AND ContPlanCode = a.contplancode
                   AND calfactor = 'CalRule'
                   AND riskcode <> '2062050'
                   AND calfactorvalue = '3') =
                (SELECT COUNT(DISTINCT dutycode)
                 FROM LCContPlanDutyParam
                 WHERE GrpContNo = a.grpcontno
                   AND ContPlanCode = a.contplancode
                   AND riskcode <> '2062050')
               THEN (SELECT NVL(TO_CHAR(SUM(TO_NUMBER(calfactorvalue)), 'fm999999999.00'), 0)
                     FROM LCContPlanDutyParam
                     WHERE GrpContNo = a.GrpContNo
                       AND ContPlanCode = a.ContPlanCode
                       AND calfactor = 'Prem'
                       AND riskcode <> '2062050')
           ELSE '0.00'
           END                                            AS 人均保费,
       '2026-04-22'                                       AS 最后更新日期,
       '17:53:35'                                         AS 最后更新时间
FROM LCCONTPLAN a,
     LCGRPCONT b
WHERE a.grpcontno = b.grpcontno
  AND a.grpcontno = '2024062100000126';


--团单有效LCCONTPLANDUTYPARAMXBBAK
SELECT a.grpcontno                                AS 保单号,
       a.contplancode                             AS 计划编码,
       a.riskcode                                 AS 险种编码,
       (SELECT riskname
        FROM lmriskapp
        WHERE riskcode = a.riskcode)              AS 险种名称,
       a.dutycode                                 AS 责任编码,
       (SELECT DutyName
        FROM LMDUTY
        WHERE dutycode = a.dutycode)              AS 责任名称,
       (SELECT CASE SUBSTR(c.calfactorvalue, 0, INSTR(c.calfactorvalue, ',') - 1)
                   WHEN '2' THEN 0
                   WHEN '1' THEN TO_NUMBER(SUBSTR(c.calfactorvalue, INSTR(c.calfactorvalue, ',', -1) + 1))
                   ELSE TO_NUMBER(c.calfactorvalue)
                   END
        FROM lccontplandutyparam c
        WHERE c.grpcontno = a.grpcontno
          AND c.riskcode = a.riskcode
          AND c.dutycode = a.dutycode
          AND c.calfactor = 'Amnt'
          AND c.contplancode = a.contplancode)    AS 保额,
       (SELECT c.calfactorvalue
        FROM lccontplandutyparam c
        WHERE c.grpcontno = a.grpcontno
          AND c.riskcode = a.riskcode
          AND c.dutycode = a.dutycode
          AND c.calfactor = 'DailyLimit'
          AND c.contplancode = a.contplancode)    AS 日限额,
       (SELECT c.calfactorvalue
        FROM lccontplandutyparam c
        WHERE c.grpcontno = a.grpcontno
          AND c.riskcode = a.riskcode
          AND c.dutycode = a.dutycode
          AND c.calfactor = 'GetLimitType'
          AND c.contplancode = a.contplancode)    AS 免赔类型,
       (SELECT c.calfactorvalue
        FROM lccontplandutyparam c
        WHERE c.grpcontno = a.grpcontno
          AND c.riskcode = a.riskcode
          AND c.dutycode = a.dutycode
          AND c.calfactor = 'GetLimit'
          AND c.contplancode = a.contplancode)    AS 免赔额,
       (SELECT c.calfactorvalue
        FROM lccontplandutyparam c
        WHERE c.grpcontno = a.grpcontno
          AND c.riskcode = a.riskcode
          AND c.dutycode = a.dutycode
          AND c.calfactor = 'GetRate'
          AND c.contplancode = a.contplancode)    AS 赔付比例,
       (SELECT SUBSTR(c.calfactorvalue, INSTR(c.calfactorvalue, ',', -1) + 1)
        FROM lccontplandutyparam c
        WHERE c.grpcontno = a.grpcontno
          AND c.riskcode = a.riskcode
          AND c.dutycode = a.dutycode
          AND c.calfactor = 'Amnt'
          AND c.contplancode = a.contplancode
          AND c.riskcode = '2062050'
          AND c.dutycode IN ('062050', '062051')) AS 个人限额,
       (SELECT c.calfactorvalue
        FROM lccontplandutyparam c
        WHERE c.grpcontno = a.grpcontno
          AND c.riskcode = a.riskcode
          AND c.dutycode = a.dutycode
          AND c.calfactor = 'PayDay'
          AND c.contplancode = a.contplancode)    AS 给付天数,
       (SELECT c.calfactorvalue
        FROM lccontplandutyparam c
        WHERE c.grpcontno = a.grpcontno
          AND c.riskcode = a.riskcode
          AND c.dutycode = a.dutycode
          AND c.calfactor = 'Prem'
          AND c.contplancode = a.contplancode)    AS 保费,
       (SELECT CASE SUBSTR(c.calfactorvalue, 0, INSTR(c.calfactorvalue, ',') - 1)
                   WHEN '2' THEN 'Y'
                   ELSE 'N'
                   END
        FROM lccontplandutyparam c
        WHERE c.grpcontno = a.grpcontno
          AND c.riskcode = a.riskcode
          AND c.dutycode = a.dutycode
          AND c.calfactor = 'Amnt'
          AND c.contplancode = a.contplancode)    AS 按月薪算保额标记,
       (SELECT SUBSTR(c.calfactorvalue, INSTR(c.calfactorvalue, ',', -1) + 1)
        FROM lccontplandutyparam c
        WHERE c.grpcontno = a.grpcontno
          AND c.riskcode = a.riskcode
          AND c.dutycode = a.dutycode
          AND c.calfactor = 'Amnt'
          AND c.contplancode = a.contplancode
          AND c.calfactorvalue LIKE '2,%')        AS 月薪倍数,
       (SELECT c.calfactorvalue
        FROM lccontplandutyparam c
        WHERE c.grpcontno = a.grpcontno
          AND c.riskcode = a.riskcode
          AND c.dutycode = a.dutycode
          AND c.calfactor = 'FloatRate'
          AND c.contplancode = a.contplancode)    AS 费率,
       '2026-04-22'                               AS 最后更新日期,
       '16:57:31'                                 AS 最后更新时间
FROM (SELECT DISTINCT grpcontno, contplancode, riskcode, dutycode
      FROM lccontplandutyparam c
      WHERE c.grpcontno = '2026042200000556') a,
     lcgrpcont b
WHERE a.grpcontno = b.grpcontno;

--团单终止LCCONTPLANDUTYPARAMXBBAK
SELECT a.grpcontno                                AS 保单号,
       a.contplancode                             AS 计划编码,
       a.riskcode                                 AS 险种编码,
       (SELECT riskname
        FROM lmriskapp
        WHERE riskcode = a.riskcode)              AS 险种名称,
       a.dutycode                                 AS 责任编码,
       (SELECT DutyName
        FROM LMDUTY
        WHERE dutycode = a.dutycode)              AS 责任名称,
       (SELECT CASE SUBSTR(c.calfactorvalue, 0, INSTR(c.calfactorvalue, ',') - 1)
                   WHEN '2' THEN 0
                   WHEN '1' THEN TO_NUMBER(SUBSTR(c.calfactorvalue, INSTR(c.calfactorvalue, ',', -1) + 1))
                   ELSE TO_NUMBER(c.calfactorvalue)
                   END
        FROM lccontplandutyparam c
        WHERE c.grpcontno = a.grpcontno
          AND c.riskcode = a.riskcode
          AND c.dutycode = a.dutycode
          AND c.calfactor = 'Amnt'
          AND c.contplancode = a.contplancode)    AS 保额,
       (SELECT c.calfactorvalue
        FROM lccontplandutyparam c
        WHERE c.grpcontno = a.grpcontno
          AND c.riskcode = a.riskcode
          AND c.dutycode = a.dutycode
          AND c.calfactor = 'DailyLimit'
          AND c.contplancode = a.contplancode)    AS 日限额,
       (SELECT c.calfactorvalue
        FROM lccontplandutyparam c
        WHERE c.grpcontno = a.grpcontno
          AND c.riskcode = a.riskcode
          AND c.dutycode = a.dutycode
          AND c.calfactor = 'GetLimitType'
          AND c.contplancode = a.contplancode)    AS 免赔类型,
       (SELECT c.calfactorvalue
        FROM lccontplandutyparam c
        WHERE c.grpcontno = a.grpcontno
          AND c.riskcode = a.riskcode
          AND c.dutycode = a.dutycode
          AND c.calfactor = 'GetLimit'
          AND c.contplancode = a.contplancode)    AS 免赔额,
       (SELECT c.calfactorvalue
        FROM lccontplandutyparam c
        WHERE c.grpcontno = a.grpcontno
          AND c.riskcode = a.riskcode
          AND c.dutycode = a.dutycode
          AND c.calfactor = 'GetRate'
          AND c.contplancode = a.contplancode)    AS 赔付比例,
       (SELECT SUBSTR(c.calfactorvalue, INSTR(c.calfactorvalue, ',') + 1)
        FROM lccontplandutyparam c
        WHERE c.grpcontno = a.grpcontno
          AND c.riskcode = a.riskcode
          AND c.dutycode = a.dutycode
          AND c.calfactor = 'Amnt'
          AND c.contplancode = a.contplancode
          AND c.riskcode = '2062050'
          AND c.dutycode IN ('062050', '062051')) AS 个人限额,
       (SELECT c.calfactorvalue
        FROM lccontplandutyparam c
        WHERE c.grpcontno = a.grpcontno
          AND c.riskcode = a.riskcode
          AND c.dutycode = a.dutycode
          AND c.calfactor = 'PayDay'
          AND c.contplancode = a.contplancode)    AS 给付天数,
       (SELECT c.calfactorvalue
        FROM lccontplandutyparam c
        WHERE c.grpcontno = a.grpcontno
          AND c.riskcode = a.riskcode
          AND c.dutycode = a.dutycode
          AND c.calfactor = 'Prem'
          AND c.contplancode = a.contplancode)    AS 保费,
       (SELECT CASE SUBSTR(c.calfactorvalue, 0, INSTR(c.calfactorvalue, ',') - 1)
                   WHEN '2' THEN 'Y'
                   ELSE 'N'
                   END
        FROM lccontplandutyparam c
        WHERE c.grpcontno = a.grpcontno
          AND c.riskcode = a.riskcode
          AND c.dutycode = a.dutycode
          AND c.calfactor = 'Amnt'
          AND c.contplancode = a.contplancode)    AS 按月薪算保额标记,
       (SELECT SUBSTR(c.calfactorvalue, INSTR(c.calfactorvalue, ',', -1) + 1)
        FROM lccontplandutyparam c
        WHERE c.grpcontno = a.grpcontno
          AND c.riskcode = a.riskcode
          AND c.dutycode = a.dutycode
          AND c.calfactor = 'Amnt'
          AND c.contplancode = a.contplancode
          AND c.calfactorvalue LIKE '2,%')        AS 月薪倍数,
       (SELECT c.calfactorvalue
        FROM lccontplandutyparam c
        WHERE c.grpcontno = a.grpcontno
          AND c.riskcode = a.riskcode
          AND c.dutycode = a.dutycode
          AND c.calfactor = 'FloatRate'
          AND c.contplancode = a.contplancode)    AS 费率,
       '2026-04-22'                               AS 最后更新日期,
       '17:53:35'                                 AS 最后更新时间
FROM (SELECT DISTINCT grpcontno, contplancode, riskcode, dutycode
      FROM lccontplandutyparam c
      WHERE c.grpcontno = '2024062100000126') a,
     lcgrpcont b
WHERE a.grpcontno = b.grpcontno;