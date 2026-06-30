-- id: req-4739
-- 标题: 关于转账提醒短信的变更需求

/*
update ats_transactions a
set a.dtcode          = '1',--抽档成功
    a.ats_returnstate = '2',--已返盘
    a.transstate      = '3',--处理失败
    a.payinfocode     = 'E1001',
    a.payinfo         = '账户不存在'
where a.reqseqid = '20250511_30197';
*/
--ne2001：
select codename from ldcode1 where codetype = 'failedtransfer' and code='03' and code1 = '1';

--ne2002：
select codename from ldcode1 where codetype = 'failedtransfer' and code='03' and code1 = '2';

--ne2003：
select codename from ldcode1 where codetype = 'succcharge' and code='03' and code1 = '1';

select a.* from ldtask a where taskdescribe like '%短信%'

select a.* from sms_dispatch_list a where otherno='5000118350314283';