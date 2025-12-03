select POLAPPLYDATE,SIGNDATE,CVALIDATE,a.* from lccont a where prtno='5000118251009047';

select a.* from LIS.LYSENDTOBANK a where SERIALNO='20261025_44192';

select a.* from ats_transactions a where

update ats_transactions a
set a.dtcode          = '1',--抽档成功
    a.ats_returnstate = '2',--已返盘
    a.transstate      = '2',--处理成功
    a.payinfocode     = 'S0000',
    a.payinfo         = '支付成功'
where a.reqseqid = '20261025_44192';

UPDATE ats_transactions a
SET a.dtcode          = '1',--抽档成功
    a.ats_returnstate = '2',--已返盘
    a.transstate      = '3',--处理失败
    a.payinfocode     = 'E1004',
    a.payinfo         = '余额不足'
WHERE a.reqseqid = '20261025_44192'
  and SOURCENOTECODE in ('30001151000000003252', '30001151000000003253');


