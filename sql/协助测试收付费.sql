--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------

协助测试收付费

--------------------------------------------------------------------------------------------------------------------------------------------
保全项目表中根据保单号查询保全受理号
SELECT * FROM lpedoritem a WHERE a.contno = ' ';
应收表中根据保全受理号查询数据
SELECT * FROM ljspay a WHERE a.otherno IN (' ');
实付表中根据保全受理号查询数据
SELECT * FROM ljaget a WHERE a.otherno IN (' ');
--------------------------------------------------------------------------------------------------------------------------------------------


--保全数据协助收付费
SELECT * FROM lpedoritem a WHERE a.contno = '2021011500000886';
--先付费
--付费--7402121100371903
SELECT * FROM ljaget a WHERE a.otherno IN ('7402121100383155','7402121100383092');
--再收费
--收费--7402121100365714
SELECT * FROM ljspay a WHERE a.otherno IN ('7402121100364011','7402121100364012');
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
--新旧资金判断
select * from lybanklog where serialno='20210803_19436';
--旧资金
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
--代收 抽档成功 支付成功
UPDATE cux_gather_detail_interface a
   SET a.deal_status        = '2',
       a.gather_status      = '0',
       a.gather_result_code = '0000',
       a.segment12          = '9007',
       a.bank_feedback      = '支付成功'
 WHERE a.segment11 = '20220601_19743'
   and a.trade_code = '30001151000000001394';
--代收 抽档失败
update CUX_gather_DETAIL_INTERFACE a
   set a.deal_status = '3'
 where a.segment11 = '20150611_02980';
--代收 抽档成功 支付失败(客户原因)
update CUX_gather_DETAIL_INTERFACE a
   set a.deal_status        = '2',
       a.gather_status      = '3',
       a.gather_result_code = '3008',
       a.segment12          = '9007'
    -- a.bank_feedback      = '失败原因'
 where a.segment11 = '20211206_19634'
   and a.trade_code = '30001151000000001394';
--代收 抽档成功 支付失败(系统原因)
update CUX_gather_DETAIL_INTERFACE a
   set a.deal_status        = '2',
       a.gather_status      = '3',
       a.gather_result_code = '2006',
       a.segment12          = '3008'
    -- a.bank_feedback      = '失败原因'
 where a.segment11 = '20200515_18060'
   AND a.trade_code = '30001151000000004746';
--------------------------------------------------------------------------------------------------------------------------------------------
select * from cux_payment_detail_interface a where a.segment11 = '20791230_14448';
--代付 抽档成功 支付成功 未退票
update cux_payment_detail_interface a
   set a.deal_status     = '2',
       a.payment_status  = '0',
       a.refund_status   = '1',
       a.pay_result_code = '0000',
       a.segment12       = '9007'
 where a.segment11 = '20221005_19736'

--代付 抽档成功 支付成功 已退票
update cux_payment_detail_interface a
   set a.deal_status     = '2',
       a.payment_status  = '0',
       a.refund_status   = '2',
       a.pay_result_code = '0000',
       a.segment12       = '9007'
 where a.segment11 = '20210610_14824';
-- 代付 抽档失败
update cux_payment_detail_interface a
   set a.deal_status = '3'
 where a.segment11 = '20200423_17948';
--代付 抽档成功 支付失败(客户原因) 
update cux_payment_detail_interface a
   set a.deal_status     = '2',
       a.payment_status  = '3',
       a.pay_result_code = '2003',
       a.segment12       = '9007'
 where a.segment11 = '20211126_19577';
--代付 抽档成功 支付失败(系统原因)
update cux_payment_detail_interface a
   set a.deal_status     = '2',
       a.payment_status  = '3',
       a.pay_result_code = '2006',
       a.segment12       = '9007'
 where a.segment11 = '20210106_19562';
--新资金
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------


--代扣代付 抽档成功 支付成功 已返盘
update ats_transactions a
   set a.dtcode          = '1',--抽档成功
       a.ats_returnstate = '2',--已返盘
       a.transstate      = '2',--处理成功
       a.payinfocode     = 'S0000',
       a.payinfo         = '支付成功'
 where a.reqseqid = '20200429_41171';
--代扣代付 抽档成功 支付失败 已返盘
UPDATE ats_transactions a
   SET a.dtcode          = '1',--抽档成功
       a.ats_returnstate = '2',--已返盘
       a.transstate      = '3',--处理失败
       a.payinfocode     = 'E1004',
       a.payinfo         = '余额不足'
 WHERE a.reqseqid = '20250929_22679';
--代扣代付 抽档成功 已返盘 退票
update ats_transactions a
   set a.dtcode          = '1',--抽档成功
       a.ats_returnstate = '2',--已返盘
       a.transstate      = '6',--退票处理
       a.payinfocode     = 'E8001',
       a.payinfo         = '其它错误'
 where a.reqseqid = '20300324_32356';
--代扣代付 抽档成功 未返盘
update ats_transactions a
   set a.dtcode          = '1',--抽档成功
       a.ats_returnstate = '1',--未返盘
       a.transstate      = '',
       a.payinfocode     = '',
       a.payinfo         = ''
 where a.reqseqid = '20200107_00614';
--代扣代付 抽档失败 已返盘
update ats_transactions a
   set a.dtcode          = '2',--抽档失败
       a.ats_returnstate = '2',--已返盘
       a.transstate      = '3',--处理失败
       a.payinfocode     = '',
       a.payinfo         = ''
 where a.reqseqid = '20200107_00614';
--代扣代付 抽档失败 未返盘
update ats_transactions a
   set a.dtcode          = '2',--抽档失败
       a.ats_returnstate = '1',--未返盘
       a.transstate      = '',
       a.payinfocode     = '',
       a.payinfo         = ''
 where a.reqseqid = '20200107_00614';
--------------------------------------------------------------------------------------------------------------------------------------------

--支付失败原因配置
select *
  from ldcode1 a
 where a.codetype = 'cuxbankerror'
   and a.code = 'cux'
   and a.code1 = '0000';
--------------------------------------------------------------------------------------------------------------------------------------------;