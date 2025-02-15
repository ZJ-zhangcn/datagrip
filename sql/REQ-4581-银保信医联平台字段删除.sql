--code='1'为开，开为校验
select a.* from ldcode a WHERE CODETYPE = 'AssisadmissionDateflag'

--
select a.* from lcRiskMapInfo a where AUTHORIZEDCERTNO='350824198001100013'
SELECT * FROM lcRiskMapInfo WHERE AdmissionDate is not null
select admissionDate,dischargeDate,departmentCode,departmentName,a.* from lcRiskMapInfo a where policyno='5000118341206476' or CLAIMNO='5000118341206476'

select admissionDate,dischargeDate,departmentCode,departmentName,a.*
from lcRiskMapInfo a
where InvestigatedName = '李娜'
  and InvestigatedCertType = '0'
  and InvestigatedCertNo = '310101198808083314'
  and RiskMapFlag = '2'
  and investigationTimes is not null
order by ApplyInvestigationDate desc

select a.* from lcinsured a where idno='350824198001100013'

select a.* from lcpol a where contno in ('','5000118340202013')

select a.* from lcpol a where prtno='5000118341206476'

select a.* from lmriskapp a where riskcode='1056010'