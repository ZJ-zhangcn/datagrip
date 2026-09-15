-- id: req-5094
-- 标题: 拆单收费金额拆分至险种层

select a.*
from lysendtobank a
where polno = '2025102400000486';

select 1164227.02 / 3
from dual;

select a.*
from ljspay a
where otherno = '2025102400000486';

select splitmoney, allsuccflag, returnmoneyflag, paycount, a.*
from splitcont a
where /*contno = '2025101600000386'
  and */startpaydate = date'2027-10-17';

-- DELETE FROM splitcont WHERE startpaydate = date'2027-10-17';

select feeoperationtype,
       feefinatype,
       riskcode,
       splitmoney,
       remainmoney,
       allsuccflag,
       returnmoneyflag,
       paycount,
       a.*
from splitcontdetail a
where/* contno = '2025101600000386'
  and */startpaydate = date'2027-10-17'
order by splitgetnoticeno, a.splitmoney;

-- DELETE FROM splitcontdetail WHERE startpaydate = date'2027-10-17';

SELECT a.*
FROM lysendtobankb a
WHERE PAYCODE = '30001151000000012670';

select riskcode, prem
from lcpol a
where contno = '2025102400000486';

--1133200.00  31027.02  1164227.02

select round(400000 * 1133200.00 / 1164227.02), 400000 - round(400000 * 1133200.00 / 1164227.02)
from dual;

select a.*
from ljaget a
where otherno = '7402121100330187';

select getmoney, a.*
from ljsgetendorse a
where contno = '2025102400000486';

select getmoney, a.*
from ljagetendorse a
where contno = '2025102400000486'
  and feeoperationtype = 'CT';

SELECT a.*
FROM ATS_TRANSACTIONS a
WHERE REQSEQID = '20271017_44416';

/*

update ATS_TRANSACTIONS a
set a.dtcode          = '1',--抽档成功
    a.ats_returnstate = '2',--已返盘
    a.transstate      = '2',--处理成功
    a.payinfocode     = 'S0000',
    a.payinfo         = '支付成功'
where a.reqseqid = '20271017_44416'
  and RDSEQ in ('1001003681', '1001003682','1001003684','1001003685');

update ats_transactions a
   set a.dtcode          = '1',--抽档成功
       a.ats_returnstate = '2',--已返盘
       a.transstate      = '3',--处理失败
       a.payinfocode     = 'E1004',
       a.payinfo         = '余额不足'
where a.reqseqid = '20271017_44416'
  and RDSEQ in ('1001003683', '1001003686');

*/
SELECT a.*
FROM LIS.LJSPAY a
WHERE STARTPAYDATE = date'2027-10-17';--2027-12-16
SELECT a.*
FROM LIS.LJSPAYPERSON a
WHERE contno = '2023022800000166';
SELECT a.*
FROM ljspay a
WHERE OTHERNOTYPE = '2'

  and otherno = '2023022800000166';
select a.*
from lcpol a
where appflag = '1'
  and not exists (select 1 from lpedoritem where contno = a.contno)
  and not exists
        (select 1 from lcconthangupstate where contno = a.contno)
  and not exists (select 1
                  from lccontstate
                  where statetype = 'Available'
                    and enddate is not null
                    and contno = a.contno)
  and not exists (select 1
                  from lccontstate
                  where statetype = 'DefedPay'
                    and contno = a.contno)
  and not exists(select 1 from llcase where (customerno = a.appntno or customerno = a.insuredno))
  and not exists(select 1 from lcinsureacctrace where contno = a.contno)
  and grpcontno = '00000000000000000000'
  and (APPNTNAME like '个险投保%' or APPNTNAME like '银保投保%')
  and cvalidate between date '2025-01-01' and date
    '2026-01-01'
  and payintv = '12'
order by cvalidate desc;

SELECT a.* FROM LIS.LYSENDTOBANK a WHERE polno='2023022800000166';

SELECT a.* FROM ljspay a WHERE otherno in ('2023022800000166','2025101600000386');
SELECT a.* FROM ljspayperson a WHERE contno in ('2023022800000166','2025101600000386');

SELECT a.* FROM LIS.LYSENDTOBANK a WHERE polno in ('2023022800000166','2025101600000386');