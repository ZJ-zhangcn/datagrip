select a.* from TEMP_LCPolTransaction a where POLICYNO in ('2025080500001426','2025080500001516');
select ENTERACCDATE,a.* from temp_LJAGetLivBene a where POLICYNO in ('2025091000001386','');
select a.* from ljaget a where otherno in ('2025080400000686','7402121100329128');
select agentcode,a.* from lccont a where contno='2025071100000686';
select * from lppol where grpcontno='2025080500000466'

select * from ldcode1 b where b.codealias = 'insuyear' and b.codetype = 'checkRisk' and code = '1133004';
select a.* from LISDATA.LLBALANCE a where contno='2024121100002906';