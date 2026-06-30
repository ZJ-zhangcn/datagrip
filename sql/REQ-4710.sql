-- id: req-4710
-- 标题: 分红险在满期时自动支付未领取红利的需求

select a.* from ldtask a where taskdescribe like '%红利%'

select a.* from lccont a where contno='2025060400000216'

select * from ljaget where otherno='2025060400000216';

--delete
select leavingmoney,a.* from lcpol a where contno='2025060400000216'

select a.* from lisdata.lobonuspol a where contno='2025060400000216' order by fiscalyear

select * from ljabonusget where contno='2025060400000216' order by actugetno;

--delete
select a.* from lcinsureacc a where contno='2025060400000216'

select * from lcinsureacctrace where contno='2025060400000216' order by serialno;

--delete
select a.* from lisdata.loprtmanager a where otherno='2025060400000216';

select a.* from lisdata.lysendtobank a where polno='2025060400000216';

select a.* from lysendtobankb a where polno='2025060400000216';

select a.* from lisdata.lysendtobankb a where polno='2025060400000216';

select idstdate,idexpdate,a.* from lcappnt a where contno='2025060400000216'--9999-01-01

select a.* from lcbonusautoacctrace a where contno='2025060400000216'

select a.* from lyreturnfrombankb a where paycode='86310020250370000267'

/*
delete from ljaget where otherno='2025060400000216' and othernotype='7';

update lcpol a set leavingmoney=0 where contno='2025060400000216';

delete from ljabonusget where contno='2025060400000216' and paymode='4';

delete from lcinsureacctrace where contno='2025060400000216' and payplancode='IP0274' and moneytype='LJTF';

update lcinsureacc a set a.insuaccbala=902.81,a.baladate=date'2030-06-05' where contno='2025060400000216' and acctype='004';

update lcinsureaccclass a set a.insuaccbala=902.81,a.baladate=date'2030-06-05' where contno='2025060400000216' and acctype='004';

delete from lcbonusautoacctrace a where contno='2025060400000216'
*/

--保单登记
--个人险种表
select accumdiv,accumdivint,accumdivsi,lstdistridate,currentdivamnt,a.* from temp_lcproduct a where policyno='2025060400000216';

--红利分配表
select divdistribmeth,divamnt,bankcode,bankname,bankaccno,accname,divamntdraw,divdrawdate,a.* from temp_ljdivdistrib a where policyno='2025060400000216' order by divyear;

--付费明细表
select gettype,a.* from temp_ljaget a where policyno='2025060400000216';

/*
delete from temp_lccont where policyno='2025060400000216';

delete from temp_lcinsureacc where policyno='2025060400000216';

delete from temp_lcinsureacctrace where policyno='2025060400000216';

delete from temp_lcliability where policyno='2025060400000216';

delete from temp_lcprodinsurela where policyno='2025060400000216';

delete from temp_lcproduct where policyno='2025060400000216';

delete from temp_ljloanrepayment where policyno='2025060400000216';

delete from temp_ljdivdistrib where policyno='2025060400000216';

delete from temp_lcbnf where policyno='2025060400000216';
*/;