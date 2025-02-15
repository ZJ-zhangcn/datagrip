--新资金
--代扣代付 抽档成功 支付成功 已返盘
update ats_transactions a
   set a.dtcode          = '1',--抽档成功
       a.ats_returnstate = '2',--已返盘
       a.transstate      = '2',--处理成功
       a.payinfocode     = 'S0000',
       a.payinfo         = '支付成功'
 where a.SOURCENOTECODE = '30001151000000003213';


--代扣代付 抽档成功 支付失败 已返盘
UPDATE ats_transactions a
   SET a.dtcode          = '1',--抽档成功
       a.ats_returnstate = '2',--已返盘
       a.transstate      = '3',--处理失败
       a.payinfocode     = 'E1004',
       a.payinfo         = '余额不足'
 WHERE a.SOURCENOTECODE in ('30001151000000003214','30001151000000003215');

select a.*,rowid from ats_transactions a where reqseqid = '20260105_43706' order by RDSEQ;

select a.*,rowid from loprtmanager a where otherno='7402121100347611'
