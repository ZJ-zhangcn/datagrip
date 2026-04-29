------------------------------------------------------------------承保相关------------------------------------------------------------------
--个单险种表
select appflag,contno,grpcontno,riskcode,signdate,cvalidate,paytodate,payenddate,enddate,a.* from lcpol a where prtno='5000118260428034';
select LEAVINGMONEY,appflag,a.bonusgetmode,(select codename from ldcode where codetype='bonusgetmode' and code=a.bonusgetmode) 红利领取方式,a.getform,(select codename from ldcode where codetype='getlocation' and code=a.getform) 生存金领取方式,riskcode,(select riskname from lmriskapp where riskcode=a.riskcode) riskname,contno,prtno,polno,signdate,cvalidate,payintv,paytodate,payenddate,enddate,amnt,prem,payendyear,insuyear,INSUYEARFLAG,a.* from lcpol a
where contno in ('2026042800004286','','','') order by a.contno;--2025010700000796
select LEAVINGMONEY,appflag,bonusgetmode,getform,contno,prtno,riskcode,payintv,prem,paytodate,cvalidate,payenddate,a.* from lcpol a where contno in ('2025102700000286','','','');
select a.* from lcpol a where (appntname like '%个险投保%' or appntname like '%银保投保%' or appntname like '%海保宝投保%' or appntname like '%经代通投保%') and appflag='1';
select a.* from lcpol a where riskcode='1103005' and APPFLAG='4';
select a.* from lcpol a where contno='2025122600000186';
/*
update lcpol set bonusgetmode='1' where contno='2025042400000296'
*/
select INPUTOPERATOR,a.* from lccont a where contno in ('2025080600000386','2025080600000476','2025080600000566');
--个单保单表
select appflag,conttype,printcount,contno,salechnl,selltype,salecom /*业绩归属渠道*/,salechannels,appntno,payintv,signdate,cvalidate,getpoldate,customgetpoldate,paytodate,a.* from lccont a
where contno='2026042700006106';
select appflag,conttype,printcount,contno,salechnl,selltype,salecom /*业绩归属渠道*/,salechannels,appntno,payintv,signdate,cvalidate,getpoldate,customgetpoldate,paytodate,a.* from lccont a
where prtno='5000118260428034';
/*
update lccont set getpoldate=signdate,customgetpoldate=signdate where prtno='5000118240902042'
update lccont set getpoldate=signdate,customgetpoldate=signdate where contno='2025032700000286'
update lccont set getpoldate=null,customgetpoldate=null where contno='2025010300000116'
*/
--无扫描录入投保单申请日期
select missionprop2,a.* from lwmission a where missionprop1 like '5000118340528025%';

--银行网点
select AgentCom, Name, UpAgentCom, AreaType, ChannelType
from LACom
where 1 = 1
  and branchtype = '3'
  and sellflag = 'Y'
  and state = 'N'
  and ManageCom like '86%'
and name like '%浦东发展%'
order by AgentCom;


--找数据
select *
from lcpol a
where appflag = '1'
  and not exists (select 1 from lpedoritem where contno = a.contno)
  and not exists
        (select 1 from lcconthangupstate where contno = a.contno)
  and not exists (select 1
                  from lccontstate
                  where statetype = 'Available'
                    and enddate is not null
                    and contno = a.contno)
  and not exists (select 1
                  from lccontstate
                  where statetype = 'DefedPay'
                    and contno = a.contno)
  and grpcontno = '00000000000000000000'
  --and BONUSGETMODE = '0'
  --and exists (select 1 from lcinsured where contno = a.contno and relationtoappnt <> '00')
  and cvalidate between date '2025-01-01' and date
    '2026-01-01'
  and payintv = '0'
--and riskcode in (select riskcode from lmriskedoritem where edorcode = 'PU')
--and riskcode in (select riskcode from lmriskedoritem where edorcode = 'PT')
--and riskcode in ('1303012', '1303012')
--   and riskcode in (select CODE1 from ldcode1 a where codetype = 'wechatctlimit')
order by cvalidate desc;

--个单终止状态
select a.*
from lcpol a
where appflag = '4'
  and PAYTODATE <> a.PAYENDDATE
  and GRPCONTNO = '00000000000000000000'
  and not exists(select 1 from LCCONTHANGUPSTATE where contno = a.contno)
  and exists(select 1 from LCCONTSTATE where contno = a.contno and STATEREASON = '01')
order by CVALIDATE desc;

--个单失效状态
select b.*
from lccontstate a,
     lcpol b
where a.polno = b.polno
  and b.polno = b.mainpolno
  and a.state = '1'
  and a.statetype = 'Available'
  and a.enddate is null
  and b.APPFLAG = '1'
  and GRPCONTNO = '00000000000000000000'
  and b.PAYTODATE <> b.PAYENDDATE
  and not exists(select 1 from LCCONTHANGUPSTATE where contno = a.contno)
order by CVALIDATE desc;

--个单缓交状态
select b.*
from lccontstate a,
     lcpol b
where a.polno = b.polno
  and b.polno = b.mainpolno
  and a.state = '1'
  and a.statetype = 'DefedPay'
  and a.enddate is null
  and b.APPFLAG = '1'
  and GRPCONTNO = '00000000000000000000'
  and b.PAYTODATE <> b.PAYENDDATE
  and not exists(select 1 from LCCONTHANGUPSTATE where contno = a.contno)
order by CVALIDATE desc;

