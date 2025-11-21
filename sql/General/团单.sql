------------------------------------------------------------------承保相关------------------------------------------------------------------
--险种表
select contno,grpcontno,riskcode,cvalidate,paytodate,payenddate,a.* from lcpol a where prtno='3206915150822036';
select (select codename from ldcode a where codetype='appflag' and code=a.appflag) appflag,grpcontno,contno,prtno,riskcode,signdate,cvalidate,paytodate,enddate,payenddate,payintv,prem,payendyear,insuyear,a.* from lcpol a
where grpcontno in ('2025092400000476','') and contno='130010002144918';
select appflag,insuredname,polstate,contno,prtno,riskcode,payintv,prem,paytodate,cvalidate,payenddate,a.* from lcpol a where grpcontno='2023100100000626';
--团单总保费
select sum(prem) from lcpol a where prtno='3206915150822036';
select sum(sumprem),sum(amnt) from lcpol a where grpcontno='2023110900001556' and appflag='1';
--团单总保额
select sum(amnt) from lcpol a where prtno='3206915140620035';
--
select a.* from lcgrpcont a where grpcontno='2025080500000466';
select a.* from ldtask a where TASKDESCRIBE like '%撤件%';

--个单保单表
select appflag,printcount,contno,salechnl,selltype,salechannels,appntno,payintv,signdate,cvalidate,getpoldate,customgetpoldate,paytodate,a.* from lccont a
where grpcontno='2023122600002786';

select a.* from lcgrpcontstate a where grpcontno='2024062100001686';

--询价
select UnitProvince           单位注册地址省,
       UnitCity               单位注册地址市,
       UnitDistrict           单位注册地址县区,
       UNITREGDETADDRESS      单位注册地址详细地址,
       UnitRegisteredProvince 单位地址省,
       UnitRegisteredCity     单位地址市,
       UnitRegisteredDistrict 单位地址县区,
       UNITDETADDRESS         单位地址详细地址,
       a.*
  from lcask a
 where askno like 'XJ2024%%'
 order by askno desc;
--团单校验反洗钱，补全客户信息插表
select a.* from lcgrpcustomerinfo a where grpcustomerno='1060093829';
select a.* from lcappnt a where appntno in (select grpcustomerno from lcgrpcustomerinfo);
/*

insert into lcgrpcustomerinfo (GRPCUSTOMERNO, POSTADDRESS, BUSINESSSCOPE, REGIDNO, LICNAME, LICIDNO, LICSTARTDATE, LICENDDATE, LEGNAME, LEGIDTYPE, LEGIDNO, LEGSTARTDATE, LEGENDDATE, DPARTNAME, DPARTIDNO, DPARTIDTYPE, DPARTSTARTDATE, DPARTENDDATE, TRANNAME, TRANIDTYPE, TRANIDNO, TRANSTARTDATE, TRANENDDATE, BAK1, BAK2, BAK3, BAK4, BAK5, OPERATOR, MAKEDATE, MAKETIME, MODIFYDATE, MODIFYTIME, BNFNAME, BNFIDTYPE, BNFIDNO, BNFSTARTDATE, BNFENDDATE, BNFBIRTHDAY, BNFADDRESS, BNFTDPEOPLE, BNFNATIVEPLACE, BNFFLAG, SHARESNUM)
values ('1001735571', '上海市黄浦区林校路街道义和庄北路1号', '经营范围', '12345', '依法设立', '1234', to_date('01-01-2023', 'dd-mm-yyyy'), to_date('01-01-2028', 'dd-mm-yyyy'), '法人', '1', '123456', to_date('01-01-2023', 'dd-mm-yyyy'), to_date('01-01-2028', 'dd-mm-yyyy'), '控股股东', '123456', '1', to_date('01-01-2023', 'dd-mm-yyyy'), to_date('01-01-2028', 'dd-mm-yyyy'), '授权办理业务人', '1', '123456', to_date('01-01-2023', 'dd-mm-yyyy'), to_date('01-01-2028', 'dd-mm-yyyy'), null, null, null, null, null, '001', to_date('07-11-2023', 'dd-mm-yyyy'), '06:53:22', to_date('07-11-2023', 'dd-mm-yyyy'), '06:53:22', null, null, null, null, null, null, null, null, null, null, null);
*/

