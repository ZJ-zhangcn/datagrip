-- id: req-4962
-- 标题: 保单登记平台-付费明细表专项整改-保全

select a.* from temp_lcpoltransaction a where policyno in ('2025080500001426','2025080500001516');

select enteraccdate,a.* from temp_ljagetlivbene a where policyno in ('2025091000001386','');

select a.* from ljaget a where otherno in ('2025080400000686','7402121100329128');

select agentcode,a.* from lccont a where contno='2025071100000686';

select * from lppol where grpcontno='2025080500000466'

select * from ldcode1 b where b.codealias = 'insuyear' and b.codetype = 'checkRisk' and code = '1133004';

select a.* from lisdata.llbalance a where contno='2024121100002906';