--团险满期终止
select a.*
from LCGRPCONT a
where appflag = '4' and payintv='0'
  and exists(select 1
             from LCGRPCONTSTATE
             where grpcontno = a.grpcontno
               and statetype = 'Terminate'
               and state = '1'
               and statereason = '01'
               and enddate is null);

--节假日查询  节假日：datetype = 'N'
select a.* from ldworkcalendar a where caldate = date '2027-03-04' and datetype = 'N' order by caldate;
/*
--修改为工作日
update ldworkcalendar  set datetype = 'Y',amworktime = '10800',pmworktime = '18000',worktime = '28800' where caldate=date'2025-08-23';
update ldworkcalendar  set datetype = 'Y',amworktime = '10800',pmworktime = '18000',worktime = '28800' where caldate=date'2025-10-02';
update ldworkcalendar  set datetype = 'Y',amworktime = '10800',pmworktime = '18000',worktime = '28800' where caldate=date'2025-10-03';
--修改为节假日
update ldworkcalendar  set datetype = 'N', amworktime = '', pmworktime = '', worktime = '0' where caldate=date'2025-06-25';
update ldworkcalendar  set datetype = 'N', amworktime = '', pmworktime = '', worktime = '0' where caldate=date'2025-10-02';
update ldworkcalendar  set datetype = 'N', amworktime = '', pmworktime = '', worktime = '0' where caldate=date'2025-10-03';
*/

--TrustCompanyFlag='Y'时为信托单
select appflag,TrustCompanyFlag,a.* from lccont a where contno='2024072300004256';
/*
update lccont set getpoldate=signdate,customgetpoldate=signdate where prtno='5000118340418029'
update lccont set getpoldate=signdate,customgetpoldate=signdate where contno='2024041900000306'
*/

--失效批处理
select a.* from ldtask a where taskdescribe like '%失效%';

--保单状态
select a.* from lccontstate a where contno='2025123100000396' order by startdate;
--状态代码
select a.* from ldcode a where codetype = 'contstatetype';
--终止原因
select a.* from ldcode a where codetype = 'contterminatereason';
--hanuptype:1-新契约 2-保全 3-续期 4-理赔 5-渠道  flag:0-未挂起  1-已挂起
select a.* from lcconthangupstate a where contno='2026042700004586';

--
select a.* from lwmission a where MISSIONPROP1='5000118350621551';
select a.* from lwmission a where MISSIONID='00000000000000584470';
/*
--碎片化
insert into lwmission (MISSIONID, SUBMISSIONID, PROCESSID, ACTIVITYID, ACTIVITYSTATUS, MISSIONPROP1, MISSIONPROP2, MISSIONPROP3, MISSIONPROP4, MISSIONPROP5, MISSIONPROP6, MISSIONPROP7, MISSIONPROP8, MISSIONPROP9, MISSIONPROP10, MISSIONPROP11, MISSIONPROP12, MISSIONPROP13, MISSIONPROP14, MISSIONPROP15, MISSIONPROP16, MISSIONPROP17, MISSIONPROP18, MISSIONPROP19, MISSIONPROP20, DEFAULTOPERATOR, LASTOPERATOR, CREATEOPERATOR, MAKEDATE, MAKETIME, MODIFYDATE, MODIFYTIME, INDATE, INTIME, OUTDATE, OUTTIME, MISSIONPROP21, MISSIONPROP22, MISSIONPROP23, MISSIONPROP24, MISSIONPROP25, TIMEID, STANDENDDATE, STANDENDTIME, OPERATECOM, MAINMISSIONID)
values ((select max(missionid)+1 from lwmission where REGEXP_LIKE(missionid, '^\d+$')), '1', '0000000003', '0000001095', '1', '5000118260428034', '2025-02-20', '11:12:58', '2025-02-20', '0', '860101', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '001', '001', '001', to_date('20-02-2025', 'dd-mm-yyyy'), '17:59:16', to_date('20-02-2025', 'dd-mm-yyyy'), '17:59:16', to_date('20-02-2025', 'dd-mm-yyyy'), '17:59:16', null, '', '', '', '', '', '', '', null, '', '860101', '00000000000000584470');

update lwmission set MISSIONID=(select max(missionid)+1 from lwmission where REGEXP_LIKE(missionid, '^\d+$')) where MISSIONPROP1='5000118260428034'

*/


--单证类型表
select * from es_doc_def where subtype in (select subtype from es_doc_main a where doccode='5000118351009536');
select * from es_doc_def where subtype in ('36522151', '36523151', '');
select * from es_doc_def where subtypename like '%工行%';

