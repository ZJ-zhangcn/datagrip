SELECT a.*
FROM ldcode a
WHERE codetype = 'xqbank';
SELECT a.*
FROM ldcode a
WHERE codetype = 'xqdate';

SELECT *
FROM lcpol a
WHERE 1 = 1
  AND NOT EXISTS (SELECT 'X'
                  FROM lccontstate b
                  WHERE a.contno = b.contno
                    AND b.polno = a.polno
                    AND b.statetype IN ('Available', 'PH')
                    AND b.state = '1'
                    AND b.enddate IS NULL)
  AND a.payintv <> 0
  AND a.payintv <> -1
  AND a.conttype = '1'
  AND a.appflag = '1'
  AND NOT EXISTS (SELECT 1
                  FROM lcconthangupstate
                  WHERE contno = a.contno)
  AND NOT EXISTS (SELECT 1
                  FROM ljspay
                  WHERE othernotype = '2'
                    AND otherno = a.contno
                    AND BankOnTheWayFlag = '1')
  AND (
    NOT EXISTS (SELECT 1
                FROM ljtempfee
                WHERE otherno = a.contno
                  AND tempfeetype = '2'
                  AND confdate IS NULL)
        OR EXISTS (SELECT 1
                   FROM splitcont sp,
                        ljspay ljs
                   WHERE sp.contno = ljs.otherno
                     AND a.contno = ljs.otherno
                     AND (sp.splitgetnoticeno = ljs.getnoticeno OR sp.getnoticeno = ljs.getnoticeno))
    )
  AND DECODE(
              (SELECT autopayflag FROM lmriskapp WHERE riskcode = a.riskcode),
              '1',
              NVL((SELECT autopayflag FROM lccont WHERE contno = a.contno), '0'),
              '0'
      ) <> '1'
  AND a.paytodate < a.payenddate
  AND DATE '2026-09-14' between a.paytodate and a.paytodate + 60
  and exists (select 1 from lccont where contno = a.contno and bankcode = '0119')
/* 替换为批处理运行日期 mCurrentDate */

-- 【可选条件：指定机构】
-- AND SUBSTR(a.managecom, 1, 4) IN ('8611')

-- 【可选条件：指定保单号】
-- AND a.contno = '2024042400000286'
;

SELECT a.*
FROM lcpol a
WHERE contno = '2024051500000526';
SELECT a.*
FROM ljspay a
WHERE otherno = '2024051500000526';
select *
from LCContState
where StateType in ('Available', 'Terminate')
  and State = '1'
  and contno = '2024051500000526'
  and polno = '210310000006521'
  and enddate is null;


SELECT a.*
FROM ldtask a
WHERE taskclass = 'YBTPreSRCBQueryTask';

