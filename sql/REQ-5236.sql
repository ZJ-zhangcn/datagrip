-- id: req-5236
-- 标题: 信托受益人相关字段调整需求

select a.*
from lptrustcompany a,
     lpedoritem d,
     lpcont lp
where '1768291343000' = '1768291343000'
  and lp.contno = d.contno
  and lp.tccustomerno = a.customerno
  and d.edortype = 'BC'
  and d.edortype = a.edortype
  and d.edorstate = '6'
  and d.contno = '2025123100000396';


select a.edoracceptno
from lpedoritem a,
     lptrustcompany b
where '1768294848000' = '1768294848000'
  and a.edorno = b.edorno
  and a.edortype = b.edortype
  and a.edorstate not in ('0', '8', '9', 'c', 'd', '4')
  and a.grpcontno = '00000000000000000000'
  and a.edoracceptno <> '7402121100331034'
  and a.contno = '2025123100000396'
  and (b.companyname = '中信信托有限责任公司' or (b.comdocidno = '202101010000340' and b.comdocidtype = '3'))
  and rownum = 1

select a.* from lpedoritem a where contno = '2025123100000396';