--单证主表
select SUBTYPE,(select SUBTYPENAME from es_doc_def where subtype=a.SUBTYPE and BUSSTYPE=a.BUSSTYPE) SUBTYPENAME,a.* from es_doc_main a where doccode='5000118260428034' and subtype = '50001051';
select a.* from es_doc_main a where subtype='50013500' and managecom like '%8631%';
select a.* from es_doc_main a where doccode='112233334';
select subtype,busstype,makedate,a.* from es_doc_main a where doccode='5000118251009740' and subtype='50001133';
select subtype,(select codealias from ldcode where code=subtype) 单证名称,busstype,a.* from es_doc_main a where rownum<200 and subtype='50001171';
/*
-免除保险人责任条款影像件
insert into es_doc_main (DOCID, DOCCODE, BUSSTYPE, SUBTYPE, NUMPAGES, DOCFLAG, DOCREMARK, SCANOPERATOR, MANAGECOM, INPUTSTATE, OPERATOR, INPUTSTARTDATE, INPUTSTARTTIME, INPUTENDDATE, INPUTENDTIME, MAKEDATE, MAKETIME, MODIFYDATE, MODIFYTIME, VERSION, SCANNO, PRINTCODE, PKGCODE, SUBTYPESUNCAN, SCANFLAG)
values ((select max(DOCID)+1 from es_doc_main), '2025081200000586', 'TB', '50001051', 1, '1', null, '002', '86310000', null, null, null, null, null, null, null, null, null, null, '1', 'TB2024863100001X', '5000118340190015', 102, 'GXTB', 'HXLR');
--华侨身份证明
insert into es_doc_main (DOCID, DOCCODE, BUSSTYPE, SUBTYPE, NUMPAGES, DOCFLAG, DOCREMARK, SCANOPERATOR, MANAGECOM, INPUTSTATE, OPERATOR, INPUTSTARTDATE, INPUTSTARTTIME, INPUTENDDATE, INPUTENDTIME, MAKEDATE, MAKETIME, MODIFYDATE, MODIFYTIME, VERSION, SCANNO, PRINTCODE, PKGCODE, SUBTYPESUNCAN, SCANFLAG)
values ((select max(DOCID)+1 from es_doc_main), '5000118340626020', 'TB', '50001252', 1, '1', null, '002', '86310000', null, null, null, null, null, null, null, null, null, null, '1', 'TB2024863100001X', '5000118340190015', 102, 'GXTB', 'HXLR');
--权益确认书
insert into es_doc_main (DOCID, DOCCODE, BUSSTYPE, SUBTYPE, NUMPAGES, DOCFLAG, DOCREMARK, SCANOPERATOR, MANAGECOM, INPUTSTATE, OPERATOR, INPUTSTARTDATE, INPUTSTARTTIME, INPUTENDDATE, INPUTENDTIME, MAKEDATE, MAKETIME, MODIFYDATE, MODIFYTIME, VERSION, SCANNO, PRINTCODE, PKGCODE, SUBTYPESUNCAN, SCANFLAG)
values ((select max(DOCID)+1 from es_doc_main), '5000118251009598', 'TB', '50001133', 1, '1', null, '002', '86310000', null, null, null, null, null, null, null, null, null, null, '1', 'TB2024863100001X', '5000118340190015', 102, 'GXTB', 'HXLR');
--风险告知书（进合同）
insert into es_doc_main (DOCID, DOCCODE, BUSSTYPE, SUBTYPE, NUMPAGES, DOCFLAG, DOCREMARK, SCANOPERATOR, MANAGECOM, INPUTSTATE, OPERATOR, INPUTSTARTDATE, INPUTSTARTTIME, INPUTENDDATE, INPUTENDTIME, MAKEDATE, MAKETIME, MODIFYDATE, MODIFYTIME, VERSION, SCANNO, PRINTCODE, PKGCODE, SUBTYPESUNCAN, SCANFLAG)
values ((select max(DOCID)+1 from es_doc_main), '5000118260428034', 'TB', '50013800', 1, '1', null, '002', '86310000', null, null, null, null, null, null, null, null, null, null, '1', 'TB2024863100001X', '5000118340190015', 102, 'GXTB', 'HXLR');
---声明与授权
insert into es_doc_main (DOCID, DOCCODE, BUSSTYPE, SUBTYPE, NUMPAGES, DOCFLAG, DOCREMARK, SCANOPERATOR, MANAGECOM, INPUTSTATE, OPERATOR, INPUTSTARTDATE, INPUTSTARTTIME, INPUTENDDATE, INPUTENDTIME, MAKEDATE, MAKETIME, MODIFYDATE, MODIFYTIME, VERSION, SCANNO, PRINTCODE, PKGCODE, SUBTYPESUNCAN, SCANFLAG)
values ((select max(DOCID)+1 from es_doc_main), '5000118260428034', 'TB', '50013400', 1, '1', null, '002', '86010101', null, null, null, null, null, null, null, '14:26:12', to_date('24-01-2024', 'dd-mm-yyyy'), '14:26:12', '1', 'TB2024860100001X', '5000118340230193', 512, 'GXTB', 'WBLR');
--免除保险人责任条款影像
insert into es_doc_main (DOCID, DOCCODE, BUSSTYPE, SUBTYPE, NUMPAGES, DOCFLAG, DOCREMARK, SCANOPERATOR, MANAGECOM, INPUTSTATE, OPERATOR, INPUTSTARTDATE, INPUTSTARTTIME, INPUTENDDATE, INPUTENDTIME, MAKEDATE, MAKETIME, MODIFYDATE, MODIFYTIME, VERSION, SCANNO, PRINTCODE, PKGCODE, SUBTYPESUNCAN, SCANFLAG)
values ((select max(DOCID)+1 from es_doc_main), '5000118260428034', 'TB', '50001051', 1, '1', null, '002', '86310000', null, null, null, null, null, null, null, null, null, null, '1', 'TB2024863100001X', '5000118340190015', 102, 'GXTB', 'HXLR');
--双录影像
insert into lccontmovie (CONTNO, PRTNO, BATCHNO, MANAGECOM, APPNTNO, APPNTNAME, VIDEODATE, VIDEOTIME, UPLOADDATE, UPLOADTIME, UPLOADENDDATE, UPLOADENDTIME, QUALITYTESTDATE, QUALITYTESTTIME, QUALITYTESTOPERATOR, QUALITYTESTSTATE, QUALITYTESTDESC, IDTYPE, BANKCODE, AREACODE, BANKTELLER, FILEPATH, FILENAME, MAINRISKCODE, TRANDATE, POLAPPLYDATE, BANKACCNO, REPEATFLAG, BAK1, BAK2, BAK3, BAK4, BAK5, OPERATOR, MAKEDATE, MAKETIME, MODIFYDATE, MODIFYTIME, SUBQUALITYSTATE, SYSTEMAUDIT, RECHECKSTATUS, ISISSUE, QUALITYPHONE, QUALITYRESULT, QUALITYNUM, REJECTNUM, ISPERMANENT, PERMANENTTIME, UPERRORREASON, PUSHHUILIUTIME, HUILIURECEIVETIME, LASTOPERATOR, BUSINESSNO, NODENO, RECODATE, BUSITYPE, TASKPARAMS, POLICYPARAMS)
values ('5000118260428034', '5000118260428034', '20250410', '86010101', '1060096512', '个险投保四五', to_date('10-04-2025', 'dd-mm-yyyy'), null, to_date('10-04-2025', 'dd-mm-yyyy'), '23:55:11', to_date('10-04-2025', 'dd-mm-yyyy'), '23:56:37', to_date('10-04-2025', 'dd-mm-yyyy'), '15:44:36', null, '3', null, '111', '9111000071093465XC', '310000', null, '/sl/psbc/2018/07/15/', '3000117100826123_20180514.mp4', '1056024', to_date('10-04-2025', 'dd-mm-yyyy'), to_date('10-04-2025', 'dd-mm-yyyy'), '602921083200223215', null, '1', null, null, null, null, '001', to_date('10-04-2025', 'dd-mm-yyyy'), '09:33:23', to_date('10-04-2025', 'dd-mm-yyyy'), '07:31:54', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
--投保人身份证明
insert into es_doc_main (DOCID, DOCCODE, BUSSTYPE, SUBTYPE, NUMPAGES, DOCFLAG, DOCREMARK, SCANOPERATOR, MANAGECOM, INPUTSTATE, OPERATOR, INPUTSTARTDATE, INPUTSTARTTIME, INPUTENDDATE, INPUTENDTIME, MAKEDATE, MAKETIME, MODIFYDATE, MODIFYTIME, VERSION, SCANNO, PRINTCODE, PKGCODE, SUBTYPESUNCAN, SCANFLAG)
values ((select max(DOCID)+1 from es_doc_main), '5000118260428034', 'TB', '36522151', 1, '1', null, '001', '86010101', null, null, null, null, null, null, null, null, null, null, '1', 'TB2024863100001X', '5000118340190015', 101, 'GXTB', 'HXLR');
--被保险人身份证明
insert into es_doc_main (DOCID, DOCCODE, BUSSTYPE, SUBTYPE, NUMPAGES, DOCFLAG, DOCREMARK, SCANOPERATOR, MANAGECOM, INPUTSTATE, OPERATOR, INPUTSTARTDATE, INPUTSTARTTIME, INPUTENDDATE, INPUTENDTIME, MAKEDATE, MAKETIME, MODIFYDATE, MODIFYTIME, VERSION, SCANNO, PRINTCODE, PKGCODE, SUBTYPESUNCAN, SCANFLAG)
values ((select max(DOCID)+1 from es_doc_main), '5000118260428034', 'TB', '36523151', 1, '1', null, '002', '86310000', null, null, null, null, null, null, null, null, null, null, '1', 'TB2024863100001X', '5000118340190015', 102, 'GXTB', 'HXLR');
--受益人信息补充问卷
insert into es_doc_main (DOCID, DOCCODE, BUSSTYPE, SUBTYPE, NUMPAGES, DOCFLAG, DOCREMARK, SCANOPERATOR, MANAGECOM, INPUTSTATE, OPERATOR, INPUTSTARTDATE, INPUTSTARTTIME, INPUTENDDATE, INPUTENDTIME, MAKEDATE, MAKETIME, MODIFYDATE, MODIFYTIME, VERSION, SCANNO, PRINTCODE, PKGCODE, SUBTYPESUNCAN, SCANFLAG)
values ((select max(DOCID)+1 from es_doc_main), '50001183512036126', 'TB', '50012800', 1, '1', null, '002', '86310000', null, null, null, null, null, null, null, null, null, null, '1', 'TB2024863100001X', '5000118340190015', 102, 'GXTB', 'HXLR');
--受益人身份证明
insert into es_doc_main (DOCID, DOCCODE, BUSSTYPE, SUBTYPE, NUMPAGES, DOCFLAG, DOCREMARK, SCANOPERATOR, MANAGECOM, INPUTSTATE, OPERATOR, INPUTSTARTDATE, INPUTSTARTTIME, INPUTENDDATE, INPUTENDTIME, MAKEDATE, MAKETIME, MODIFYDATE, MODIFYTIME, VERSION, SCANNO, PRINTCODE, PKGCODE, SUBTYPESUNCAN, SCANFLAG)
values ((select max(DOCID)+1 from es_doc_main), '50001183512031626', 'TB', '36524151', 1, '1', null, '002', '86310000', null, null, null, null, null, null, null, null, null, null, '1', 'TB2024863100001X', '5000118340190015', 102, 'GXTB', 'HXLR');

*/

