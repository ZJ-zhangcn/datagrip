select AppntName, InsuredName, appntno, insuredno
from LCCont
where ContNo = '2025091000001386';

select mobile, homephone, a.*
from lcaddress a
where CUSTOMERNO in ('1001736052', '');--17609100001

select decode(a.preferredaddress, 1, a.homeaddress, 2, a.companyaddress),
       decode(a.preferredaddress, 1, a.homezipcode, 2, a.companyzipcode),
       decode(a.mobile, '', a.homephone, a.mobile)
From lcaddress a,
     lcappnt b
where b.contno = '2025081200000456'
  and a.customerno = b.appntno
  and a.addressno = b.addressno;