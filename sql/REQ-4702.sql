-- ID: REQ-4702
-- 标题: 邮储邮保通系统联机交易接口更新

--新邮储投保时的存储
select SALENAME,SALECERTNO from LISDATA.LCBANKAGENT a where prtno='5000118250314411';

select bak6,bak7 from LISDATA.TRANLOG a where contno='5000118250314411';

select TAXRESIDENTTYPE from lcappnt a where contno='5000118250314411';

select TAXRESIDENTTYPE from lcinsured a where contno='5000118250314411';

--非实时投保的字段保存
select BANKSALORNAME,SALORCERTNO,apptaxresidenttype from LISDATA.YBTNONREALTIMEPOL a where CONTPRTNO='5000118250314473';

select bak6,bak7 from LISDATA.TRANLOG a where contno='5000118250314473';