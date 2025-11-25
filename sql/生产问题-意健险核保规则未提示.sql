select codename from ldcode where codetype = 'LINK_STAUTS' and code='01';
--1：开
select * from ldcode1 where CODETYPE ='IsJoggle';
--个人寿险接口：
select riskcode,makedate,insuredname,insuredidno,a.*
  from lcRiskManagementInfo a
 where business = 'HB_Life'
/*   and makedate > trunc(sysdate - 5)
   and riskcode = ''
   and insuredname = ''
   and insuredidtype = ''
   and insuredidno = ''*/
   and (abnormalCheck = 'Y' or dense = 'Y' or sumInsured = 'Y' or
       multiCompany = 'Y' or searchComCnt = 'Y' or
       majorDiseasePayment = 'Y' or accAccumulativeMoney = 'Y' or
       denseRGA = 'Y' or multiCompanyRGA = 'Y')
 order by a.makedate desc;
--王五寿险核保17

--个人津贴接口：
select riskcode,makedate,insuredname,insuredidno,a.*
  from lcRiskManagementInfo a
 where business = 'HB_allowanceCheck'
/*   and makedate > trunc(sysdate - 5)
   and riskcode = ''
   and insuredname = ''
   and insuredidtype = ''
   and insuredidno = ''*/
   and (abnormalCheck = 'Y' or abnormalPayment = 'Y' or
       majorDiseasePayment = 'Y' or chronicDiseasePayment = 'Y' or
       DAYMONEYSUM = 'Y' or paymentCountOneYear = 'Y' or
       PAYMENTDAYCOUNT = 'Y' or specDiseasePayment = 'Y')
 order by a.makedate desc;

--重大疾病接口：
select riskcode,makedate,insuredname,insuredidno,a.*
  from lcRiskManagementInfo a
 where business = 'HB_majorDiseaseCheck'
/*   and makedate > trunc(sysdate - 5)
   and riskcode = ''
   and insuredname = ''
   and insuredidtype = ''
   and insuredidno = ''*/
   and (abnormalCheck = 'Y' or abnormalPayment = 'Y' or
       majorDiseasePayment = 'Y' or chronicDiseasePayment = 'Y' or
       majorDiseaseMoney = 'Y' or
       multiCompany = 'Y' and dense = 'Y' and specDiseasePayment = 'Y' or
       searchComCnt = 'Y')
 order by a.makedate desc;
