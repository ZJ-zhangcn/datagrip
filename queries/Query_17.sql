
SELECT
    CASE
        WHEN ?Duration? >= 5 THEN
            ?Amnt? + NVL(
                (SELECT amnt
                 FROM (
                     SELECT amnt
                     FROM lpduty
                     WHERE contno = '?ContNo?'
                       AND TO_DATE(FirstPayDate, 'YYYY-MM-DD') BETWEEN
                           ADD_MONTHS(TO_DATE((SELECT CValiDate FROM LCDUTY WHERE CONTNO = '?ContNo?' AND ROWNUM = 1), 'YYYY-MM-DD'), (?Duration? - 1) * 12)
                           AND ADD_MONTHS(TO_DATE((SELECT CValiDate FROM LCDUTY WHERE CONTNO = '?ContNo?' AND ROWNUM = 1), 'YYYY-MM-DD'), ?Duration? * 12)
                       AND LENGTH(dutycode) = 10
                       AND SUBSTR(dutycode, 7, 1) = '1'
                     ORDER BY EdorNo
                 ) WHERE ROWNUM = 1
                ),
                (SELECT NVL(SUM(amnt), 0)
                 FROM lcduty
                 WHERE contno = '?ContNo?'
                   AND LENGTH(dutycode) = 10
                   AND SUBSTR(dutycode, 7, 1) = '1')
            )
        ELSE 0
    END
FROM lcpol
WHERE contno = '?ContNo?'
  AND riskcode = '1136003'
