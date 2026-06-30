-- id: req-4702
-- 标题: 邮储邮保通系统联机交易接口更新

--新邮储投保时的存储
select salename,salecertno from lisdata.lcbankagent a where prtno='5000118250314411';

select bak6,bak7 from lisdata.tranlog a where contno='5000118250314411';

select taxresidenttype from lcappnt a where contno='5000118250314411';

select taxresidenttype from lcinsured a where contno='5000118250314411';

--非实时投保的字段保存
select banksalorname,salorcertno,apptaxresidenttype from lisdata.ybtnonrealtimepol a where contprtno='5000118250314473';

select bak6,bak7 from lisdata.tranlog a where contno='5000118250314473';