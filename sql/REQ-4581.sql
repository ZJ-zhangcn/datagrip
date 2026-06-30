-- id: req-4581
-- 标题: 银保信医联平台字段删除

--code='1'为开，开为校验
select a.* from ldcode a where codetype = 'AssisadmissionDateflag'

--
select a.* from lcriskmapinfo a where authorizedcertno='350824198001100013'

select * from lcriskmapinfo where admissiondate is not null

select admissiondate,dischargedate,departmentcode,departmentname,a.* from lcriskmapinfo a where policyno='5000118341206476' or claimno='5000118341206476'

select admissiondate,dischargedate,departmentcode,departmentname,a.*
from lcriskmapinfo a
where investigatedname = '李娜'
  and investigatedcerttype = '0'
  and investigatedcertno = '310101198808083314'
  and riskmapflag = '2'
  and investigationtimes is not null
order by applyinvestigationdate desc

select a.* from lcinsured a where idno='350824198001100013'

select a.* from lcpol a where contno in ('','5000118340202013')

select a.* from lcpol a where prtno='5000118341206476'

select a.* from lmriskapp a where riskcode='1056010';