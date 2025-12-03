select HEALTHTYPE 体检套餐类别,
/*1-累计寿险保额（储蓄）-1303018
2-累计寿险保额（增额）-1116003
3-累计寿险保额（保障）-1111003
4-累计保障型寿险（高净值）-1016007
5-累计储蓄型寿险风险保额（A类）-1306002
6-累计储蓄型寿险风险保额（B类）-1311005
7-累计重大疾病保额-1051016
累计年交保费（年长年金）-1033017*/
       HEALTHCODE 体检套餐,
       MINAGE     最小年龄,
       MAXAGE     最大年龄,
       MINAMNT    最小保额,
       MAXAMNT    最大保额,
       SEX        性别
from LdPENoticePackage a
where HEALTHTYPE = '1'
order by HEALTHTYPE, HEALTHCODE, MINAGE;

SELECT distinct PHYSICALSET, healthname
FROM LCPENoticeItem a,
     ldhealth b
WHERE a.PHYSICALSET = healthcode
  and a.contno = '5000118351009932';

select 450 / 0.6
from dual;

select a.*
from lmriskapp a
where riskcode = '1311005';

select a.* from ldtask a where TASKDESCRIBE like '%问题件%';

select a.* from LISDATA.TRANAPP a where contno='5000118351009932';

select a.*
from ldriskrule a
where riskcode in ('1303018', '1116003', '1111003', '1016007', '1306002', '1311005', '1051016')
  and SALECHNL = '02'
order by a.riskcode, a.SALECHNL;--1303018

INSERT INTO LISDATA.LDRISKRULE (RISKCODE, SALECHNL, COMGROUP, STARTPOLAPPLYDATE, ENDPOLAPPLYDATE, STARTSCANDATE,
                                STARTSCANTIME, ENDSCANDATE, ENDSCANTIME, OPERATOR, MAKEDATE, MAKETIME, MODIFYDATE,
                                MODIFYTIME)
VALUES ('1303018', '02', '86', DATE '2024-08-01', null, DATE '2024-08-01', '0       ', null, null, '1',
        DATE '2024-08-01', '0       ', DATE '2024-08-01', '0       ');

select a.*
from lcpol a
where appflag = '1'
  and riskcode in ('1131001', '', '')
  and INSUREDAPPAGE > '70';

--
select a.*
from lmrisksort a
where risksorttype = '1'
  and RiskSortValue in ('G1', 'MU', 'MI');

select distinct a.riskcode
from lmriskapp a,
     lmrisksort b
where a.RISKCODE = b.RISKCODE
  and RiskStyle = '01'
  and exists (select 1 from ldriskrule where riskcode = a.riskcode and SALECHNL = '02')
  and RiskSortValue = '1'
  and b.risksorttype = '3'
--   and a.RISKCODE = '1303018'
order by a.riskcode desc;


select a.*
from lmrisksort a
where riskcode = '1111003';

select a.*
from LISDATA.LOPRTMANAGER a
where OTHERNO = '5000118351009543';

--体检类型
select */*, subhealthcode*/
from ldhealth
where healthcode = 'PEG007'
-- group by healthcode, healthname, subhealthcode
order by healthcode, subhealthcode;

SELECT * FROM ldhealth WHERE healthcode = 'PEG010';

update ldhealth
set SUBHEALTHCODE = 'PE001#PE002#PE003#PE009#PE016#PE020#PE022#PE023#PE030#PE035#PE010#PE012#PE013#PE014#PE015#PE017#PE018#PE019#PE037#PE038#PE042#PE044#PE045#PE039#PE040#PE007#PE006#PE041#PE046#PE047#PE048#PE011'
where healthcode = 'PEG010';