--壹帐通校验通过   中保信身份验证通过修改zbxidentresult=10201：通过   30452：不通过
select a.* from lcidCardCheckInfo a where contno='5000118260428034';
select a.* from lcidCardCheckInfo a where CUSTOMERNO='1060099554';
/*
update lcidcardcheckinfo a set resultstatus='000000',resultdesc='通过',zbxidentresult='10201',BANKCARDNO=(select NEWBANKACCNO from lccont where contno=a.contno) where a.contno='5000118343652019';
update lcidcardcheckinfo set resultstatus='000000',resultdesc='通过',zbxidentresult='10201' where Name='投保二' and IDNO='152123200601100359'
*/
--手工单开关  开-codename='1'
select a.* from ldcode a where codetype='YZTIDCHECK_State' and code='01';
select a.* from ldcode a where codetype = 'CHECK_STAUTS' and code='01';
--app、经代通开关
select a.* from ldcode a where codetype = 'appcheckstate' and code='01';
--数据宝开关
select /*codename,*/a.* from ldcode a where codetype = 'CheckMobile_State' and code='01';
--app数据宝开关 开-codename='1'
select * from ldcode where codetype = 'appjd_mobile' and code='01';
--回访结果表   standbyflag1=0是回访成功
select t.standbyflag1,t.* from lccallresults t where contno='2024031400000196';
--产品支持的销售渠道
select salechnl,a.* from ldriskrule a where riskcode in ('1036003');
--险种明细  H：健康险  S：重疾险  R：年金险
select a.* from lmriskapp a where riskcode='1011002';
select a.* from lmriskapp a where riskcode=(select riskcode from lcpol where contno='2024100900000616');
--H：健康险  S：重疾险  R：年金险
select a.* from ldcode a where codetype like '%kindcode%';

