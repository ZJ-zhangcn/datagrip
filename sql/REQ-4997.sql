-- id: req-4997
-- 标题: 保全申请页面申请资格人电话获取逻辑调整

select appntname, insuredname, appntno, insuredno
from lccont
where contno = '2025091000001386';

select mobile, homephone, a.*
from lcaddress a
where customerno in ('1001736052', '');

--17609100001

select decode(a.preferredaddress, 1, a.homeaddress, 2, a.companyaddress),
       decode(a.preferredaddress, 1, a.homezipcode, 2, a.companyzipcode),
       decode(a.mobile, '', a.homephone, a.mobile)
from lcaddress a,
     lcappnt b
where b.contno = '2025081200000456'
  and a.customerno = b.appntno
  and a.addressno = b.addressno;