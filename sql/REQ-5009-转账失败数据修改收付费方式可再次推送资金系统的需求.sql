select PAYMODE, BANKACCNO, a.*
from ljspay a
where otherno = '5000118351203725';

select PAYMODE, BANKACCNO, a.*
from ljaget a
where otherno = '3631815101095877';

select PAYMODE, BANKACCNO, a.*
from ljaget a
where ACTUGETNO = '86000020260370000184';
/*
update ljspay
set paymode='9',
    PRTNOTESTATE='1'
where otherno = '5000112600005658';

update ljaget
set paymode='4',
    BANKONTHEWAYFLAG='0',
    PRTNOTESTATE='1'
where otherno = '3229315100006814';
*/

select a.*
from LOPRTMANAGER a
where otherno = '3631815101095877'
order by PRTSEQ, OTHERNOTYPE;

select *
from lyreturnfrombankb
where /*paycode = '86010120260310001983'
  and */polno = '5000112600005658'
  and banksuccflag = 'E1004';

select a.*
from ldtask a
where TASKCLASS in ('AutoSendToBankPlatWYTask', 'AutoReturnFromBankWYPlatTask');

select UWFLAG
from LCCont
where prtno = '5000118351203589';

update LCCont
set UWFLAG='9'
where prtno = '5000118351203589';

select a.*
from ldcode a
where codetype = 'uwflag';

select a.*
from LCGRPCONT a
where grpname like '%团险投保有限公司%'
  and APPFLAG = '1'
order by CVALIDATE desc;

select a.*
from lcpol a
where grpcontno = '2025111700006986';


