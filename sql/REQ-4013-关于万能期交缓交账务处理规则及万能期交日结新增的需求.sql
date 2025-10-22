/*
5000118240423010  2024022800004026
5000118240423027  2024042300000186
5000118240424016  2024042400000286  女
5000118240424023  2024042400000376  非同一人
5000118240510010  2024051000000206
5000118240511016  2024080100000286  节假日拆单
*/

--('2024080100000286','2024051000001176')

--
select cvalidate,a.* from lcpol a where contno='5000118340528063';
select appflag,signdate,cvalidate,managecom,salechannels,a.* from lccont a where contno in ('20240424000001963','');

--
select a.*/**/ from lccontstate a where contno='2024042400000286';
insert into lccontstate (CONTNO, INSUREDNO, POLNO, STATETYPE, STATE, STATEREASON, STARTDATE, ENDDATE, REMARK, OPERATOR, MAKEDATE, MAKETIME, MODIFYDATE, MODIFYTIME)
values ('2024042300000186', '1060093044', '210310000006481', 'DefedPay', '1', null, to_date('24-06-2025', 'dd-mm-yyyy'), null, null, 'sys', to_date('01-07-2025', 'dd-mm-yyyy'), '00:00:14', to_date('01-07-2025', 'dd-mm-yyyy'), '00:00:14');
--hanuptype:1-新契约 2-保全 3-续期 4-理赔 5-渠道  flag:0-未挂起  1-已挂起
select a.* from lcconthangupstate a where contno='2024080100000286';

--
select a.* from ljspay a where otherno='2024042400000286';
select a.* from ljspayperson a where contno='2024042400000286';
select a.* from ljapay a where otherno in ('2024042400000286','');
select a.* from ljapayperson a where contno in ('2024042400000286','');
select a.* from ljtempfee a where otherno='2024042400000286';
select a.* from ljtempfeeclass a where TEMPFEENO='86000020270320000094';
select a.* from lcinsureacctrace a where contno in ('2024042400000286','') and MONEYTYPE='CS' and riskcode='1303012' and makedate between date'2027-07-28' and date'2027-07-28' order by contno,paydate desc;
select a.* from lcinsureacctrace a where contno in ('2024042400000286','') order by paydate desc,makedate desc,maketime desc;
select a.* from lcinsureaccfeetrace a where contno='2024042400000286' order by paydate desc;
select a.* from ldtask a where taskdescribe like '%缓交%';

--科目明细
select f.source_batch_id 提账批次号,
       f.je_category_name 凭证类型,
       f.lis_contno 保单号,
       f.lis_prtno 投保单号,
       f.accounting_date 账务日期,
       f.source_desc 业务类别,
       f.line_desc 描述,
       f.attribute15 新旧,
       f.entered_dr 借方金额,
       f.entered_cr 贷方金额,
       f.segment1 公司,
       f.segment2 成本中心,
       f.segment3 核算科目,
       f.segment4 明细,
       f.segment5 渠道,
       f.segment6 产品/*,
       (select acquisitionid from fiaboriginaldata where aserialno = f.attribute1) 算法代码,
       (select DISTILLSQL from ficostdataacquisitiondef where acquisitionid in (select acquisitionid from fiaboriginaldata where aserialno = f.attribute1)) 算法*/
  from of_interface f
 where lis_contno in ('2024061400000186', '') --2024052600000196\2024052700000106
   and f.source_batch_id = '00000000000000009280'
   --and (f.entered_dr='1500' or f.entered_cr='1500')
 order by attribute15, segment3;