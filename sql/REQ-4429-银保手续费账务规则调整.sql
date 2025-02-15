/*
5000118241219014\2030010100000376：首期趸交
5000118241219021\2030010100000466：期交首期
*/

--
select a.*,rowid from ldtask a where taskdescribe like '%财务自动提数批处理%' --StartDate\EndDate\CertificateID:SXF
select a.*,rowid from ldtask a where taskdescribe like '%手续费%' 

--
select a.codename,a.codealias from ldcode1 a where codetype ='SXFemail' and a.code='DSH' and a.code1='3'
select a.codename,a.codealias from ldcode1 a where codetype ='FLPassemail' and a.code='FLPass' and a.code1='3';

/*
0-空、1-差异项、2-加扣款、3-待审核、4-加扣款待审核、5-差异项待审核、6-已审核、7-加扣款已审核、8-差异项已审核
9-已结算、10-加扣款已结算、11-差异项已结算、12-审核不通过、13-重复项、14-待结算
*/
select a.*,rowid from FMCalculatePrem a order by modifydate desc; 
select state,AuditDate,paycount,a.*,rowid from FMCalculatePrem a where contno in ('','2030010100000686') and batchno like 'YB203102041%' order by contno,commisionsn

--科目明细
select f.source_batch_id 提账批次号,
       f.je_category_name 凭证类型,
       f.lis_contno 保单号,
       f.lis_prtno 投保单号,
       f.accounting_date 账务日期,
       f.source_desc 业务类别,
       f.line_desc 描述,
       f.attribute15 新旧, /*C:新&旧  D:旧  N:新*/
       f.entered_dr 借方金额,
       f.entered_cr 贷方金额,
       f.segment1 公司,
       f.segment2 成本中心,
       f.segment3 核算科目,
       f.segment4 明细,
       f.segment5 渠道,
       f.segment6 产品,
       (select acquisitionid
          from fiaboriginaldata
         where aserialno = f.attribute1) 算法代码
  from of_interface f
 where --je_category_name = 'XQ_ZT'
 lis_contno = '2030010100000686'
--and f.source_batch_id = '00000000000000003895'
--and accounting_date=date'2025-11-16'
 order by accounting_date, source_desc, line_desc, segment3
