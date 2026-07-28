-- id: SC-108
-- 标题: 财务核心系统切换需求

SELECT a.*
FROM LYSENDTOBANK a
WHERE POLNO = '3631815101011555';
SELECT a.*
FROM LYSENDTOBANKB a
WHERE POLNO = '3631815101011555';
SELECT a.*
FROM lyreturnfrombankb a
WHERE POLNO = '3631815101011555';
SELECT a.*
FROM LJAGET a
WHERE OTHERNO = '3631815101011555';
SELECT a.*
FROM LOPRTMANAGER a
WHERE OTHERNO = '3631815101011555';
SELECT a.*
FROM LDTASK a
WHERE TASKDESCRIBE like '%退票%';
SELECT a.*
FROM LDTASK a
WHERE TASKDESCRIBE like '%发盘%';
SELECT a.*
FROM LDTASK a
WHERE TASKDESCRIBE like '%回盘%';
SELECT a.*
FROM LDTASK a
WHERE TASKDESCRIBE like '%柜面代理收付%';
SELECT a.*
FROM LDTASK a
WHERE TASKDESCRIBE like '%短信%';
SELECT a.*
FROM LDTASK a
WHERE TASKDESCRIBE like '%价税分离%';
SELECT a.*
FROM LDTASKPLAN a
WHERE TASKCODE = '000488';

SELECT a.*
FROM LCPOL a
WHERE CONTNO = '2025010300000116';

select buinesstype,
       buinessdate,
       grpcontno,
       contno,
       taxtype,
       money,
       price 价额,
       tax   税额,
       standbyflag1,
       a.*
from ljatax a
where contno = '2025010300000116'
order by a.BUINESSDATE;

/*
DELETE FROM ljatax WHERE contno = '2025010100002026';
*/

SELECT a.*
FROM ficostdataacquisitiondef a
WHERE ACQUISITIONID = 'REQ34510';


SELECT a.*
FROM ficostdataacquisitiondef a
WHERE lower(DISTILLSQL) like lower('select%riskcode%riskcode,%riskcode%riskcode%from');

SELECT a.*
FROM ficostdataacquisitiondef a where DISTILLSQL like '%ZP%'

/*
select makedate, a.*
from FIDataDistilledInfo a where BUSINESSNO='2023022800001496'
*/
/*
00001-公司段
00002-成本中心
00003-渠道-14
00004-险种
00005-明细科目-11

update fiaboriginaldata
set stringinfo11='R0300'
where batchno = '00000000000000004640';

update fiaboriginaldata
set stringinfo14='91302'
where batchno = '00000000000000004640';

*/


select f.je_category_name                                                                                   凭证类型,
       --attribute2,
       f.lis_contno                                                                                         保单号,
       f.lis_prtno                                                                                          投保单号,
       f.accounting_date                                                                                    账务日期,
       f.source_desc                                                                                        业务类别,
       (case
            when f.segment3 like '4031%' then (select finitemname
                                               from fifinitemdef
                                               where itemmaincode = '4031'
                                                 and rownum = 1)
            when f.segment3 like '261101%' then (select finitemname
                                                 from fifinitemdef
                                                 where itemmaincode = '261101'
                                                   and rownum = 1)
            else (select finitemname from fifinitemdef where itemmaincode = f.segment3 and rownum = 1) end) 描述,
       f.segment3                                                                                           核算科目,
       f.attribute15                                                                                        新旧,/*c:新&旧  d:旧  n:新*/
       f.entered_dr                                                                                         借方金额,
       f.entered_cr                                                                                         贷方金额,
       f.segment1                                                                                           机构,
       f.segment2                                                                                           成本中心,
       f.segment4                                                                                           明细,
       f.segment5                                                                                           渠道,
       f.segment6                                                                                           产品,
       f.segment7                                                                                           缴别,
       f.source_batch_id                                                                                    提账批次号,
       (select acquisitionid
        from fiaboriginaldata
        where aserialno = f.attribute1)                                                                     算法代码/*,
       attribute11*/
from of_interface f
where --f.source_batch_id = '00000000000000004327'
--lis_prtno = '3206915150822081'
--       accounting_date = date'2021-08-16'/* and entered_dr='0' and entered_cr='0'*/
lis_contno in ('2025122000000186','')
-- lis_contno in (select contno from lcpol where grpcontno='2023111500000986')
-- and f.segment3 = '54020604'
--lis_caseno='3631815101095847'
order by f.accounting_date asc, f.je_category_name asc, source_batch_id asc, f.lis_contno asc, f.segment1 asc,
         f.segment3 asc, f.segment4 asc, f.segment5 asc, f.segment6 asc, f.attribute15 asc;



/*
update of_interface set segment6='2072030' where segment3='22030103' and source_batch_id='00000000000000001557';
*/

/*
SELECT GRPCONTNO FROM lcpol a WHERE contno='130011003726863';
*/

/*
SELECT accounting_date,a.* FROM of_interface a WHERE je_category_name='MQ_YT' and (select acquisitionid
        from fiaboriginaldata
        where aserialno = a.attribute1)='MQJT025';
*/
