-- id: req-5024
-- 标题: 达标体检件及达标财务件自动生成函件需求

select healthtype 体检套餐类别,
/*1-累计寿险保额（储蓄）-1303018
2-累计寿险保额（增额）-1116003
3-累计寿险保额（保障）-1111003
4-累计保障型寿险（高净值）-1016007
5-累计储蓄型寿险风险保额（a类）-1306002
6-累计储蓄型寿险风险保额（b类）-1311005
7-累计重大疾病保额-1051020
累计年交保费（年长年金）-1033017*/
       healthcode 体检套餐,
       minage     最小年龄,
       maxage     最大年龄,
       minamnt    最小保额,
       maxamnt    最大保额,
       sex        性别
from ldpenoticepackage a
where healthtype = '7'
order by healthtype, healthcode, minage;

select distinct physicalset, healthname
from lcpenoticeitem a,
     ldhealth b
where a.physicalset = healthcode
  and a.contno = '5000118351203718';

select 150 / 0.2
from dual;

select healthcode from ldpenoticepackage where healthtype = '5' and minage <= 56 and (maxage is null or 56 <=maxage) and minamnt < 2500000 and (2500000 <=maxamnt or maxamnt is null);

select a.*
from lmriskapp a
where riskcode in ('1006001', '1056002', '1056001');

select a.*
from lmriskapp a
where riskname like '%附加投保人豁免保险费重大疾病保险%';--1006001  1056002

select riskcode, riskname
from lmriskapp a
where riskcode in ('1303018', '1116003', '1111003', '1016007', '1306002', '1311005', '1051016', '1033017', '1006001','1111002');

select a.*
from ldtask a
where taskdescribe like '%问题件%';

select a.*
from ldtask a
where taskcode = '000259';

select a.*
from lisdata.tranapp a
where contno = '5000118351009932';

select a.*
from ldriskrule a
where riskcode in ('1303018', '1116003', '1111003', '1016007', '1306002', '1311005', '1051016', '1033017', '1006001')
  and salechnl = '02'
order by a.riskcode, a.salechnl;--1303018

/*
insert into lisdata.ldriskrule (riskcode, salechnl, comgroup, startpolapplydate, endpolapplydate, startscandate,
                                startscantime, endscandate, endscantime, operator, makedate, maketime, modifydate,
                                modifytime)
values ('1033017', '02', '86', date '2024-08-01', null, date '2024-08-01', '0       ', null, null, '1',
        date '2024-08-01', '0       ', date '2024-08-01', '0       ');
*/

select a.*
from lcpol a
where appflag = '1'
  and riskcode in ('1131001', '', '')
  and insuredappage > '70';

--
select a.*
from lmrisksort a
where risksorttype = '2'
  and risksortvalue in ('G1', 'MU', 'MI');

select distinct a.riskcode
from lmriskapp a,
     lmrisksort b
where a.riskcode = b.riskcode
  and riskstyle = '01'
  and exists (select 1 from ldriskrule where riskcode = a.riskcode and salechnl = '02')
  and risksortvalue = '1'
  and b.risksorttype = '3'
--   and a.riskcode = '1303018'
order by a.riskcode desc;


select a.*
from lmrisksort a
where riskcode = '1111003';

select a.*
from lisdata.loprtmanager a
where otherno = '5000118351009543';

--体检类型
select */*, subhealthcode*/
from ldhealth
where healthcode = 'PEG007'
-- group by healthcode, healthname, subhealthcode
order by healthcode, subhealthcode;

select *
from ldhealth
where healthcode = 'PEG010';

/*
update ldhealth
set subhealthcode = 'PE001#PE002#PE003#PE009#PE016#PE020#PE022#PE023#PE030#PE035#PE010#PE012#PE013#PE014#PE015#PE017#PE018#PE019#PE037#PE038#PE042#PE044#PE045#PE039#PE040#PE007#PE006#PE041#PE046#PE047#PE048#PE011'
where healthcode = 'PEG010';
*/
