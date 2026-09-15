-- id: req-5281
-- 标题: 交行线上非实时调整需求

select bankagent, bankagentname, inputoperator, salechannels, a.*
from lccont a
where contno = '2026082000000466';

select taxpaytype, a.*
from lcconttaxpayer a
where contno = '2026082000000466';

select taxpaytype, a.*
from lctaxpayer a
where customerno in (select appntno from lccont where contno = '2026082000000466');

select a.*
from lcappnt a
where contno = '2026082000000466';

select sequenceno, a.*
from lcinsured a
where contno = '2026082000000466';

/*
update lcinsured
set sequenceno='1'
where contno = '2026082000000466';

update lcappnt
set dentype=null
where contno = '2026082000000466';
*/

select a.*
from lcaddress a
where customerno in ('1060100507', '');

select a.*
from ldperson a
where customerno in ('1060100507', '');

select a.*
from lcpol a
where contno = '2026082000000466';

/*
update lcpol
set getform='1'
where contno = '2026082000000466';
*/


/*
update lccont
set insuredbankcode=null,
    insuredaccname=null,
    insuredbankaccno=null,
    insuredbankcity=null,
    insuredbankprovince=null,
    insuredacctype=null,
    insuredbankstatus='0',
    inputoperator='ybt'
where contno = '2026082000000466';
*/

SELECT a.* FROM ldtask a WHERE taskclass='ContLateCancel';

WITH candidate AS (
    SELECT DISTINCT p.otherno      AS prtno,
                    '普通逾期撤件' AS rule_name,
                    p.code         AS reason_code,
                    ADDWORKDAYS(
                            p.makedate + a.codename + 1,
                            NVL(d.delaydays, 0) +
                            (SELECT TO_NUMBER(sysvarvalue)
                             FROM ldsysvar
                             WHERE sysvar = 'contcancelhandle')
                    )              AS due_date
    FROM loprtmanager p
             JOIN ldcode a
                  ON p.code = a.code
             JOIN lwmission w
                  ON p.otherno = w.missionprop1
             JOIN lccont t
                  ON p.otherno = t.prtno
             LEFT JOIN LCDelayOverdueNotice d
                       ON p.otherno = d.prtno
                           AND p.prtseq = d.noticeno
    WHERE p.prtseq = p.oldprtseq
      AND a.codetype IN ('contlatecancel', 'contcwcancel')
      AND t.appflag = '0'
      AND t.conttype = '1'
      AND t.uwflag NOT IN ('1', '2', 'a')
      AND NOT EXISTS (SELECT 1
                      FROM loprtmanager p2
                      WHERE p2.oldprtseq = p.prtseq
                        AND p2.code = p.code
                        AND p2.otherno = p.otherno
                        AND p2.stateflag IN ('5', '6'))

    UNION ALL

    SELECT DISTINCT a.prtno,
                    '自动投保单撤件'                AS rule_name,
                    b.code                          AS reason_code,
                    a.polapplydate + b.codename + 1 AS due_date
    FROM lccont a
             JOIN ldcode b
                  ON b.codetype = 'autocontscancancel'
             JOIN lwmission w
                  ON a.prtno = w.missionprop1
    WHERE a.conttype = '1'
      AND a.appflag = '0'
      AND a.uwflag NOT IN ('1', '2', 'a')

    UNION ALL

    SELECT DISTINCT a.prtno,
                    '续保逾期撤件'                                         AS rule_name,
                    b.code                                                 AS reason_code,
                    (SELECT MIN(p.enddate)
                     FROM lcpol p
                     WHERE p.contno = (SELECT r.contno
                                       FROM lccontrenewal r
                                       WHERE r.newprtno = a.contno
                                         AND r.state IN ('0', '1'))
                       AND p.riskcode IN (SELECT DISTINCT code
                                          FROM ldcode1
                                          WHERE codetype = 'renewalrisk')) AS due_date
    FROM lccont a
             JOIN ldcode b
                  ON b.codetype = 'contrenewalcancel'
             JOIN lwmission w
                  ON a.prtno = w.missionprop1
    WHERE a.conttype = '1'
      AND a.appflag = '0'
      AND a.uwflag NOT IN ('1', '2', 'a')
      AND a.renewal = '1'

    UNION ALL

    SELECT DISTINCT a.prtno,
                    '新规则逾期撤件-未撤件'                         AS rule_name,
                    b.code                                          AS reason_code,
                    (SELECT MIN(c.caldate)
                     FROM LDWorkCalendar c
                     WHERE c.caldate > a.polapplydate
                       AND c.datetype = 'Y'
                       AND (SELECT COUNT(1)
                            FROM LDWorkCalendar c2
                            WHERE c2.caldate > a.polapplydate
                              AND c2.caldate <= c.caldate
                              AND c2.datetype = 'Y') >= b.codename) AS due_date
    FROM lccont a
             JOIN ldcode b
                  ON b.codetype = 'contlatecancelnewnotp'
             JOIN lwmission w
                  ON a.prtno = w.missionprop1
    WHERE a.conttype = '1'
      AND a.appflag = '0'
      AND a.uwflag NOT IN ('1', '2', 'a')
      AND NOT EXISTS (SELECT 1
                      FROM loprtmanager p
                               JOIN ldcode tb
                                    ON p.code = tb.code
                      WHERE p.otherno = w.missionprop1
                        AND tb.codetype = 'contlatecancelnewnotp')
      AND a.polapplydate >= TO_DATE(b.othersign, 'yyyy-MM-dd')

    UNION ALL

    SELECT DISTINCT a.prtno,
                    '新规则逾期撤件-已生成撤件任务'                 AS rule_name,
                    b.code                                          AS reason_code,
                    (SELECT MIN(c.caldate)
                     FROM LDWorkCalendar c
                     WHERE c.caldate > a.polapplydate
                       AND c.datetype = 'Y'
                       AND (SELECT COUNT(1)
                            FROM LDWorkCalendar c2
                            WHERE c2.caldate > a.polapplydate
                              AND c2.caldate <= c.caldate
                              AND c2.datetype = 'Y') >= b.codename) AS due_date
    FROM lccont a
             JOIN ldcode b
                  ON b.codetype = 'contlatecancelnewp'
             JOIN lwmission w
                  ON a.prtno = w.missionprop1
    WHERE a.conttype = '1'
      AND a.appflag = '0'
      AND a.uwflag NOT IN ('1', '2', 'a')
      AND EXISTS (SELECT 1
                  FROM loprtmanager p
                  WHERE p.code = b.code
                    AND p.otherno = w.missionprop1)
      AND a.polapplydate >= TO_DATE(b.othersign, 'yyyy-MM-dd')),
     filtered AS (SELECT c.*,
                         CASE
                             WHEN c.due_date <= TRUNC(SYSDATE)
                                 THEN '已达到处理日期，等待批处理执行'
                             ELSE '尚未达到处理日期'
                             END                            AS process_status,
                         TRUNC(SYSDATE) - TRUNC(c.due_date) AS overdue_days
                  FROM candidate c
                  WHERE NOT EXISTS (SELECT 1
                                    FROM LJTEMPFEE f
                                    WHERE f.otherno = c.prtno
                                      AND f.enteraccdate IS NOT NULL))
SELECT prtno,
       rule_name,
       reason_code,
       due_date,
       process_status,
       overdue_days
FROM filtered
WHERE prtno = '2026082000000196'
ORDER BY due_date;
