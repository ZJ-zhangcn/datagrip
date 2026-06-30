-- id: req-5009
-- 标题: 转账失败数据修改收付费方式可再次推送资金系统的需求

select paymode, bankaccno, a.*
from ljspay a
where otherno = '5000118351203725';

select paymode, bankaccno, a.*
from ljaget a
where otherno = '3631815101095877';

select paymode, bankaccno, a.*
from ljaget a
where actugetno = '86000020260370000184';

/*
update ljspay
set paymode='9',
    prtnotestate='1'
where otherno = '5000112600005658';

update ljaget
set paymode='4',
    bankonthewayflag='0',
    prtnotestate='1'
where otherno = '3229315100006814';
*/

select a.*
from loprtmanager a
where otherno = '3631815101095877'
order by prtseq, othernotype;

select *
from lyreturnfrombankb
where /*paycode = '86010120260310001983'
  and */polno = '5000112600005658'
  and banksuccflag = 'E1004';

select a.*
from ldtask a
where taskclass in ('AutoSendToBankPlatWYTask', 'AutoReturnFromBankWYPlatTask');

select uwflag
from lccont
where prtno = '5000118351203589';

/*
update lccont
set uwflag='9'
where prtno = '5000118351203589';
*/

select a.*
from ldcode a
where codetype = 'uwflag';

select a.*
from lcgrpcont a
where grpname like '%团险投保有限公司%'
  and appflag = '1'
order by cvalidate desc;

select a.*
from lcpol a
where grpcontno = '2025111700006986';


