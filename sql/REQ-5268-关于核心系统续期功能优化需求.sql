--找数据
select a.*
from lcpol a
where appflag = '1'
  and not exists (select 1 from lpedoritem where contno = a.contno)
  and not exists (select 1 from lcconthangupstate where contno = a.contno)
  and not exists (select 1
                  from lccontstate
                  where statetype = 'Available'
                    and enddate is not null
                    and contno = a.contno)
  and not exists (select 1
                  from lccontstate
                  where statetype = 'DefedPay'
                    and contno = a.contno)
  and substr(a.contno, 1, 8) = to_char(a.signdate, 'YYYYMMDD')
  and (substr(a.contno, 1, 8) = to_char(a.cvalidate - 1, 'YYYYMMDD')
    or substr(a.contno, 1, 8) = to_char(a.cvalidate, 'YYYYMMDD'))
  and (select count(1) from ljapayperson where contno = a.contno) = 1
  and not exists (select 1
                  from llregister
                  where customerno in (a.appntno, a.insuredno))
--   and not exists (select 1 from lcinsureacctrace where contno = a.contno)
  and grpcontno = '00000000000000000000'
--   and (APPNTNAME like '个险投保%' or APPNTNAME like '银保投保%')
  and signdate between date '2024-01-01' and date'2026-09-02'
  and payintv = '12'
  and exists(select 1 from lmriskapp WHERE riskcode = a.riskcode and riskname like '%万能%')
order by cvalidate;

SELECT prtseq, a.*
FROM loprtmanager a
WHERE otherno = '2024022100000926'
  and PRTSEQ = '860101202600017208';

SELECT a.*
FROM ljapay a
WHERE incomeno = '2025030400000586';

SELECT a.*
FROM ljspay a
WHERE otherno = '2025030400000586';

SELECT a.*
FROM ljspayperson a
WHERE contno = '2025030400000586';

SELECT a.*
FROM ldtask a
WHERE taskdescribe like '%恢复%';--000605  000472  000208

SELECT a.*
FROM LCRnewApplyPay a
WHERE contno = '2025030400000586';