--险种支持的保全
select * from lmriskedoritem where riskcode in ('1303012','1303014','1306001');
select * from lmriskedoritem where edorcode in ('NS','');
select * from lmriskedoritem where fintype like '%生存金人工给付%';

--投保人表
select idstdate,IDEXPDATE,a.* from lcappnt a where contno='2023051100000986';
select appntname,idtype,idno from lcappnt a where contno='2025010800000256';
select a.* from lcappnt a where appntno='1060092205';
/*
update lcappnt set IDEXPDATE='9999-01-01' where contno='2024061300004486'
*/

--被保人表
select idstdate,IDEXPDATE,a.* from lcinsured a where contno='5000118350314047';
select distinct name,idtype,idno from lcinsured a where insuredno='1060088230';
select contno,
       occupationcode,
       (select codename
          from ldcode
         where codetype = 'occupationtype'
           and code = a.occupationtype) 职业类别,
       insuredno,
       idno,
       relationtoappnt
  from lcinsured a
 where insuredno = '1060092294';
/*
update lcinsured set IDEXPDATE='9999-01-01' where contno='2024061300004486'
*/

--受益人
select a.* from lcbnf a where contno='2023113000000296';

--客户表
select a.* from ldperson a where customerno='1060092206';

--地址表
select mobile,email,postaladdress,a.* from lcaddress a where customerno=(select appntno from lcappnt where contno='5000118260428034');
select a.* from lcaddress a where customerno=(select appntno from lcappnt where contno='2023102300000316');
select a.* from lcaddress a where email='zhangjin05@sinosoft.com.cn';
select a.* from lcaddress a where customerno='1001734246';
select a.* from lcaddress a where mobile='17503010001';

/*
update lcaddress set email=null where email='zhangjin05@sinosoft.com.cn' and customerno not in (select appntno from lcappnt where contno='5000118260428034');
update lcaddress set phone=null,HOMEPHONE=null where phone='12341234' or HOMEPHONE='12341234';
update lcaddress set postaladdress='林校路街道义和庄北路10086号' where postaladdress like '%林校路街道义和庄北路%' and postaladdress!='林校路街道义和庄北路10086号';
*/

--算法表
select a.* from lmcalmode a where riskcode='1033025';
select a.* from lmcalmode a where remark like '%应交%';

--配置贷款利率
select * from LMEdorCal where RiskCode='1303022' and EdorType='LN' and CalType='Rate';
select * from LDPubRate  where CalType = 'LN' and RiskCode='1303022';
/*
Insert into LMEdorCal values ('1303022','2025','ID0428','LN','Rate','RA0022','调用贷款利率');
insert into LDPubRate (CALTYPE, RISKCODE, RLTYPE, SCTYPE, YMDINTEREST, STARTDATE, ENDDATE, RATE, CURRENCY, STATE, CVALISTARTDATE, CVALIENDDATE)
values ('LN', '1303022', 'L', 'S', 'Y', to_date('01-01-2018', 'dd-mm-yyyy'), to_date('31-12-2038', 'dd-mm-yyyy'), 0.03, '01', null, to_date('01-01-2018', 'dd-mm-yyyy'), to_date('31-12-2038', 'dd-mm-yyyy'));

*/

--职业表
select * from ldoccupation where occupationtype='1';

--账户表
select a.* from lcinsureacc a where contno='2024083000000556';
--账户计价轨迹表
select moneytype,a.* from lcinsureacctrace a where contno='2024030500000586' and money>=0 order by paydate desc,a.moneytype;
select sum(money) from lcinsureacctrace a where contno='2024011800000586';

--电子保单打印
select a.* from lccontdzytprint a where contno in ('2026042300000476','','','');
select a.* from LCCONTPRINT a where contno in ('2026042300000476','','','');
select a.* from ldcode a where codetype like '%printstat%' and code='D';

