select a.* from ldtask a where TASKCLASS='CustomerInformationPushTask';
select * from ldcode where codetype='PushAllLjaTax';
select * from LjaTax where TAXMAINNO ='T0000000000037886';
select a.* from ljatax a where CUSTOMERNO='1060092781';
select a.* from LYBillLog a where TRANTYPE='A001';
delete from LYBillLog where TRANTYPE='A005'

INSERT INTO LISDATA.LJATAX (TAXMAINNO, BATCHNO, BUINESSNO, BUINESSTYPE, BUINESSDATE, SALECHNLNAME, MANAGECOM, GRPCONTNO,
                            CONTNO, GETNOTICENO, CUSTOMERNO, CUSTOMERNONAME, BILLDATE, CZTAXMAINNO, CZOLDDATE, CZTYPE,
                            STATUS, TAXTYPE, POLNO, PAYINTV, RISKCODE, DUTYCODE, PAYPLANCODE, MONEY, PRICE, TAX,
                            FILEPATH, OPERATOR, MAKEDATE, MAKETIME, MODIFYDATE, MODIFYTIME, STANDBYFLAG1, STANDBYFLAG2,
                            STANDBYFLAG3)
VALUES ('T0000000000037886', '0000000000000675', '3623915100343109', 'RF', DATE '2025-11-30', null, '86010101',
        '00000000000000000000', '2024081900008306', '86000020250320000436', '1060092780', '银保投保八',
        DATE '2025-11-30', null, null, null, '0', '0102', '210010000406864', 12, '1303014', '000000', '000000', 260.27,
        236.61, 23.66, null, '001', DATE '2025-02-18', '14:07:23', DATE '2025-02-18', '14:07:23', '54', null, null);


SELECT count(1) FROM (SELECT a.Mobile,a.EMail FROM lcaddress a order by makedate desc ,maketime desc)  WHERE ROWNUM = 1

select * from ldcode where codetype='LYRETURN_URL' and code='02'

select mobile,EMAIL,a.* from lcaddress a where mobile='13887954654'
select a.* from LISDATA.LDPERSON a where CUSTOMERNO='1000038055'
select a.* from LISDATA.LDPERSON a where name='银保投保六三';
select CUSTOMERNO from LISDATA.LDPERSON a group by CUSTOMERNO having count(CUSTOMERNO)>1
select CUSTOMERNO,count(CUSTOMERNO) from lcaddress a where CUSTOMERNO in (select CUSTOMERNO from LISDATA.LDPERSON a) group by CUSTOMERNO having count(CUSTOMERNO)>1

select a.* from lcaddress a where CUSTOMERNO='1000000198' and rownum=1 order by makedate desc,maketime desc;

select a.* from lysendbillorder a where contno='2025070200002106'
select a.* from LYSENDBILLORDER a where GETNOTICENO='86010120250320003847' order by MODIFYDATE,MODIFYTIME;
select a.* from lysendbillorder a where ORDERNO in ('S20250702000000655651','');
select a.* from lysendbill a where orderno in ('S20250710000000656222','');
select a.* from lysendbill a where orderno in (select ORDERNO from lysendbillorder where contno='2025070200002106');
select a.* from LYBILLLOG a where ORDERNO in ('S20250710000000656222','');
--官微
select a.* from LCInvoiceApplicationApp a where GETANDPAYNO='86010120250320003847'

select a.* from LISDATA.LDPERSON a where name='银保投保六二';
--update LDPERSON set MODIFYDATE=date'2025-06-19' where (name like '银保投保%' or name like '个险投保%')
select MODIFYDATE,MODIFYTIME,a.* from ldgrp a where grpname like '%比亚迪%';
select MODIFYDATE,MODIFYTIME,a.* from ldgrp a where grpname like '%上海人寿股份有限公司%';
select MODIFYDATE,MODIFYTIME,a.* from ldgrp a where grpname like '%中科软北京分公司%';
select a.GRPNAME,count(a.grpname) from ldgrp a group by GRPNAME having count(a.grpname)=1;


--回传核对
--返回开票主表（lyReturnBillOrder）
SELECT /*orderReturnNo      流水号,
       orderNo            订单号,
       returnDate         返回日期,
       billStatus         开票状态*//*1:开票成功、2:开票失败、3:作废成功、5:无需开票*//*,
       errorMessage       开票异常,
       billLine           开票种类,
       billType           发票类型,
       BillDate           开票日期,
       BillTime           开票时间,
       pdfUrl             发票pdf路径,
       TaxFreeAmountTotla 不含税金额,
       taxTotal           税额,
       taxAmountTotal     含税金额,
       billNumberElec     数电号码,
       oldBillNumberElec  原数电号码,
       remark             发票备注,
       redFlag            蓝红票标识,
       StandByFlag1       开票ID,*/
       b.*
FROM LYReturnBillOrder b
WHERE orderNo in ('S20250710000000656222', '', '', '');

--返回开票明细（lyReturnBill）
SELECT ORDERRETURRNBILLNO 流水号,
       orderNo            订单号,
       taxCode            税收分类,
       polno              保单险种号,
       riskcode           险种编码,
       riskName           险种名称,
       numCount           数量,
       taxFreeAmount      不含税金额,
       tax                税额,
       taxAmount          含税金额,
       taxFlag            含税价标志,
       StandByFlag1       开票ID,
       a.*
FROM lyReturnBill a
WHERE orderNo in ('S20250801000000656219', '', '', '');

--删除核对
select Status,Reason,a.* from LYSendBillOrder a where ORDERNO in ('S20250702000000655654','S20250702000000655686');
select a.* from LYBillLog a where ORDERNO in ('S20250702000000655654','S20250702000000655686') order by SERIALNO;
