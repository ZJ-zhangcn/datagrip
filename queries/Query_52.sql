select a.*
from lzcard a,
     ldcode1 b
where a.startno <= '500011825031441'
  and a.endno >= '500011825031441'
  and a.StateFlag = '2'
  and b.codetype = 'cardlength'
  and a.certifycode = b.code
  and length('500011825031441') = b.code1
  and exists(select 1 from ldcode where codetype = 'checkprtno' and code = a.certifycode)
  and a.sendoutcom != '00'
  and a.sendoutcom is not null


INSERT INTO LISDATA.LZCARD (CERTIFYCODE, SUBCODE, RISKCODE, RISKVERSION, STARTNO, ENDNO, SENDOUTCOM, RECEIVECOM,
                            SUMCOUNT, PREM, AMNT, HANDLER, HANDLEDATE, INVALIDATE, TAKEBACKNO, SALECHNL, STATEFLAG,
                            OPERATEFLAG, PAYFLAG, ENTERACCFLAG, REASON, STATE, OPERATOR, MAKEDATE, MAKETIME, MODIFYDATE,
                            MODIFYTIME, APPLYNO, AGENTCOM, VALIDDAYS, LOSTINDFLAG, LOSTINDCONTENT, BACKFLAG, BARCODE,
                            REMARK)
VALUES ('50001182', '0', '0', '0', '500011820031441', '500011829031441', 'A86', 'A8601', 100, 0.00, 0.00, '001',
        DATE '2015-12-28', null, '610010000000307', null, '2', '4', null, null, null, null, '001', DATE '2015-12-28',
        '14:04:31', DATE '2015-12-28', '14:04:31', null, null, 0, null, null, null, null, null);