--批处理及名称
select a.* from ldtask a order by taskcode;
select a.* from ldtask a where taskcode='000526' order by taskcode;
select a.* from ldtask a where taskdescribe like '%一体化%' order by taskcode;
select a.* from ldtask a where taskdescribe like '%团险询价数据同步%' order by taskcode;
/*
分红险：
  第一个保单周年日执行 000124-红利催付核销批处理
  第二个保单周年日至最后一个保单周年日执行 000124-红利催付核销批处理、000126-红利累积生息批处理
  最后一个保单周年日需要再执行 000029-生存金催付批处理、000030-生存金核销批处理
  000016-满期批处理


万能险：
  退保前需结息，每月1号执行 000050-个险万能月结批处理
*/

--重复跑续期抽档批处理删除以下两表
select a.* from ljspayperson a where contno='2024022700005166';
select makedate 抽档日期,a.* from ljspay a where otherno='2024022700005166';
select a.* from lccontstate a where polno = 210010000405728 and enddate is null and state = '1' and statetype = 'Available';
--模拟转账抽档成功，将payform改为Y
select payform,a.* from ljspay a where otherno='2024012600001086';
--实收个人交费表
select makedate,a.* from ljapayperson a where contno = '2024022700005166';

--短信
select a.* from sms_dispatch_list a where sendtarget='17703133005' order by makedate desc,maketime desc;
select a.* from sms_dispatch_list a where otherno='2026031300001166' order by makedate desc,maketime desc;
--续期相关短信
select a.* from lcmeglog a where otherno='2026031300001166';
select a.* from lcmeglog a where STANDBYFLAG1='17703133005';
--查短信编码  serivceid
select * from lisdata.lcmegrelation WHERE sendcode='XQ00001';
select * from lisdata.lcmegrelation WHERE SERIVCEID='Re1001';
select * from lisdata.lcmegrelation WHERE MEGCODE='6001';
--续期通知书相关
select a.* from loprtmanager a where otherno='2025052600000386';
select a.* from ldcode a where /*code='B1' and*/ codetype='lettertype3';
select a.* from ldcode a where codetype='lettertype3';
--续期通知书及邮件暂停记录  standbyflag2：01-信函邮寄  02-电子邮件
select standbyflag1,standbyflag2,(select codename from ldcode where codetype='lettertype3' and codealias=a.LETTERTYPE),LETTERTYPE,a.* from xqletterstopapply a
where contno='2023010100004756';
--续期签批文件存储
select a.* from xqletterstopfiles a where contno='2024022800004026';
--续期缴费银行划款对账邮件发送需要makedate为批处理执行时间的前一天有数据
select makedate,a.* from lcrnewautocont a where contno = '2023102500001026';
--
select a.* from ldtask a where taskdescribe like '%恢复寄送%' order by taskcode;

--应收表
select startpaydate,bankcode,othernotype,BankOnTheWayFlag,BANKSUCCFLAG,a.* from ljspay a where otherno in ('5000118250522092','');
select a.* from splitcont a where contno='2025031900000386';
select startpaydate,a.* from ljspay a where getnoticeno='86010120250310044474';
--
select a.* from ljspayperson a where contno='5000118240722053';
--实收表
select a.* from ljapay a where incomeno='2024123000000376';
--
select a.* from ljapayperson a where contno='2024051400000156';
--
select a.* from ljtempfee a where otherno='2024011800000176';
--ljspay.othernotype枚举值
select codealias,codename from ldcode at where at.codetype = 'paytypecode' order by codealias;
--应付表
select BANKONTHEWAYFLAG,BANKSUCCFLAG,a.* from ljsget a where otherno='2024042400000376';
--
select a.* from ljsgetdraw a where contno='2024032900000526';
--实付表
select BANKONTHEWAYFLAG,BANKSUCCFLAG,inbankcode,inbankaccno,a.* from ljaget a where otherno='7402121100326772';
--实付明细
select a.* from ljagetdraw a where contno='2024042400000376';
--
select a.* from lysendtobank a where polno='5000118250522092';
select a.* from lysendtobank a where SERIALNO='20250513_30208';
--
select a.* from lybanklog a where SERIALNO='20250513_30208';
--
select banksuccflag,a.* from lyreturnfrombankb a where polno in ('5000118219235646','');
--
select a.* from LCBankError a where buinessno='86000020250370015035';

--银行账户所属银行
select name from sy_banks where urid=(select bankcode from lccont where contno='2023102300000316');
--银行卡类型
select codename from ldcode where codetype = 'acctype' and code=(select acctype from lccont where contno='2023102300000316');

--规则引擎开关
select a.* from ldcode1 a where codetype like '%rulecontrol%';

--海保宝医联校验
select * from lcRiskMapInfo where PolicyNo = '5001050100000060';
/*
update lcRiskMapInfo set tag1='0',tag2='0',tag3='0',tag4='0',tag5='0',tag6='0',tag7='0' where PolicyNo = '5001050100000060'
*/

--保单终止原因
select a.* from ldcode a where codetype like '%Terminatestatereason%';

--保单失效原因
select a.* from ldcode a where codetype = 'contavailablereason';

--取最小值
select least((select 180133.60*0.2 from dual),(select 200000*0.2 from dual),(select 4920.96*40*power(1.05,(366-366)/366) from dual)) from dual;

--豁免责任配置（保盾云同时调用M3000评分时，险种责任需在配置表，code1='1'时会调用）
select code1 from ldcode1 where codetype = 'freeduty' and code = 'ID0303';

