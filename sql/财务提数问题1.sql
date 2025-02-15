--测试环境
--1.在页面点击数据采集无误，转换凭证时找不到对应批次
--01.因测试环境时间经常变动问题，所有会出现采集时间和凭证转换时查询时间不一致导致数据不显示(数据已正常采集出来)
  --凭证转换时页面的查询sql，日期取得makedate
  select b.parametervalue,
         a.makedate,
         (select min(m.parametervalue) || '至' || max(m.parametervalue)
            from FIOperationParameter m
           where m.eventno = a.eventno
             and m.parametertype in ('StartDate', 'EndDate')) as datelenth,
         a.operator
    from FIOperationLog a, FIOperationParameter b
   where a.eventno = b.eventno
     and b.EventType = '01'
     and b.parametertype = 'BatchNo'
     and a.PerformState = '0'
     and a.othernomark = '0'
     and a.MakeDate >= to_date('2019-11-06', 'yyyy-mm-dd')
     and a.MakeDate <= to_date('2019-11-06', 'yyyy-mm-dd')
     and not exists (select 1
            from FIOperationParameter c, FIOperationLog v
           where c.eventno = v.eventno
             and v.performstate = '0'
             and c.eventtype = '02'
             and c.parametertype = 'BatchNo'
             and c.parametervalue = b.parametervalue)
     and (select count(1)
            from FIAboriginalData t
           where t.BatchNo = b.parametervalue) > 0;
 --解决方法
 select a.makedate,a.batchno from FIDataDistilledInfo a where a.certificateid = '' and a.bussdate = '';
 --a.certificateid: 数据采集时所选择的凭证类型   a.bussdate：数据采集时所选择的日期
 --batchno: 为批次号  makedate 就是上述页面查询条件里的日期
--02.数据采集页面正常执行，makedate正确的情况下，凭证转出页面无批次
--001.数据已提取
 --解决方法
 select a.batchno from FIDataDistilledInfo a where a.certificateid = '' and a.businessno = '';
 --businessno: 业务主键  收付费/首续期保费/保全收付/理赔收付：ACTUGETNO/GETNOTICENO  生存金：serialno(lcinsureacctrace)
--002.提账时间有误
 --首期保费：签单日和生效日相比较，取较晚的日期
 --保全理赔生存金：取业务表makedate
--2 数据采集报错
 --01.后台报sql执行出错(oracel报错)，
 --解决方法：联系财务开发
 --02.类型为req78201的业务数据数据在生成科目代码为4031的财务数据专项数据信息时出错，
    --原因是专项：00003设置信息为空,业务索引号码为：86010120190320009073
 --提账的某些科目对段值有要求(公司  成本 明细  渠道  产品)，但，因为测试环境配置和数据的问题会导致采集时，报上述错误
 --001.段值配置问题，当前科目可能不需要该段值但是测试环境却配置了
 --解决方案  在预生产查询
 select * from fiassociateditemdef a where a.associatedid = '00005';--段值 预生产
 select * from fiinfofinitemassociated a;
 select c.associatedid
   from fiinfofinitemassociated c
  where c.finitemid in (select a.finitemid
                          from fifinitemdef a
                         where a.itemmaincode like '261101');--结果  预生产
 --若查询出来的结果没有上述的 00003，但dat有则删除该条记录
  delete from fiinfofinitemassociated c
   where c.finitemid in (select a.finitemid
                           from fifinitemdef a
                          where a.itemmaincode like '4031')
   and c.associatedid = '00003'; --dat 删除
 --002.段值配置无误
  --0001.数据本身问题
  select a.distillsql from ficostdataacquisitiondef a where a.acquisitionid = 'req78201';
  --sql美化后将业务索引号码带入执行(业务索引号码为别名是：BusinessNo 的字段) 可注释掉日期
  --select * from FITableColumnDef a;--根据该表查看段值对应的字段是否为空
  --0002.账务sql本身问题
  --sql美化后将业务索引号码带入执行之后，发现没有查询到段值对应的储存字段，请联系开发人员
--3 数据采集提示XXX未定义数据源
  --这种情况下直接联系开发人员
--借贷不平
 --未跑营改增
 --算法缺失
 
暂收账务内关于B段值与Z段值
 
B段值与Z段值的判断方法 get_ItemDetail
 
配置表: finotherdetail  sffflag：1收费、2付费
                                Paymode  收付费方式4或F或9等
                                CALCOM  机构
                                Itemdetai 明细 B或Z等
收费: select * from finotherdetail l where sfflag='1';
 
付费: select * from finotherdetail l where sfflag='2';
注:付费配置中第三方_SX代表手续费配置
 
暂收账务内关于B段值与Z段值
 
B段值与Z段值的判断方法 get_ItemDetail
 
配置表: finotherdetail  sffflag：1收费、2付费
                                Paymode  收付费方式4或F或9等
                                CALCOM  机构
                                Itemdetai 明细 B或Z等
收费: select * from finotherdetail l where sfflag='1';
 
付费: select * from finotherdetail l where sfflag='2';
注:付费配置中第三方_SX代表手续费配置
 
--红冲
FIMoveDataFromGRPToPRO;
 
 
