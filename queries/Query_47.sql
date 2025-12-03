
SELECT
  CASE
    WHEN ?Duration? >= 5 THEN
      ?Amnt? + NVL(
        (SELECT amnt FROM (SELECT amnt FROM lpduty WHERE contno = '?ContNo?' AND LENGTH(dutycode) = 10 AND SUBSTR(dutycode, 7, 1) = '1' AND edortype = 'PT' AND FirstPayDate BETWEEN ADD_MONTHS((SELECT CValiDate FROM LCDUTY WHERE CONTNO = '?ContNo?' AND ROWNUM = 1), (?Duration? - 1) * 12) AND ADD_MONTHS((SELECT CValiDate FROM LCDUTY WHERE CONTNO = '?ContNo?' AND ROWNUM = 1), ?Duration? * 12) ORDER BY EdorNo DESC) WHERE ROWNUM = 1),
        (SELECT NVL(SUM(amnt), 0) FROM lcduty WHERE contno = '?ContNo?' AND LENGTH(dutycode) = 10 AND SUBSTR(dutycode, 7, 1) = '1')
      ) - NVL((SELECT SUM(JQAmnt) FROM LJABonusGet WHERE ContNo = '?ContNo?' AND FeeFinaType = 'HLAMNT' AND getdate = TO_DATE('?GetToDate?', 'YYYY-MM-DD')), 0)
    ELSE 0
  END
FROM lcpol
WHERE contno = '?ContNo?' AND riskcode = '1136003'