--团险人核校验费率修改:0.2<standprem/prem<1.3
select prem,standprem,a.* from lcpol a where prtno='3206915150314058';
/*
--趸交
update lcpol set standprem=prem where prtno='3206915150314058'
--月交
update lcpol set standprem=(prem*12) where prtno='3206915150822029'
*/

--集体核保最近结果表
select a.* from lcguwmaster a where grpcontno='3206915131106027';
--团单个单核保批量通过
select a.* from lccuwmaster a where a.contno in (select contno from lcpol where prtno='3206915131107023');
--update lccuwmaster set passflag='9',state='9' where contno in (select contno from lcpol where prtno='3206915131107023')

--团单打印单证插表
select a.* from es_doc_main a order by docid desc;
select a.* from es_doc_main a where subtype='32076151' and managecom='86010101';
/*

insert into es_doc_main (docid, doccode, busstype, subtype, numpages, docflag, docremark, scanoperator, managecom, inputstate, operator, inputstartdate, inputstarttime, inputenddate, inputendtime, makedate, maketime, modifydate, modifytime, version, scanno, printcode, pkgcode, subtypesuncan, scanflag)
values ((select max(DOCID)+1 from es_doc_main), '5000116400000882', 'TB', '36083151', 1, '1', null, '001', '86010101', null, null, null, null, null, null, to_date('28-09-2023', 'dd-mm-yyyy'), '15:20:26', to_date('28-09-2023', 'dd-mm-yyyy'), '15:20:26', '1', 'TB2023860100001X', '3206915131026011', 1350, 'TXTB', null);
*/

--团险打印纸质保单：有数据视为打印成功
select * from lccontprint where contno='2025010600000186';
--团单险种表
select a.* from lcgrppol a where grpcontno='2024021700000186';

--投保人表
select a.* from lcappnt a where appntno='1000012444';
select a.* from lcappnt a where prtno='';
select a.* from lcappnt a where contno='2023101700000386';
select a.* from lcappnt a where appntname='张投保二';

--被保人表
select a.* from lcinsured a where grpcontno='2023101700000386';
select a.* from lcinsured a where idno='520112199804010532';
select a.* from lcinsured a where contno='130011003751599';
select distinct name,idtype,idno from lcinsured a where insuredno='1060093721';
select grpcontno,a.* from lcinsured a where insuredno='1001735267';

--受益人
select a.* from lcbnf a where contno='130011003751676';

--客户表
select a.* from ldperson a where customerno='1060091002';

--地址表
select mobile,email,postaladdress,a.* from lcaddress a where customerno in (select insuredno from lcinsured where grpcontno='2023111500000886');
select a.* from lcaddress a where customerno=(select appntno from lcappnt where contno='2023102300000316');
select a.* from lcaddress a where email='zhangjin05@sinosoft.com.cn';

--算法表
select a.* from lmcalmode a where riskcode='2072004';
select a.* from lmcalmode a where remark like '%应交%';

--职业表
select * from ldoccupation where occupationtype='1';

--团体保单→反洗钱校验信息查询页面数据
select a.* from grpfxqcheckinfo a where grpcontno='2023110700002226' and edoracceptno!='3229315100005742';

--保单定期结算
select flag/*0-关闭 1-开通*/,a.* from lpbalancedef a where grpcontno='2024020100011026';




------------------------------------------------------------------保全相关------------------------------------------------------------------
--保全申请备份表
select bqappno,edoracceptno 受理号,a.* from lpedorapp a where otherno='2024070200001316';
select a.* from lpedorapp a where edoracceptno='3229315100006307';
--团险保全表
select a.MAKEDATE,edoracceptno 受理号,edorno 批单号,a.* from lpgrpedoritem a where grpcontno='2025092400000476' order by a.MAKEDATE,a.maketime;
select a.* from lpgrpedoritem a where edoracceptno='3229315100004803';
select a.* from lpgrpedoritem a where edorno='3229515100005969';
select a.* from lpgrpedoritem a where edortype='RP' and EDORSTATE='0' order by MAKEDATE desc;
select a.* from ldcode a where codetype like '%edorstate%';

select a.* from lpgrpedoritem a where EDORTYPE='CT' and EDORSTATE='0' and makedate between date'2024-01-01' and date'2024-12-31';

