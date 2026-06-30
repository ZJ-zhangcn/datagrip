-- id: req-3932
-- 标题: 保单登记平台业务类型回头看数据治理-团险运营协助提交部分

/*
--101日志
tail -f /home/weblogic/oracle/middleware/user_projects/domains/rsxcsdomain/bin/nohup.out
*/

select a.* from ldtask a where taskdescribe like '%保单登记%';

select a.* from ldtask a where taskdescribe like '%满期%';

select a.* from ldtaskplan a where taskcode='000218' order by taskplancode desc;

select distinct grpcontno from lccont a where grpcontno not like '0000000000000%' and appflag='1' and appntname like '%询价单%';

select a.* from ldgrpuwuser a where a.usercode = '001';

--保单登记报送支持的险种
select * from  bddj_lmproduct where productname like '%团体%';

select a.* from lcget a where polno in (select polno from lcpol where riskcode='2022001' and rownum<2);

select distinct getdutycode from lcget a where grpcontno='2024062100000126';

select a.* from ljaget a where actugetno='86000020240370009539';

select a.* from ljagetendorse a where actugetno='86000020240370009539';

--05-满期
----temp
select a.* from temp_lcpoltransaction a where grppolicyno='2024071700000186';

select polstatus,policyenddate,terminationdate,terminationreason,a.* from temp_lcgrpcont a where grppolicyno='2024071700000186';

select invaliddate,status,a.* from temp_lcgrpproduct a where grppolicyno='2024071700000186';

select grppolicyno,policyno,gpflag,polstatus,policyenddate,terminationdate,terminationreason,a.* from temp_lccont a where grppolicyno='2024071700000186';

select grppolicyno,policyno,gpflag,invaliddate,status,terminationdate,a.* from temp_lcproduct a where grppolicyno='2024071700000186';

select grppolicyno,policyno,gpflag,a.* from temp_lcprodinsurela a where grppolicyno='2024071700000186';

select grppolicyno,policyno,gpflag,invaliddate,status,a.* from temp_lcliability a where grppolicyno='2024071700000186';

select grppolicyno,policyno,gpflag,a.* from temp_lcbnf a where grppolicyno='2024071700000186';

----prip
select a.* from prip_lcpoltransaction a where grppolicyno='2024071700000186';

select polstatus,policyenddate,terminationdate,terminationreason,a.* from prip_lcgrpcont a where grppolicyno='2024071700000186';

select invaliddate,status,a.* from prip_lcgrpproduct a where grppolicyno='2024071700000186';

select grppolicyno,policyno,gpflag,polstatus,policyenddate,terminationdate,terminationreason,a.* from prip_lccont a where grppolicyno='2024071700000186';

select grppolicyno,policyno,gpflag,invaliddate,status,terminationdate,a.* from prip_lcproduct a where grppolicyno='2024071700000186';

select grppolicyno,policyno,gpflag,a.* from prip_lcprodinsurela a where grppolicyno='2024071700000186';

select grppolicyno,policyno,gpflag,invaliddate,status,a.* from prip_lcliability a where grppolicyno='2024071700000186';

select grppolicyno,policyno,gpflag,a.* from prip_lcbnf a where grppolicyno='2024071700000186';
--76-保全补退费
----temp
select a.* from temp_lcpoltransaction a where grppolicyno='2024071700000186';

select a.* from temp_ljagetendorse a where grppolicyno='2024071700000186';

----prip
select a.* from prip_lcpoltransaction a where grppolicyno='2024071700000186';

select a.* from prip_ljagetendorse a where grppolicyno='2024071700000186';
--85-其他保全类型
----temp
select a.* from temp_lcpoltransaction a where grppolicyno='2024071700000186';

select a.* from temp_lcgrpcont a where grppolicyno='2024071700000186';

select a.* from temp_lcgrpproduct a where grppolicyno='2024071700000186';

select grppolicyno,policyno,gpflag,premium,suminsured,cashvalue,accumpremium,policyenddate,a.* from temp_lccont a where grppolicyno='2024071700000186';

select grppolicyno,grpproductno,policyno,gpflag,productno,a.* from temp_lcprodinsurela a where grppolicyno='2024071700000186';

select grppolicyno,policyno,productno,gpflag,effdate,invaliddate,premium,accumpremium,basicsuminsured,cashvalue,surrenderamnt,status,a.* from temp_lcproduct a
where grppolicyno='2024071700000186';

select grppolicyno,policyno,productno,gpflag,liabilitycode,liabilityname,effdate,invaliddate,status,a.* from temp_lcliability a where grppolicyno='2024071700000186';

select a.* from temp_lcbnf a where grppolicyno='2024071700000186';

select a.* from temp_lcinsureacc a where grppolicyno='2024071700000186';

select a.* from temp_lcinsureacctrace a where grppolicyno='2024071700000186';

select a.* from temp_ljapaygrp a where grppolicyno='2024071700000186';

select a.* from temp_ljapay a where grppolicyno='2024071700000186';

----prip
select a.* from prip_lcpoltransaction a where grppolicyno='2024071700000186';

select a.* from prip_lcgrpcont a where grppolicyno='2024071700000186';

select a.* from prip_lcgrpproduct a where grppolicyno='2024071700000186';

select grppolicyno,policyno,gpflag,premium,suminsured,cashvalue,accumpremium,policyenddate,a.* from prip_lccont a where grppolicyno='2024071700000186';

select grppolicyno,grpproductno,policyno,gpflag,productno,a.* from prip_lcprodinsurela a where grppolicyno='2024071700000186';

select grppolicyno,policyno,productno,gpflag,effdate,invaliddate,premium,accumpremium,basicsuminsured,cashvalue,surrenderamnt,status,a.* from prip_lcproduct a
where grppolicyno='2024071700000186';

select grppolicyno,policyno,productno,gpflag,liabilitycode,liabilityname,effdate,invaliddate,status,a.* from prip_lcliability a where grppolicyno='2024071700000186';

select a.* from prip_lcbnf a where grppolicyno='2024071700000186';

select a.* from prip_lcinsureacc a where grppolicyno='2024071700000186';

select a.* from prip_lcinsureacctrace a where grppolicyno='2024071700000186';

select a.* from prip_ljapaygrp a where grppolicyno='2024071700000186';

select a.* from prip_ljapay a where grppolicyno='2024071700000186';
--54-定期结算方式变更
----temp
select pushdate,a.* from temp_lcpoltransaction a where grppolicyno='2024071700000186';

select regularclearingflag,regularclearing,premiumduedate,a.* from temp_lcgrpcont a where grppolicyno='2024071700000186';

select a.* from temp_lcgrpproduct a where grppolicyno='2024062100000126';

----prip
select a.* from prip_lcpoltransaction a where grppolicyno='2024071700000186';

select regularclearingflag,regularclearing,premiumduedate,a.* from prip_lcgrpcont a where grppolicyno='2024071700000186';

select a.* from prip_lcgrpproduct a where grppolicyno='2024062100000126';

--31-退保
select pushdate,a.* from temp_lcpoltransaction a where grppolicyno='2024071700000186';