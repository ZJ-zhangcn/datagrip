UPDATE ats_transactions a
SET a.dtcode          = '1',--抽档成功
    a.ats_returnstate = '2',--已返盘
    a.transstate      = '3',--处理失败
    a.payinfocode     = 'E1001',
    a.payinfo         = '账户不存在'
WHERE a.reqseqid = '20250511_30197';


--Ne2001：
select codename from ldcode1 where codetype = 'failedtransfer' and code='03' and code1 = '1';
--Ne2002：
select codename from ldcode1 where codetype = 'failedtransfer' and code='03' and code1 = '2';
--Ne2003：
select codename from ldcode1 where codetype = 'succcharge' and code='03' and code1 = '1';

select a.* from ldtask a where TASKDESCRIBE like '%短信%'

select a.* from SMS_DISPATCH_LIST a where otherno='5000118350314283'

