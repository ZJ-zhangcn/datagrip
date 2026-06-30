-- ID: REQ-4728
-- 标题: 经代渠道创信新增协议退保数据对接开发需求

select sysvarvalue from ldsysvar where sysvar = 'CXSftp_login'

select sysvarvalue from ldsysvar where sysvar = 'CXFilePath'


SELECT *
FROM lpedoritem p
WHERE contno = '2023032700000406'
  and p.EdorType IN ('WT', 'CT', 'XT')
  --AND p.EdorValiDate between date '2025-04-17' and date '2025-04-17'
  and exists (SELECT 1
              FROM lccont b,
                   ldcode c
              WHERE c.code = b.agentcom
                and b.contno = p.contno
                and c.codetype = 'CXAgentCom'
                and b.conttype = '1');