-- id: req-5281
-- 标题: 交行线上非实时调整需求

select bankagent, bankagentname, inputoperator, salechannels, a.*
from lccont a
where contno = '2026042700004276';

select taxpaytype, a.*
from lcconttaxpayer a
where contno = '2026042700004276';

select taxpaytype, a.*
from lctaxpayer a
where customerno in (select appntno from lccont where contno = '2026042700004276');

select a.*
from lcappnt a
where contno = '2026042700004276';

select sequenceno, a.*
from lcinsured a
where contno = '2026042700004276';

/*
update lcinsured
set sequenceno='1'
where contno = '2026042700004276';

update lcappnt
set dentype=null
where contno = '2026042700004276';
*/

select a.*
from lcaddress a
where customerno in ('1060100507', '');

select a.*
from ldperson a
where customerno in ('1060100507', '');

select a.*
from lcpol a
where contno = '2026042700004276';

/*
update lcpol
set getform='1'
where contno = '2026042700004276';
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
where contno = '2026042700004276';
*/
