--
select cvalidate,a.* from lccont a where prtno='5000118240402016';
--
select cvalidate,signdate,a.* from lcpol a where prtno='5000118240403012';
select cvalidate,signdate,paytodate,a.* from lcpol a where contno='2024071000000716';
--
select a.* from ldtask a where taskdescribe like '%满期%';

--应收
select a.* from ljspay a where otherno='2024040300000326';
--应收个人
select a.* from ljspayperson a where contno='2024040300000286';
--实收
select startpaydate/* 应交日期*/,EnterAccDate/* 到账日期*/,ConfDate/* 确认日期*/,a.* from ljapay a where incomeno='2024071000000716';
select a.* from ljapay a where PAYNO='86310020250320000127';
--实收个人
select confdate,a.* from ljapayperson a where contno='2024071000000716';
--
select a.* from splitcont a where contno='2024040300000286';
--
select a.* from lysendtobank a where polno='2024040300000286';
--
select a.* from lcinsureacc a where contno='2024071000000716';
--账户轨迹
select a.* from lcinsureacctrace a where contno='2023120700000466' order by paydate desc;
--update lcinsureacctrace set makedate=paydate,modifydate=paydate where contno='2024071000000716'

--FX
select -sum(money)*(1.6-1)*0.3/1000/366*30 from lcinsureacctrace where contno='2024040300000286' and paydate<date'2024-09-01';

--暂交费表
select enteraccdate 到帐日期,
       PayMoney     交费金额,
       ConfFlag     是否核销标志 /*1-已核销*/,
       managecom    交费机构,
       policycom    管理机构,
       ConfMakeDate 财务确认日期,
       TEMPFEENO    暂交费收据号码,
       (select codename from ldcode where codetype='paymode' and code=a.paymode) 交费方式
  from ljtempfeeclass a
 where otherno = '5000118240402016';
 --TEMPFEENO='86310020240310000010'


--数据采集信息
select a.*
  from FIDataDistilledInfo a
 where batchno = '00000000000000003555';


--记账类型对应的算法编码
select a.* from FICostTypeDef a where CERTIFICATEID='SF_BQ';

--记账算法表
select a.* from ficostdataacquisitiondef a where ACQUISITIONID='00000782';
select a.* from ficostdataacquisitiondef a where DISTILLSQL like '%WN_FY%';

--正常收费模拟第三方收费修改bankcode='UnionPay' and bankcode=null
select bankcode,bankaccno,inbankcode,inbankaccno,paymode,managecom 交费机构,policycom 管理机构,managecom,policycom from ljtempfeeclass a where otherno='7402121100347441';
--拆单收费模拟第三方收费修改inbankcode='UnionPay' and inbankaccno=null
select inbankcode,inbankaccno from splitcont a where contno='2024050700000386';
--拆单收费模拟正常收费修改inbankcode='0116' and inbankaccno='216200100101807734'
select inbankcode,inbankaccno from splitcont a where contno='2024040300000286';
select a.* from ljaget a where otherno='7402121100347444';

--数据回滚日期
select makedate from fiaboriginaldata a where batchno='00000000000000009209';

--科目明细
select f.source_batch_id 提账批次号,f.je_category_name 凭证类型,f.lis_contno 保单号,f.lis_prtno 投保单号,f.accounting_date 账务日期,
       f.source_desc 业务类别,f.line_desc 描述,f.attribute15 新旧,
       f.entered_dr 借方金额,f.entered_cr 贷方金额,
       f.segment1 公司,f.segment2 成本中心,
       f.segment3 核算科目,f.segment4 明细,f.segment5 渠道,f.segment6 产品
  from of_interface f,FIDataDistilledInfo a
 where f.source_batch_id=a.batchno
 and a.Aserialno=f.Attribute1
 and f.source_batch_id = '00000000000000003565' 
 and lis_contno = '2023122800002386'
 order by a.businessno,attribute15,segment3;