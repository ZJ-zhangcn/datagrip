select paymode
from ljspay a
where otherno = '3229315100006980';

select distinct appntno
from lcpol a
where appntname like '个险投保%'
  and rownum = '1'
order by appntno desc;

--增人
select round(150.73 * (date'2026-08-09' - date'2026-07-15') / 31, 2)
from dual;

--减人
select round(41.67 * (date'2026-08-09' - date'2026-07-15') / 31, 2)
from dual;

--保险计划变更
select round(150.73 * (date'2026-08-09' - date'2026-07-16'/*变更生效日期*/) / 31, 2) 变更前计划保费,
       round(41.67 * (date'2026-08-09' - date'2026-07-16') / 31, 2)                  变更后计划保费
from dual;

--解除合同
select insuredname, round(prem * (1 - 0.25) * (1 - (date'2026-08-09' - date'2026-07-16')) / 24, 2)
from lcpol a
where grpcontno = '2026060900001286'
  and appflag = '1'
  and insuredname = '投保六';

select grpcontno, name, sex, idtype, idno, birthday, insuredno
from lcinsured a
where a.grpcontno = '2026060900001286'
order by contno;

select a.*
from ljaget a
where otherno = '3631815101011439';


select round(1000 / 10 * 52 / 12, 2) * (date'2026-08-11' - date'2026-07-16') / 31
from dual;

select 69 * (date'2026-06-01' - date'2026-05-12') / 31 * (1 - 0.25)
from dual;

select riskcode, count(riskcode)
from lmriskduty a
where riskcode in (select RiskCode
                   from LMRiskApp
                   where (enddate is null or enddate > date'2026-06-15')
                     and riskprop in ('G', 'D')
                   union

                   select riskcode
                   from LMRiskComCtrl
                   where startdate <= date'2026-06-15'
                     and (enddate is null or enddate > date'2026-06-15')
                     and ManageComGrp = '86010101'
                     and
                       (select distinct(riskprop) from lmriskapp where riskcode = lmriskcomctrl.riskcode) in ('G', 'D'))
  and riskcode in (select riskcode from lmriskapp where riskname like '浦银%')
group by a.riskcode
having count(riskcode) > 1;

