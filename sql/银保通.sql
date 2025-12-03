------------------------------------------------------------------银保通相关------------------------------------------------------------------
--lcpol
select appflag,getform,a.* from lcpol a where prtno in ('','5000118240250138');
select uwflag,appflag,contno,riskcode,kindcode,insuredsex,insuredappage,signdate,cvalidate,enddate,payintv,payendyear,payendyearflag,insuyear,insuyearflag,prem,amnt,livegetmode from lcpol a 
where contno in ('2025081400000926','','');
--lccont
select uwflag,appflag,contno,salechnl,selltype,salecom,salechannels,appntsex,appntbirthday,signdate,firstpaydate,cvalidate,customgetpoldate,payintv,paymode,printcount,prem,amnt,sumprem,getpolmode from lccont a 
where contno='2025052200000896';
--
select a.* from ContBlcDtl a where ProposalPrtNo='2023122500001176';

--农商行当日重复对账
--承保对账
select * from tranlog where rcode='0' and trancom='12' and funcflag='7005' and trandate='20250724';
--保全对账
select * from tranlog where rcode='0' and trancom='12' and funcflag='7048' and trandate='20251010';
--
select a.* from TranLog a where TranDate='20231225';

--银保险种
select a.* from codemapping a where codealias like '%稳赢逸生C款%';
select a.* from codemapping a where comcode='PSBC' and codetype='riskcode';
select a.* from codemapping a where INSU_CODE='1303012';
select a.* from codemapping a where BANK_CODE='045';

--银保险种默认领取方式  0-自动转账  1-累积生息  3-转入万能账户
select a.* from ldcode a where codetype = 'ybtgetliveRisk' and code='1103007' order by comcode;

--被保人账户存储配置
select a.* from ldcode a where codetype='addinsuracc';

--短信
select mobile from lcaddress a where customerno=(select appntno from lcappnt where contno='2025031900000386');
select a.* from sms_dispatch_list a where SENDTARGET='17503180003';
select a.* from sms_dispatch_list a where otherno='5000118240612033';

--保单打印
select a.* from ldtask a where taskdescribe like '%一体化%';

--万能险批处理
select a.* from ldtask a where taskdescribe like '%万能%';

--分红险批处理
select a.* from ldtask a where taskdescribe like '%红利%';
select a.* from ldtask a where taskdescribe like '%生存%';
select a.* from ldtask a where taskdescribe like '%满期%';

--
SELECT IDExpDate FROM ldperson where CustomerNo='1001733666';
--需对账的保单
select contno,appntname,insuredname from ybtdat.cont where proposalprtno='2023110100000976' and state='2';
--dat
--投保单号查保单号
select contno,a.* from ybtdat.tranlog a where proposalprtno='5000118231031015';
--保单号查投保单号
select proposalprtno,a.* from ybtdat.tranlog a where contno='2023112300000116';
--校验agentcom在本系统中不存在，将状态改为n
select bankcode,agentcom,a.* from lacom a where bankcode like '133599935Q%' and state = 'N';
select state,a.* from lacom a where bankcode='15CN006';

--uat
--投保单号查保单号
select contno,a.* from xybt.tranlog a where proposalprtno='5000118231031015';
--保单号查投保单号
select proposalprtno,a.* from xybt.tranlog a where contno='2023110180801518';
--查询保全对账日期
select edorappdate,a.* from lpedoritem a where contno='2023112481400918';

--银保通保全确认插表
select * from es_doc_main where subtype='36524151' order by docid desc;
select a.* from es_doc_main a where doccode='2023103000000216';

/*

insert into es_doc_main (docid, doccode, busstype, subtype, numpages, docflag, docremark, scanoperator, managecom, inputstate, operator, inputstartdate, inputstarttime, inputenddate, inputendtime, makedate, maketime, modifydate, modifytime, version, scanno, printcode, pkgcode, subtypesuncan, scanflag)
values ((select max(docid)+1 from es_doc_main), '2024121700000986', 'BQ', '36522151', null, null, null, 'ybt', '86', null, null, null, null, null, null, null, null, null, null, null, '1', null, 3, null, null);
insert into es_doc_main (docid, doccode, busstype, subtype, numpages, docflag, docremark, scanoperator, managecom, inputstate, operator, inputstartdate, inputstarttime, inputenddate, inputendtime, makedate, maketime, modifydate, modifytime, version, scanno, printcode, pkgcode, subtypesuncan, scanflag)
values ((select max(docid)+1 from es_doc_main), '2024121700000986', 'BQ', '36523151', 1, '1', null, '001', '86', null, null, null, null, null, null, to_date('10-08-2023', 'dd-mm-yyyy'), '14:36:43', to_date('10-08-2023', 'dd-mm-yyyy'), '14:36:43', '1', 'LP201586010059', '2023103000001096', 1, null, null);
insert into es_doc_main (docid, doccode, busstype, subtype, numpages, docflag, docremark, scanoperator, managecom, inputstate, operator, inputstartdate, inputstarttime, inputenddate, inputendtime, makedate, maketime, modifydate, modifytime, version, scanno, printcode, pkgcode, subtypesuncan, scanflag)
values ((select max(docid)+1 from es_doc_main), '2024121700000986', 'BQ', '36524151', 1, '1', null, '001', '86', null, null, null, null, null, null, to_date('10-08-2023', 'dd-mm-yyyy'), '14:36:43', to_date('10-08-2023', 'dd-mm-yyyy'), '14:36:43', '1', 'LP201586010059', '2023103000001096', 1, null, null);
*/

--上海银行保全对账所需数据
select contno,idtype,idno,appntname from lcappnt a where contno='2023102700000996';

--银保保单打印批处理
select a.* from ldtask a where taskdescribe like '%一体化%' order by taskcode;

--生存金批处理
select a.* from ldtask a where taskdescribe like '%生存金%' order by taskcode;

select * from lpedoritem where edoracceptno='7402121100323709' and edorno='3623915100342094' and edortype='LG';
--保全对账日期
select edorappdate,a.* from lpedoritem a where contno='2023103000000986';

select * from preybt.tranlog where rcode='0' and trancom='12' and funcflag='7005' and trandate='20231122';
select payintv,a.* from lcpol a where contno='2023040100000116';
select salechnl,selltype,a.* from lccont a where contno='2023040100000116';
select a.* from lcappnt a where contno='2023040100000116';
select a.* from LCCONTDZYTPRINT a where contno='2023112300000116';
select a.* from lcepolicy a where contno='2023112300000116';


select * from tranlog where rcode='0' and trancom='22' and funcflag='2012' and trandate='20301030'