select uwflag,uwdate,a.* from lccont a where prtno in ('5000118350721350','');

select HealthFlag,a.* from lcinsured a where prtno in ('5000118350721350','');

select a.* from lccuwmaster a where contno in ('','5000118350721350');

select a.* from ldcode a where CODEname like '%ÌÇÄò²¡%';

select PolicyNo, BussType, TransTypeCorrBussType, TransAmnt, TransDate, a.*
from TEMP_LCPOLTRANSACTION a
where POLICYNO in ('5000118350721350');

select PolicyNo,
       PrtNo,
       SignDate,
       CashValue,
       CurPaidToDate,
       PayBeginDate,
       EffDate,
       UWDate,
       UWType,
       PolStatus,
       PolicyEndDate,
       a.*
from TEMP_LCCONT a
where POLICYNO in ('5000118350721350');

select PolicyNo,
       ProductNo,
       EffDate,
       PayBeginDate,
       FinalPayDate,
       CurPaidToDate,
       InvalidDate,
       CashValue,
       UWConclusion,
       Status,
       EMRate,
       a.*
from TEMP_LCPRODUCT a
where POLICYNO in ('5000118350721350');

select PolicyNo, ApplicationFormNo, ProductNo, EffDate, InvalidDate, Status, a.*
from TEMP_LCLIABILITY a
where POLICYNO in ('5000118350721350');

select PolicyNo, HealthCondition, a.*
from TEMP_LCINSURED a
where POLICYNO in ('5000118350721350');

select PolicyNo,
       ProductNo,
       UWType,
       UWBusinessType,
       PhysicalExamination,
       InvestigationFlag,
       UWDate,
       UWConclusion,
       UWDesc,
       DeclinedReason,
       a.*
from TEMP_LALLUNDERWRITING a
where POLICYNO in ('5000118350721350');


--prip
select PolicyNo, BussType, TransTypeCorrBussType, TransAmnt, TransDate, a.*
from prip_LCPOLTRANSACTION a
where POLICYNO in ('5000118350721350');

select PolicyNo,
       PrtNo,
       SignDate,
       CashValue,
       CurPaidToDate,
       PayBeginDate,
       EffDate,
       UWDate,
       UWType,
       PolStatus,
       PolicyEndDate,
       a.*
from prip_LCCONT a
where POLICYNO in ('5000118350721350');

select PolicyNo,
       ProductNo,
       EffDate,
       PayBeginDate,
       FinalPayDate,
       CurPaidToDate,
       InvalidDate,
       CashValue,
       UWConclusion,
       Status,
       EMRate,
       a.*
from prip_LCPRODUCT a
where POLICYNO in ('5000118350721350');

select PolicyNo, ApplicationFormNo, ProductNo, EffDate, InvalidDate, Status, a.*
from prip_LCLIABILITY a
where POLICYNO in ('5000118350721350');

select PolicyNo, HealthCondition, a.*
from prip_LCINSURED a
where POLICYNO in ('5000118350721350');

select PolicyNo,
       ProductNo,
       UWType,
       UWBusinessType,
       PhysicalExamination,
       InvestigationFlag,
       UWDate,
       UWConclusion,
       UWDesc,
       DeclinedReason,
       a.*
from prip_LALLUNDERWRITING a
where POLICYNO in ('5000118350721350');
