-- id: req-4728
-- 标题: 经代渠道创信新增协议退保数据对接开发需求

select sysvarvalue from ldsysvar where sysvar = 'CXSftp_login'

select sysvarvalue from ldsysvar where sysvar = 'CXFilePath'


select *
from lpedoritem p
where contno = '2023032700000406'
  and p.edortype in ('WT', 'CT', 'XT')
  --and p.edorvalidate between date '2025-04-17' and date '2025-04-17'
  and exists (select 1
              from lccont b,
                   ldcode c
              where c.code = b.agentcom
                and b.contno = p.contno
                and c.codetype = 'CXAgentCom'
                and b.conttype = '1');