insert into lcRiskManagementInfo (SERIALNO, ACCNO, CONTNO, PRTNO, CASENO, RISKCODE, INSUREDNAME, INSUREDIDTYPE, INSUREDIDNO, COMPANYCODE, BUSINESS, RISKTYPE, CUSTOMERALLOWED, MULTICOMPANY, MAJORDISEASEPAYMENT, DISABILITY, DENSE, ACCUMULATIVEMONEY, PAGEQUERYCODE, TAGDATE, DISPLAYPAGE, ABNORMALCHECK, ABNORMALPAYMENT, CHRONICDISEASEPAYMENT, PAYMONEY, DAYMONEY, COUNTONEYEAR, PAYMENTCOUNTONEYEAR, PAYMENTED, PAYMENTCOUNT, DAYMONEYSUM, MAJORDISEASEMONEY, PAYCOUNT, PAYMENTDAYCOUNT, PAYMENTED2, RECEIPTCODE, HOSPITALCODE, OPERATOR, MAKEDATE, MAKETIME, MODIFYDATE, MODIFYTIME, INSURERUUID, DRIVEACCACCUMULATIVEMONEY, DRIVEDUTYMULTICOMPANY, SPECDISEASEPAYMENT, RECEIPTREPETITIONS, IFSPLITLIST, MULTICOMPANY2, INSUREDIFDEAD, SEARCHCOMCNT, SUMINSURED, ACCACCUMULATIVEMONEY, MULTICOMPANYRGA, DENSERGA, MULTICOMPANY3, ABNORMALCHECK2, ABNORMALPAYMENT2, SHORTCLM, ACCCOMMEDICLMCNT, MAJORDISEASEPAYMENT2, DENSE2)
values ('00000000000000010104', '190_gaomin', '2020080100102496', '2020080100102496', null, '1053002', '健核津贴十一', '0', '110101198401140551', '000190', 'HB_majorDiseaseCheck', 'A', 'Y', 'N.A.', 'N.A.', null, 'N.A.', null, '2020042300012460792753938', '2019-05-17', 'Y', 'Y', 'N.A.', 'N.A.', null, null, null, null, null, null, null, 'N.A.', null, null, null, null, null, 'E001', to_date('28-08-2019', 'dd-mm-yyyy'), '00:22:03', to_date('28-08-2019', 'dd-mm-yyyy'), '00:22:03', '0001900000000081', null, null, 'N.A.', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
--医疗补偿接口：
select riskcode,makedate,insuredname,insuredidno,a.*
  from lcRiskManagementInfo a
 where business = 'HB_supplementaryMedicalCheck'
/*   and makedate > trunc(sysdate - 5)
   and riskcode = ''
   and insuredname = ''
   and insuredidtype = ''
   and insuredidno = ''*/
   and (abnormalCheck = 'Y' or abnormalPayment = 'Y' or
       majorDiseasePayment = 'Y' or chronicDiseasePayment = 'Y' or
       payCount = 'Y' or paymoney = 'Y' and specDiseasePayment = 'Y')
 order by a.makedate desc;
--个人意外接口：
select riskcode,makedate,insuredname,insuredidno,a.*
  from lcRiskManagementInfo a
 where business = 'HB_accident'
/*   and makedate > trunc(sysdate - 5)
   and riskcode = ''
   and insuredname = ''
   and insuredidtype = ''
   and insuredidno = ''*/
   and (multiCompany = 'Y' or majorDiseasePayment = 'Y' or disability = 'Y' or
       dense = 'Y' or accumulativeMoney = 'Y' or
       DriveAccAccumulativeMoney = 'Y' or DriveDutyMultiCompany = 'Y' or
       SpecDiseasePayment = 'Y' or InsuredIfDead = 'Y' or
       SearchComCnt = 'Y')
 order by a.makedate desc;
insert into lcRiskManagementInfo (SERIALNO, ACCNO, CONTNO, PRTNO, CASENO, RISKCODE, INSUREDNAME, INSUREDIDTYPE, INSUREDIDNO, COMPANYCODE, BUSINESS, RISKTYPE, CUSTOMERALLOWED, MULTICOMPANY, MAJORDISEASEPAYMENT, DISABILITY, DENSE, ACCUMULATIVEMONEY, PAGEQUERYCODE, TAGDATE, DISPLAYPAGE, ABNORMALCHECK, ABNORMALPAYMENT, CHRONICDISEASEPAYMENT, PAYMONEY, DAYMONEY, COUNTONEYEAR, PAYMENTCOUNTONEYEAR, PAYMENTED, PAYMENTCOUNT, DAYMONEYSUM, MAJORDISEASEMONEY, PAYCOUNT, PAYMENTDAYCOUNT, PAYMENTED2, RECEIPTCODE, HOSPITALCODE, OPERATOR, MAKEDATE, MAKETIME, MODIFYDATE, MODIFYTIME, INSURERUUID, DRIVEACCACCUMULATIVEMONEY, DRIVEDUTYMULTICOMPANY, SPECDISEASEPAYMENT, RECEIPTREPETITIONS, IFSPLITLIST, MULTICOMPANY2, INSUREDIFDEAD, SEARCHCOMCNT, SUMINSURED, ACCACCUMULATIVEMONEY, MULTICOMPANYRGA, DENSERGA, MULTICOMPANY3, ABNORMALCHECK2, ABNORMALPAYMENT2, SHORTCLM, ACCCOMMEDICLMCNT, MAJORDISEASEPAYMENT2, DENSE2)
values ('00000000000000010151', '190_gaomin', '2021010200000166', '2021010200000166', null, '1075001', '健核津贴十一', '1', '110101198401140551', '000190', 'HB_accident', 'A', 'Y', 'N.A.', 'Y', 'N.A.', 'N.A.', 'N.A.', '2020050800019067036949189', '2019-05-17', 'Y', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'E001', to_date('02-01-2021', 'dd-mm-yyyy'), '00:38:44', to_date('02-01-2021', 'dd-mm-yyyy'), '00:38:44', '0001900000000129', 'N.A.', 'N.A.', 'N.A.', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);