--首期签约短信发送配置  codename='0'为关闭 ，1为开
select * from ldcode where codetype = 'first_prem_signed' and code='00';
--批处理ip地址
select sysvarvalue from ldsysvar where sysvar='BatIPHost';
--百星打印回传
select a.* from LpLettersBXPrintSend a where contno='';

--银保代理机构
select AgentCom, Name, UpAgentCom, AreaType, ChannelType
  from LACom c
 where branchtype = '3'
   and sellflag = 'Y'
   and state = 'N'
   and managecom like '86%'
   and name like '%建设%'
   and exists (select 1
          from LAComToAgent a, LAAgent b
         where b.AgentCode = a.AgentCode
           and a.RelaType = '1'
           and b.devno1 IS NOT NULL
           and b.branchtype = '3'
           and a.agentcom = c.agentcom)
 order by c.AgentCom;

------------------------------------------------------------------保全相关------------------------------------------------------------------
--保全申请备份表
select a.CONFDATE 保全确认日期,edoracceptno 受理号,a.* from lpedorapp a where otherno='2025052000000286';
--个险保全状态
select a.* from ldcode a where codetype = 'edorstate';
--个险保全表
select a.* from lpedoritem a where contno='2026042300000106' order by EDORACCEPTNO,makedate,maketime,modifydate,modifytime;
select edorno 批单号,edortype,edorstate,(select codename from ldcode where codetype='edorstate' and code=a.edorstate) statename,EdorValiDate 保全生效日期,getmoney,getinterest,approvedate,approvetime,a.* from lpedoritem a
where contno='2026042800004286' order by makedate,maketime,modifydate,modifytime;
select edorno 批单号,edortype,edorstate,(select codename from ldcode where codetype='edorstate' and code=a.edorstate) statename,EdorValiDate 保全生效日期,getmoney,getinterest,approvedate,approvetime,a.* from lpedoritem a
where edoracceptno='7402121100331030';
select * from lpedoritem a where EDORTYPE='PU' and EdorValiDate between date'2027-07-27' and date'2027-07-28';
select a.* from LJAGetEndorse a where endorsementno in (select edorno from lpedoritem a where EDORTYPE='RA' and EdorValiDate between date'2027-07-28' and date'2027-07-28');
select enteraccdate,a.* from LJAGetEndorse a where contno='2024110400000786' order by modifydate,modifytime,makedate,maketime;
select enteraccdate,a.* from LJAGetEndorse a where otherno/*批单号*/='3623915100349423' order by modifydate,modifytime,makedate,maketime;

select a.* from lpedoritem a where EDORTYPE='CT' and EDORSTATE='0' and makedate between date'2024-01-01' and date'2024-12-31';
--不可续贷险种配置
select * from lisdata.ldcode where codetype='noloanagain' and code='1033028';
--修改贷款利率
select INTERESTRATE,a.* from loloanmain a where contno='2025110700000186';
select a.* from ldtask a where taskdescribe like '%贷款%';


