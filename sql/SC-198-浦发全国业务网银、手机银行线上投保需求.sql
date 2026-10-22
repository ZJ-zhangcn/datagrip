SELECT a.*
FROM ldcom a
where COMCODE IN ('86991201', '86993201', '86993301');
--网点
SELECT bankcode, MANAGECOM, a.*
FROM lacom a
WHERE MANAGECOM IN ('86991201', '86993201', '86993301')
  and bankcode = '119539';

SELECT bankcode, MANAGECOM, a.*
FROM lacom a
WHERE agentcom='030401010109';


SELECT a.*
FROM lacom a
WHERE bankcode like '11%'
  and MANAGECOM = '86310000';

--保单送达方式、回执签收日期
SELECT managecom 管理机构, CustomGetPolDate 回执签收日期, GetPolMode 保单送达方式, pfqgflag 是否为浦发全国单标记, a.*
FROM lccont a
WHERE contno in ('2026101600001596');

