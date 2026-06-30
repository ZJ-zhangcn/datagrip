select codename from ldcode where codetype = 'LINK_STAUTS' and code='01';

--1：开
select * from ldcode1 where codetype ='IsJoggle';

--个人寿险接口：
select riskcode,makedate,insuredname,insuredidno,a.*
  from lcriskmanagementinfo a
 where business = 'HB_Life'
/*   and makedate > trunc(sysdate - 5)
   and riskcode = ''
   and insuredname = ''
   and insuredidtype = ''
   and insuredidno = ''*/
   and (abnormalcheck = 'Y' or dense = 'Y' or suminsured = 'Y' or
       multicompany = 'Y' or searchcomcnt = 'Y' or
       majordiseasepayment = 'Y' or accaccumulativemoney = 'Y' or
       denserga = 'Y' or multicompanyrga = 'Y')
 order by a.makedate desc;
--王五寿险核保17

--个人津贴接口：
select riskcode,makedate,insuredname,insuredidno,a.*
  from lcriskmanagementinfo a
 where business = 'HB_allowanceCheck'
/*   and makedate > trunc(sysdate - 5)
   and riskcode = ''
   and insuredname = ''
   and insuredidtype = ''
   and insuredidno = ''*/
   and (abnormalcheck = 'Y' or abnormalpayment = 'Y' or
       majordiseasepayment = 'Y' or chronicdiseasepayment = 'Y' or
       daymoneysum = 'Y' or paymentcountoneyear = 'Y' or
       paymentdaycount = 'Y' or specdiseasepayment = 'Y')
 order by a.makedate desc;

--重大疾病接口：
select riskcode,makedate,insuredname,insuredidno,a.*
  from lcriskmanagementinfo a
 where business = 'HB_majorDiseaseCheck'
/*   and makedate > trunc(sysdate - 5)
   and riskcode = ''
   and insuredname = ''
   and insuredidtype = ''
   and insuredidno = ''*/
   and (abnormalcheck = 'Y' or abnormalpayment = 'Y' or
       majordiseasepayment = 'Y' or chronicdiseasepayment = 'Y' or
       majordiseasemoney = 'Y' or
       multicompany = 'Y' and dense = 'Y' and specdiseasepayment = 'Y' or
       searchcomcnt = 'Y')
 order by a.makedate desc;

/*
insert into lcriskmanagementinfo (serialno, accno, contno, prtno, caseno, riskcode, insuredname, insuredidtype, insuredidno, companycode, business, risktype, customerallowed, multicompany, majordiseasepayment, disability, dense, accumulativemoney, pagequerycode, tagdate, displaypage, abnormalcheck, abnormalpayment, chronicdiseasepayment, paymoney, daymoney, countoneyear, paymentcountoneyear, paymented, paymentcount, daymoneysum, majordiseasemoney, paycount, paymentdaycount, paymented2, receiptcode, hospitalcode, operator, makedate, maketime, modifydate, modifytime, insureruuid, driveaccaccumulativemoney, drivedutymulticompany, specdiseasepayment, receiptrepetitions, ifsplitlist, multicompany2, insuredifdead, searchcomcnt, suminsured, accaccumulativemoney, multicompanyrga, denserga, multicompany3, abnormalcheck2, abnormalpayment2, shortclm, acccommediclmcnt, majordiseasepayment2, dense2)
values ('00000000000000010104', '190_gaomin', '2020080100102496', '2020080100102496', null, '1053002', '健核津贴十一', '0', '110101198401140551', '000190', 'HB_majorDiseaseCheck', 'A', 'Y', 'N.A.', 'N.A.', null, 'N.A.', null, '2020042300012460792753938', '2019-05-17', 'Y', 'Y', 'N.A.', 'N.A.', null, null, null, null, null, null, null, 'N.A.', null, null, null, null, null, 'E001', to_date('28-08-2019', 'dd-mm-yyyy'), '00:22:03', to_date('28-08-2019', 'dd-mm-yyyy'), '00:22:03', '0001900000000081', null, null, 'N.A.', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
*/
--医疗补偿接口：
select riskcode,makedate,insuredname,insuredidno,a.*
  from lcriskmanagementinfo a
 where business = 'HB_supplementaryMedicalCheck'
/*   and makedate > trunc(sysdate - 5)
   and riskcode = ''
   and insuredname = ''
   and insuredidtype = ''
   and insuredidno = ''*/
   and (abnormalcheck = 'Y' or abnormalpayment = 'Y' or
       majordiseasepayment = 'Y' or chronicdiseasepayment = 'Y' or
       paycount = 'Y' or paymoney = 'Y' and specdiseasepayment = 'Y')
 order by a.makedate desc;

--个人意外接口：
select riskcode,makedate,insuredname,insuredidno,a.*
  from lcriskmanagementinfo a
 where business = 'HB_accident'
/*   and makedate > trunc(sysdate - 5)
   and riskcode = ''
   and insuredname = ''
   and insuredidtype = ''
   and insuredidno = ''*/
   and (multicompany = 'Y' or majordiseasepayment = 'Y' or disability = 'Y' or
       dense = 'Y' or accumulativemoney = 'Y' or
       driveaccaccumulativemoney = 'Y' or drivedutymulticompany = 'Y' or
       specdiseasepayment = 'Y' or insuredifdead = 'Y' or
       searchcomcnt = 'Y')
 order by a.makedate desc;

/*
insert into lcriskmanagementinfo (serialno, accno, contno, prtno, caseno, riskcode, insuredname, insuredidtype, insuredidno, companycode, business, risktype, customerallowed, multicompany, majordiseasepayment, disability, dense, accumulativemoney, pagequerycode, tagdate, displaypage, abnormalcheck, abnormalpayment, chronicdiseasepayment, paymoney, daymoney, countoneyear, paymentcountoneyear, paymented, paymentcount, daymoneysum, majordiseasemoney, paycount, paymentdaycount, paymented2, receiptcode, hospitalcode, operator, makedate, maketime, modifydate, modifytime, insureruuid, driveaccaccumulativemoney, drivedutymulticompany, specdiseasepayment, receiptrepetitions, ifsplitlist, multicompany2, insuredifdead, searchcomcnt, suminsured, accaccumulativemoney, multicompanyrga, denserga, multicompany3, abnormalcheck2, abnormalpayment2, shortclm, acccommediclmcnt, majordiseasepayment2, dense2)
values ('00000000000000010151', '190_gaomin', '2021010200000166', '2021010200000166', null, '1075001', '健核津贴十一', '1', '110101198401140551', '000190', 'HB_accident', 'A', 'Y', 'N.A.', 'Y', 'N.A.', 'N.A.', 'N.A.', '2020050800019067036949189', '2019-05-17', 'Y', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'E001', to_date('02-01-2021', 'dd-mm-yyyy'), '00:38:44', to_date('02-01-2021', 'dd-mm-yyyy'), '00:38:44', '0001900000000129', 'N.A.', 'N.A.', 'N.A.', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
*/
