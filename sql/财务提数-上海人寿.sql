--财务渠道代码
select *
from ldcode1 a
where a.codetype = 'SaleChnl';

--数据回滚日期
select makedate, a.*
from fiaboriginaldata a
order by batchno desc;

select makedate, a.*
from fiaboriginaldata a
where batchno in ('00000000000000003673','','') order by batchno;

select makedate, a.*
from fiaboriginaldata a
where BUSINESSNO02 = '2026051400000266';

select stringinfo11, stringinfo14, stringinfo05, a.*
from fiaboriginaldata a
where batchno = '00000000000000004399'
  and acquisitionid in ('00000804', '');

/*
update fiaboriginaldata set stringinfo11='R0300' where batchno='00000000000000004402' and acquisitionid in ('req78213','REQ71805','REQ71811','00000804');
update fiaboriginaldata set stringinfo14='91302' where batchno='00000000000000004402' and acquisitionid in ('req78213','REQ71805','REQ71811','00000804');
*/

--enteraccdate:到账日期
select a.*
from ljagetdraw a
where contno = '2023122600000126';

--totalmoney:总额  price：价额  tax：税额
select *
from vms_resp_inoutflow
where contno = '2024022200000396';
select distinct riskcode
from vms_resp_inoutflow
where tax > 0;

--
select *
from ficostdataacquisitiondef
where acquisitionid like '%REQ34514%'
order by acquisitionid;
--算法查询
select a.*
from ficostdataacquisitiondef a
where acquisitionid in
      (select acquisitionid
       from fiaboriginaldata
       where aserialno in (select distinct attribute1
                           from of_interface
                           where je_category_name = 'BQ_YFG'));

--统信校验
select *
from lfcheckfield
where isneedchk = '1'
order by serialno;

--SF_FF\SF_SF提取先修改inbankcode
select inbankcode, inbankaccno, a.*
from ljaget a
where otherno in ('7402121100332428', '3631815101011336', '7402121100332669', '3631815101011385', '7402121100332413',
                  '3631815101011313', '7402121100332486', '3631815101011344', '7402121100332665', '3631815101011377',
                  '7402121100332523', '3631815101011384', '7402121100332506', '3631815101011338', '');

/*
update ljaget
set inbankcode='0101',
    inbankaccno='1202027719900258161'
where otherno in ('7402121100332428', '3631815101011336', '7402121100332669', '3631815101011385', '7402121100332413',
                  '3631815101011313', '7402121100332486', '3631815101011344', '7402121100332665', '3631815101011377',
                  '7402121100332523', '3631815101011384', '7402121100332506', '3631815101011338', '');
*/

--正常收费模拟第三方收费修改bankcode='UnionPay' and bankcode=null
select bankcode,
       bankaccno,
       inbankcode,
       inbankaccno,
       paymode,
       managecom 交费机构,
       policycom 管理机构,
       managecom,
       policycom
from ljtempfeeclass a
where otherno in ('5000118360087332','7402121100332243','3631815101011280','5000118388214111','7402121100332092','3631815101011276','5000118341869548','7402121100332079','3631815101011272','5000118388867918','7402121100332292','3631815101011283');

--拆单收费模拟第三方收费修改inbankcode='UnionPay' and inbankaccno=null
select inbankcode, inbankaccno
from splitcont a
where contno = '2024050700000386';
--拆单收费模拟正常收费修改inbankcode='0116' and inbankaccno='216200100101807734'
select inbankcode, inbankaccno
from splitcont a
where contno = '2024040300000286';
--科目明细
select f.je_category_name                                                                                   凭证类型,
       --attribute2,
       f.lis_contno                                                                                         保单号,
       f.lis_prtno                                                                                          投保单号,
       f.accounting_date                                                                                    账务日期,
       f.source_desc                                                                                        业务类别,
       (case
            when f.SEGMENT3 like '4031%' then (select FINITEMNAME
                                               from fifinitemdef
                                               where ITEMMAINCODE = '4031'
                                                 and rownum = 1)
            when f.SEGMENT3 like '261101%' then (select FINITEMNAME
                                                 from fifinitemdef
                                                 where ITEMMAINCODE = '261101'
                                                   and rownum = 1)
            else (select FINITEMNAME from fifinitemdef where ITEMMAINCODE = f.SEGMENT3 and rownum = 1) end) 描述,
       f.segment3                                                                                           核算科目,
       f.attribute15                                                                                        新旧,/*C:新&旧  D:旧  N:新*/
       f.entered_dr                                                                                         借方金额,
       f.entered_cr                                                                                         贷方金额,
       f.segment1                                                                                           机构,
       f.segment2                                                                                           成本中心,
       f.segment4                                                                                           明细,
       f.segment5                                                                                           渠道,
       f.segment6                                                                                           产品,
       f.segment6                                                                                           缴别,
       f.source_batch_id                                                                                    提账批次号,
       (select acquisitionid
        from fiaboriginaldata
        where aserialno = f.attribute1)                                                                     算法代码/*,
       attribute11*/
from of_interface f
where --f.source_batch_id = '00000000000000004327'
--lis_prtno = '3206915150822081'
--       accounting_date = date'2021-08-16'/* and entered_dr='0' and entered_cr='0'*/
lis_contno in ('2026051500001416','')
-- and f.segment3 = '54020604'
--LIS_CASENO='3631815101095847'
order by f.ACCOUNTING_DATE asc, f.je_category_name asc, SOURCE_BATCH_ID asc, f.LIS_CONTNO asc, f.SEGMENT1 asc,
         f.SEGMENT3 asc, f.SEGMENT4 asc, f.SEGMENT5 asc, f.SEGMENT6 asc, f.ATTRIBUTE15 asc;


select contno from llclaimpolicy a where caseno='3631815101011284';
select contno from lpedoritem a where edoracceptno='7402121100332298';