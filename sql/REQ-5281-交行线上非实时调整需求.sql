select BankAgent, BankAgentName, inputoperator, SALECHANNELS, a.*
from lccont a
where contno = '2026042700004276';

select TAXPAYTYPE, a.*
from LCContTaxPayer a
where contno = '2026042700004276';

select TAXPAYTYPE, a.*
from LCTaxPayer a
where CUSTOMERNO in (select appntno from lccont where contno = '2026042700004276');

select a.*
from LCAPPNT a
where contno = '2026042700004276';

select SequenceNo, a.*
from LCInsured a
where contno = '2026042700004276';

/*
update LCInsured
set SequenceNo='1'
where contno = '2026042700004276';

update LCAppnt
set DenType=null
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
set InsuredBankCode=null,
    InsuredAccName=null,
    InsuredBankAccNo=null,
    InsuredBankCity=null,
    InsuredBankProvince=null,
    InsuredAccType=null,
    InsuredBankStatus='0',
    inputoperator='ybt'
where contno = '2026042700004276';
*/
