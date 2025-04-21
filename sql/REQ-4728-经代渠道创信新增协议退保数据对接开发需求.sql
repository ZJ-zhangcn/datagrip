select sysvarvalue from ldsysvar where sysvar = 'CXSftp_login'
select sysvarvalue from ldsysvar where sysvar = 'CXFilePath'


SELECT p.contno,
       (SELECT edorname FROM lmedoritem WHERE appobj <> 'G' AND edorcode = p.edortype),
       p.EdorType,
       decode(p.standbyflag3, '0', '02', '01'),
       p.EdorAppNo,
       decode(p.EdorAppDate, '', p.cusappdate, p.EdorAppDate),
       p.EdorValiDate,
       '',
       p.EdorNo,
       p.EdorState,
       '',
       '',
       p.AppReason,
       (SELECT nvl(sum(case a.getflag when '1' then -getmoney else getmoney end), 0)
        from ljagetendorse a
        where ENDORSEMENTNO = p.edorno),
       (SELECT to_char(replace(wm_concat(riskcode), ',', '||'))
        FROM lppol
        WHERE edorno = p.edorno and EdorType = p.EdorType),
       (select prtno from lccont where contno = p.contno)
FROM lpedoritem p
WHERE p.EdorType IN ('WT', 'CT', 'XT')
  AND p.EdorValiDate between date '2025-04-17' and date '2025-04-17'
  and exists (SELECT 1
              FROM lccont b,
                   ldcode c
              WHERE c.code = b.agentcom
                and b.contno = p.contno
                and c.codetype = 'CXAgentCom'
                and b.conttype = '1')