select a.* from lpgrpedoritem a where EDORTYPE='RP' and EDORSTATE='0';
--个险保全表
select a.CONFDATE 保全确认日期,a.* from LPEdorApp a where otherno='2025022700001186';
select a.CONFDATE 保全确认日期,a.* from LPEdorApp a where edoracceptno='3229315100000615';
select edorno 批单号,edoracceptno 受理号,edortype,edorstate,getmoney,getinterest,a.* from lpedoritem a where grpcontno='2025010600000186';
select contno,a.* from lpedoritem a where edoracceptno='3229315100002511' order by a.contno;
select sum(getmoney) from lpedoritem a where edoracceptno='3229315100002511';
select a.* from lpedoritem a where insuredno='1060090852';
select a.* from lpedoritem a where edortype='NI' and edorstate='0' order by makedate;
select a.* from LISDATA.LJAGETENDORSE a where grpcontno='2025010600000186' order by MAKEDATE,MAKETIME;
select a.* from LISDATA.LJAGETENDORSE a where otherno='3229315100006312';

--保单未打印修改printcount为1
select PrintCount,a.* from LCGrpCont a where grpcontNo = '2025032600004096';
/*
update LCGrpCont set PrintCount='1' where grpcontNo = '2025111700006986'
*/

--回执回销
select * from lcgrpcont where grpcontno = '2025012000000586'and CUSTOMGETPOLDATE is null;
/*
update lcgrpcont set CUSTOMGETPOLDATE=signdate where grpcontno = '2025111700006986'
*/

--团单保全单证插表
select a.* from es_doc_main a where subtype='32293151';
/*

insert into es_doc_main (docid, doccode, busstype, subtype, numpages, docflag, docremark, scanoperator, managecom, inputstate, operator, inputstartdate, inputstarttime, inputenddate, inputendtime, makedate, maketime, modifydate, modifytime, version, scanno, printcode, pkgcode, subtypesuncan, scanflag)
values ((select max(DOCID)+1 from es_doc_main), '3229315100002511', 'BQ', '32293151', 1, '1', null, '001', '86', null, null, null, null, null, null, to_date('15-02-2015', 'dd-mm-yyyy'), '16:12:19', to_date('15-02-2015', 'dd-mm-yyyy'), '16:12:19', '1', 'TB201586330014', '3229315100005698', 1, null, null);

insert into es_doc_main (DOCID, DOCCODE, BUSSTYPE, SUBTYPE, NUMPAGES, DOCFLAG, DOCREMARK, SCANOPERATOR, MANAGECOM, INPUTSTATE, OPERATOR, INPUTSTARTDATE, INPUTSTARTTIME, INPUTENDDATE, INPUTENDTIME, MAKEDATE, MAKETIME, MODIFYDATE, MODIFYTIME, VERSION, SCANNO, PRINTCODE, PKGCODE, SUBTYPESUNCAN, SCANFLAG)
values ((select max(DOCID)+1 from es_doc_main), '5005190150822170', 'BQ', '50051901', 1, '1', null, '002', '86010101', null, null, null, null, null, null, to_date('01-02-2024', 'dd-mm-yyyy'), '11:57:53', to_date('01-02-2024', 'dd-mm-yyyy'), '11:57:53', '1', 'BQ2024860100001X', '5005190140201018', 74, 'TXBQ', null);

*/

--批改补退费表实收/实付
select getflag/*1：退费 0：补费*/,getmoney,contno,a.* from ljsgetendorse a where grpcontno='2024062100001686';

--理赔单证插表
select docid from es_doc_main a order by docid desc;
/*

insert into es_doc_main (DOCID, DOCCODE, BUSSTYPE, SUBTYPE, NUMPAGES, DOCFLAG, DOCREMARK, SCANOPERATOR, MANAGECOM, INPUTSTATE, OPERATOR, INPUTSTARTDATE, INPUTSTARTTIME, INPUTENDDATE, INPUTENDTIME, MAKEDATE, MAKETIME, MODIFYDATE, MODIFYTIME, VERSION, SCANNO, PRINTCODE, PKGCODE, SUBTYPESUNCAN, SCANFLAG)
values (788999745345288, '3631815101095679', 'LP', '32069151', 2, '1', null, '001', '860101', null, null, null, null, null, null, null, null, null, null, '1', 'LP2021010100000516', null, 26, null, null);
*/

select a.* from LLCLAIMPOLICY a where clmno='3631815101010479';