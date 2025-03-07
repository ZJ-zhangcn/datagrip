/*
契约收费：5000118268710777
生存金自动转账：2025030600001486
红利自动转账：2025030600001486
保全付费：7402121100326485
续期：2026030300000366
个单理赔：3631815101010435
团险理赔：3631815101010479
团险保全定期结算付费:2025022700001186
*/

select SOURCENOTECODE 应,paycode 实,GLVOUCHERNO 凭证号,a.* from LyAtsTranRela a where polno='3631815101010479' order by tranno
select doc_seq_num,status,a.* from cux_gl_interface a where source_batch_id='00000000000000004207';--doc_seq_num
/*
update cux_gl_interface set status = 'P',doc_seq_num=source_batch_id where source_batch_id='00000000000000004207'
*/



select attribute2,
       f.je_category_name                                                                                   凭证类型,
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
       f.segment1                                                                                           公司,
       f.segment2                                                                                           成本中心,
       f.segment4                                                                                           明细,
       f.segment5                                                                                           渠道,
       f.segment6                                                                                           产品,
       f.source_batch_id                                                                                    提账批次号,
       (select acquisitionid
        from fiaboriginaldata
        where aserialno = f.attribute1)                                                                     算法代码
from of_interface f
where lis_contno = '2025030500003586'
order by f.ACCOUNTING_DATE asc, attribute2, f.je_category_name asc, SOURCE_BATCH_ID asc, f.LIS_CONTNO asc,
         f.SEGMENT1 asc,
         f.SEGMENT3 asc, f.SEGMENT4 asc, f.SEGMENT5 asc, f.SEGMENT6 asc, f.ATTRIBUTE15 asc

