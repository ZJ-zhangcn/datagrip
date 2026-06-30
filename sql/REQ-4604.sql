-- id: req-4604
-- 标题: 新增值税系统与核心系统开票信息对接的需求

select a.* from ldtask a where taskclass='CustomerInformationPushTask';

select * from ldcode where codetype='PushAllLjaTax';

select * from ljatax where taxmainno ='T0000000000037886';

select a.* from ljatax a where customerno='1060092781';

select a.* from lybilllog a where trantype='A001';

/*
delete from lybilllog where trantype='A005';

insert into ljatax (taxmainno, batchno, buinessno, buinesstype, buinessdate, salechnlname, managecom, grpcontno,
                            contno, getnoticeno, customerno, customernoname, billdate, cztaxmainno, czolddate, cztype,
                            status, taxtype, polno, payintv, riskcode, dutycode, payplancode, money, price, tax,
                            filepath, operator, makedate, maketime, modifydate, modifytime, standbyflag1, standbyflag2,
                            standbyflag3)
values ('T0000000000037886', '0000000000000675', '3623915100343109', 'RF', date '2025-11-30', null, '86010101',
        '00000000000000000000', '2024081900008306', '86000020250320000436', '1060092780', '银保投保八',
        date '2025-11-30', null, null, null, '0', '0102', '210010000406864', 12, '1303014', '000000', '000000', 260.27,
        236.61, 23.66, null, '001', date '2025-02-18', '14:07:23', date '2025-02-18', '14:07:23', '54', null, null);
*/
select count(1) from (select a.mobile,a.email from lcaddress a order by makedate desc ,maketime desc)  where rownum = 1;

select * from ldcode where codetype='LYRETURN_URL' and code='02';

select mobile,email,a.* from lcaddress a where mobile='13887954654';

select a.* from ldperson a where customerno='1000038055';

select a.* from ldperson a where name='银保投保六三';

select customerno from ldperson a group by customerno having count(customerno)>1;

select customerno,count(customerno) from lcaddress a where customerno in (select customerno from ldperson a) group by customerno having count(customerno)>1;

select a.* from lcaddress a where customerno='1000000198' and rownum=1 order by makedate desc,maketime desc;

select a.* from lysendbillorder a where contno='2025121500000116';

select a.* from lysendbillorder a where getnoticeno='86010120250320004932' order by modifydate,modifytime;

select a.* from lysendbillorder a where orderno in ('S20251217000000660284','');

select a.* from lysendbill a where orderno in ('S20251217000000660284','');

select a.* from lysendbill a where orderno in (select orderno from lysendbillorder where contno='2025121500000116');

select a.* from lybilllog a where orderno in ('S20250918000000633198','');

--官微
select a.* from lcinvoiceapplicationapp a where contno='2025121500000116';

select a.* from ldperson a where name='银保投保六二';

--update ldperson set modifydate=date'2025-06-19' where (name like '银保投保%' or name like '个险投保%')
select modifydate,modifytime,a.* from ldgrp a where grpname like '%比亚迪%';

select modifydate,modifytime,a.* from ldgrp a where grpname like '%上海人寿股份有限公司%';

select modifydate,modifytime,a.* from ldgrp a where grpname like '%中科软北京分公司%';

select a.grpname,count(a.grpname) from ldgrp a group by grpname having count(a.grpname)=1;
--回传核对
--返回开票主表（lyreturnbillorder）
select orderreturnno      流水号,
       orderno            订单号,
       returndate         返回日期,
       billstatus         开票状态/*1:开票成功、2:开票失败、3:作废成功、5:无需开票*/,
       errormessage       开票异常,
       billline           开票种类,
       billtype           发票类型,
       billdate           开票日期,
       billtime           开票时间,
       pdfurl             发票pdf路径,
       taxfreeamounttotla 不含税金额,
       taxtotal           税额,
       taxamounttotal     含税金额,
       billnumberelec     数电号码,
       oldbillnumberelec  原数电号码,
       remark             发票备注,
       redflag            蓝红票标识,
       standbyflag1       开票id,
       b.*
from lyreturnbillorder b
where orderno in ('S20260115000000634011', '', '', '');

--返回开票明细（lyreturnbill）
select orderreturrnbillno 流水号,
       orderno            订单号,
       taxcode            税收分类,
       polno              保单险种号,
       riskcode           险种编码,
       riskname           险种名称,
       numcount           数量,
       taxfreeamount      不含税金额,
       tax                税额,
       taxamount          含税金额,
       taxflag            含税价标志,
       standbyflag1       开票id,
       a.*
from lyreturnbill a
where orderno in ('S20260115000000634011', '', '', '');

--删除核对
select status,reason,a.* from lysendbillorder a where orderno in ('S20260115000000634011','');

select a.* from lybilllog a where orderno in ('S20260115000000634011','') order by serialno;