------------------------------------------------------------------理赔相关------------------------------------------------------------------
--理赔单证插表  报案号
select a.* from es_doc_main a where DOCCODE='3631815101095885';
select a.* from LLBNF a where CLMNO='3631815101007464';--FEEOPERATIONTYPE  A  C04-生存金  C05-累计生息红利
select distinct BNFtype from LLBNF a;
/*
--
insert into es_doc_main (DOCID, DOCCODE, BUSSTYPE, SUBTYPE, NUMPAGES, DOCFLAG, DOCREMARK, SCANOPERATOR, MANAGECOM, INPUTSTATE, OPERATOR, INPUTSTARTDATE, INPUTSTARTTIME, INPUTENDDATE, INPUTENDTIME, MAKEDATE, MAKETIME, MODIFYDATE, MODIFYTIME, VERSION, SCANNO, PRINTCODE, PKGCODE, SUBTYPESUNCAN, SCANFLAG)
values ((select max(DOCID)+1 from es_doc_main), '3631815101011253', 'LP', '36318151', 20, '1', null, 'chengang', '860101', null, null, null, null, null, null, to_date('04-01-2024', 'dd-mm-yyyy'), '00:00:00', to_date('04-01-2024', 'dd-mm-yyyy'), '00:00:00', '1', 'LP2016860100001X', '3631815101095549', 14, 'LP', null);

--不予立案通知书
insert into es_doc_main (DOCID, DOCCODE, BUSSTYPE, SUBTYPE, NUMPAGES, DOCFLAG, DOCREMARK, SCANOPERATOR, MANAGECOM, INPUTSTATE, OPERATOR, INPUTSTARTDATE, INPUTSTARTTIME, INPUTENDDATE, INPUTENDTIME, MAKEDATE, MAKETIME, MODIFYDATE, MODIFYTIME, VERSION, SCANNO, PRINTCODE, PKGCODE, SUBTYPESUNCAN, SCANFLAG)
values ((select max(DOCID)+1 from es_doc_main), '3631815101095889', 'LP', '36341151', 1, '1', null, '002', '86010101', null, null, null, null, null, null, to_date('19-03-2024', 'dd-mm-yyyy'), '10:50:15', to_date('19-03-2024', 'dd-mm-yyyy'), '10:50:15', '1', 'LP2024860100001X', '3631815101009909', 150, 'LP', null);

--理赔受益人分配
--dat
INSERT INTO LLBNF (CLMNO, CASENO, BATNO, GRPCONTNO, GRPPOLNO, CONTNO, BNFKIND, POLNO, INSUREDNO, BNFNO, BNFTYPE,
                           BNFGRADE, RELATIONTOINSURED, CUSTOMERNO, NAME, SEX, BIRTHDAY, IDTYPE, IDNO, RELATIONTOPAYEE,
                           PAYEENO, PAYEENAME, PAYEESEX, PAYEEBIRTHDAY, PAYEEIDTYPE, NBPOLNO, PAYEEIDNO, BNFLOT,
                           GETMONEY, CASEGETMODE, CASEPAYMODE, CASEPAYFLAG, BANKCODE, BANKACCNO, ACCNAME,
                           MODIREASONCODE, MODIREASONDESC, OBANKCODE, OBANKACCNO, OACCNAME, OPERATOR, MAKEDATE,
                           MAKETIME, MODIFYDATE, MODIFYTIME, OTHERNO, OTHERNOTYPE, FEEOPERATIONTYPE, CURRENCY, PHONE,
                           BANKPROVINCE, OBANKPROVINCE, IDEXPDATE, NATIVEPLACE, OCCUPATION, POSTALADDRESS, RGTADDRESS,
                           GRPNAME, ACCTYPE, BANKCITY, OBANKCITY, IDSTARTDATE, PAYEEIDSTARTDATE, PAYEEIDEXPDATE,
                           PAYEEMOBILE)
VALUES ('3631815101011253', '3631815101011253', '0', '00000000000000000000', '00000000000000000000', '2026040700000656',
        'A', '000000', '1060100067', '1', '0', '1', '06', '0', '受益', '1', DATE '1990-01-10', '0',
        '35062419900110056X', '00', '0', '受益', '1', DATE '1990-01-10', '0', null, '35062419900110056X', 100.0000,
        0.00, null, '4', '0', '0101', '12345678', '受益', null, null, null, null, null, '001', DATE '2036-04-20',
        '00:11:41', DATE '2036-04-20', '00:11:41', null, null, 'A', null, '17605235001', '1100', null, '2045-05-23',
        null, null, null, null, null, '0', '1100', null, '2025-05-23', '2025-05-23', '2045-05-23', '17605235001');

--pre
INSERT INTO LLBNF (CLMNO, CASENO, BATNO, GRPCONTNO, GRPPOLNO, CONTNO, BNFKIND, POLNO, INSUREDNO, BNFNO, BNFTYPE,
                       BNFGRADE, RELATIONTOINSURED, CUSTOMERNO, NAME, SEX, BIRTHDAY, IDTYPE, IDNO, RELATIONTOPAYEE,
                       PAYEENO, PAYEENAME, PAYEESEX, PAYEEBIRTHDAY, PAYEEIDTYPE, NBPOLNO, PAYEEIDNO, BNFLOT, GETMONEY,
                       CASEGETMODE, CASEPAYMODE, CASEPAYFLAG, BANKCODE, BANKACCNO, ACCNAME, MODIREASONCODE,
                       MODIREASONDESC, OBANKCODE, OBANKACCNO, OACCNAME, OPERATOR, MAKEDATE, MAKETIME, MODIFYDATE,
                       MODIFYTIME, OTHERNO, OTHERNOTYPE, FEEOPERATIONTYPE, CURRENCY, PHONE, BANKPROVINCE, OBANKPROVINCE,
                       IDEXPDATE, NATIVEPLACE, OCCUPATION, POSTALADDRESS, RGTADDRESS, GRPNAME, ACCTYPE, BANKCITY,
                       OBANKCITY, IDSTARTDATE)
VALUES ('3631815101007464', '3631815101007464', '0', '00000000000000000000', '00000000000000000000', '2026030200000716',
        'A', '000000', '1004565160', '1', '0', '1', '06', '0', '受益', '1', DATE '1990-01-10', '0',
        '35062419900110056X', '00', '0', '受益', '1', DATE '1990-01-10', '0', null, '35062419900110056X', 100.0000,
        1000000.00, null, '4', '0', '0101', '12345678', '受益', null, null, null, null, null, '001', DATE '2026-06-10',
        '03:15:25', DATE '2026-06-10', '03:15:25', null, null, 'A', null, '17605235001', '1100', null, '2045-05-23',
        'CHN', '1010001', '上海市上海市黄浦区上海市黄浦区林校路街道义和庄北路514号', null, null, '0', '1100', null,
        '2025-05-23');


*/
select a.* from es_doc_main a where DOCCODE='3631815101010427';

--
select a.* from LLClaimPolicy a where contno='2025060600000416';
select a.* from LLClaimPolicy a where caseno='3631815101007464';

select accdate 理赔出险日期,a.* from llcase a where caseno in (select caseno from LLClaimPolicy where contno='2025110500000666');

select a.* from llregister a where rgtno='3631815101010646';
select endcasedate 理赔结案日期,clmstate,(select CodeName from ldcode where codetype = 'llclaimstate' and code=a.CLMSTATE) 赔案状态,a.* from llregister a
where rgtno='3631815101000207';

select a.* from ljagetdraw a where contno='3631815101008667';

select a.* from llcriticalillness a where clmno='3631815101010646';

select accdate 理赔出险日期,a.* from llcase a where customerno='1060092581';
select a.* from LLClaimPolicy a where insuredno='1060092581';
select a.* from LLClaimPolicy a where appntno='1060092581';

select a.* from lcinsured a where contno='2023103000000216';