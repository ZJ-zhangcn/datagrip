--犹豫期
select HESITATEEND
from LMEdorWT
where riskcode = '1303022';

--还款利息
select round(1000 * 0.03 / 365 * (date '2026-07-20' - date '2026-06-10' - 1), 2) 还款利息
from dual;

--月结利息
select 10670 from dual;
