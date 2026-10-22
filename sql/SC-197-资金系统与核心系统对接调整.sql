SELECT a.*
from ldcode a
where codetype = 'YBTSwitch';

SELECT a.*
from ldcode a
where codetype = 'ybtsendtobank';

SELECT a.*
from ldcode a
where codetype = 'fincom';

SELECT a.*
FROM ljspay a
WHERE otherno = '5000118360513590';

SELECT a.*
FROM ldtask a
WHERE taskdescribe like '%ДњПл%';
SELECT a.*
FROM ldtaskplan a
WHERE taskcode = '000526';

SELECT managecom, a.*
FROM ljspay a
WHERE otherno = '2026082400000686';



SELECT a.*
FROM lysendtobank a
WHERE SERIALNO in ('20260922_33869', '20260922_33870', '20260922_33871');

SELECT APPLYENTITY, a.*
FROM ATS_TRANSACTIONS a
WHERE REQSEQID in ('20260922_33869', '20260922_33870', '20260922_33871');



SELECT count(1)
FROM ldtaskparam a
WHERE taskcode in (select taskcode from ldtask where taskclass = 'YBTPreSRCBQueryTask')
  and paramname = 'BankCode'
  and paramvalue in ('0117', '0120')
  and taskplancode in (select taskplancode from ldtaskplan where taskcode = a.taskcode);


/*
DELETE
FROM LDTaskRunLog a
where taskplancode in (SELECT taskplancode
                       FROM ldtaskparam a
                       WHERE taskcode in (select taskcode from ldtask where taskclass = 'YBTPreSRCBQueryTask')
                         and paramname = 'BankCode'
                         and paramvalue in ('0117', '0120')
                         and taskplancode in (select taskplancode from ldtaskplan where taskcode = a.taskcode));
DELETE
FROM LDTaskParam a
where taskplancode in (SELECT taskplancode
                       FROM ldtaskparam a
                       WHERE taskcode in (select taskcode from ldtask where taskclass = 'YBTPreSRCBQueryTask')
                         and paramname = 'BankCode'
                         and paramvalue in ('0117', '0120')
                         and taskplancode in (select taskplancode from ldtaskplan where taskcode = a.taskcode));
DELETE
FROM LDTaskPlan a
where taskplancode in (SELECT taskplancode
                       FROM ldtaskparam a
                       WHERE taskcode in (select taskcode from ldtask where taskclass = 'YBTPreSRCBQueryTask')
                         and paramname = 'BankCode'
                         and paramvalue in ('0117', '0120')
                         and taskplancode in (select taskplancode from ldtaskplan where taskcode = a.taskcode));
*/
