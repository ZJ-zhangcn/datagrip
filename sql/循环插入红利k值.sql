delete from BONUSRATE where riskcode='1116002';

/*
 * Oracle SQL 脚本：使用 INSERT...SELECT 批量插入数据
 * 只需修改 CONNECT BY LEVEL <= N 中的 N 即可控制插入条数
 */

INSERT INTO BONUSRATE (
  RISKCODE,
  CVALIDATE,
  ENDDATE,
  BONUSGRADE,
  BONUSRATE
)
SELECT
  '1116002' AS RISKCODE,--需要修改
  ADD_MONTHS(DATE '2025-07-01', (LEVEL - 1) * 12) AS CVALIDATE,--第一条起始期间
  ADD_MONTHS(DATE '2025-07-01', LEVEL * 12) - 1 AS ENDDATE,
  'H' AS BONUSGRADE,
  1.2 AS BONUSRATE
FROM
  dual
CONNECT BY
  LEVEL <= 50; -- ★★★ 此处的数字 10 即为要插入的记录条数 (n) ★★★

-- 提交事务
--COMMIT;

/*
select a.*
from BONUSRATE a
where riskcode = '1306002';
*/
