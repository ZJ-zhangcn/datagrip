-- id: req-4659
-- 标题: 57-拒保和58-延期需求

select uwflag,uwdate,a.* from lccont a where prtno in ('5000118350721350','');

select healthflag,a.* from lcinsured a where prtno in ('5000118350721350','');

select a.* from lccuwmaster a where contno in ('','5000118350721350');

select a.* from ldcode a where codename like '%糖尿病%';

select policyno, busstype, transtypecorrbusstype, transamnt, transdate, a.*
from temp_lcpoltransaction a
where policyno in ('5000118350721350');

select policyno,
       prtno,
       signdate,
       cashvalue,
       curpaidtodate,
       paybegindate,
       effdate,
       uwdate,
       uwtype,
       polstatus,
       policyenddate,
       a.*
from temp_lccont a
where policyno in ('5000118350721350');

select policyno,
       productno,
       effdate,
       paybegindate,
       finalpaydate,
       curpaidtodate,
       invaliddate,
       cashvalue,
       uwconclusion,
       status,
       emrate,
       a.*
from temp_lcproduct a
where policyno in ('5000118350721350');

select policyno, applicationformno, productno, effdate, invaliddate, status, a.*
from temp_lcliability a
where policyno in ('5000118350721350');

select policyno, healthcondition, a.*
from temp_lcinsured a
where policyno in ('5000118350721350');

select policyno,
       productno,
       uwtype,
       uwbusinesstype,
       physicalexamination,
       investigationflag,
       uwdate,
       uwconclusion,
       uwdesc,
       declinedreason,
       a.*
from temp_lallunderwriting a
where policyno in ('5000118350721350');

--prip
select policyno, busstype, transtypecorrbusstype, transamnt, transdate, a.*
from prip_lcpoltransaction a
where policyno in ('5000118350721350');

select policyno,
       prtno,
       signdate,
       cashvalue,
       curpaidtodate,
       paybegindate,
       effdate,
       uwdate,
       uwtype,
       polstatus,
       policyenddate,
       a.*
from prip_lccont a
where policyno in ('5000118350721350');

select policyno,
       productno,
       effdate,
       paybegindate,
       finalpaydate,
       curpaidtodate,
       invaliddate,
       cashvalue,
       uwconclusion,
       status,
       emrate,
       a.*
from prip_lcproduct a
where policyno in ('5000118350721350');

select policyno, applicationformno, productno, effdate, invaliddate, status, a.*
from prip_lcliability a
where policyno in ('5000118350721350');

select policyno, healthcondition, a.*
from prip_lcinsured a
where policyno in ('5000118350721350');

select policyno,
       productno,
       uwtype,
       uwbusinesstype,
       physicalexamination,
       investigationflag,
       uwdate,
       uwconclusion,
       uwdesc,
       declinedreason,
       a.*
from prip_lallunderwriting a
where policyno in ('5000118350721350');