delete from bonusrate where riskcode='1113004';

/*
 * oracle sql 脚本：使用 insert...select 批量插入数据
 * 只需修改 connect by level <= n 中的 n 即可控制插入条数
 */

insert into bonusrate (
  riskcode,
  cvalidate,
  enddate,
  bonusgrade,
  bonusrate
)

select
  '1113004' as riskcode,--需要修改
  add_months(date '2025-07-01', (level - 1) * 12) as cvalidate,--第一条起始期间
  add_months(date '2025-07-01', level * 12) - 1 as enddate,
  'H' as bonusgrade,
  1.2 as bonusrate
from
  dual
connect by
  level <= 50; -- ★★★ 此处的数字 10 即为要插入的记录条数 (n) ★★★

-- 提交事务
--commit;

select a.*
from bonusrate a
where riskcode = '1113004';
