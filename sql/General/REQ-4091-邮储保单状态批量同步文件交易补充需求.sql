/*
邮储现价查询及回盘流程：
  1、银保通页面执行批处理d26-保单状态批量同步发盘
    (1)执行该批处理前需造发盘文件
      a、发盘文件路径（银保通服务器）：/data/app/FileContent/BankFile/psbc/piliang/in/{YYYYMMDD}/{%}.gz
      b、发盘文件格式参照接口文档
    (2)预期结果
      生成文件路径（银保通服务器）：
    SELECT SYSVARVALUE FROM LDSYSVAR WHERE SYSVAR = 'YCsftp-down'--/data/app/FileContent/BankFile/psbc/SvcOut/
  2、核心执行邮储批量现价查询单号存储批处理
    (1)批处理执行类：YBTCashContnoSaveTask
    (2)参数：无，直接执行，日期为当前系统日期当日
    (3)预期结果
      a、先从第1步生成文件中下载文件至核心服务器解析
        下载文件存储路径（核心服务器）：
      SELECT a.sysvarvalue FROM ldsysvar a where a.sysvar = 'YCsftp-local'--/data/lis/xerox/runTimeFile/psbc
      b、文件解析成功后数据存储表生成文件中保单数据(flag='0'、fliename='第1步生成文件保单所在文件名')：
    select a.* from YBTCashValueBack a where trandate=date'2024-05-16'
        注：此时表中status、insuendate字段值为空
      c、删除核心服务器a步的解析文件
  3、核心执行邮储批量现价查询及数据上传批处理
    (1)批处理执行类：YBTCashContnoBackTask
      select a.* from ldtask a where taskclass='YBTCashContnoBackTask'
    (2)参数：无，直接执行，日期为当前系统日期当日
    (3)预期结果
      a、批处理执行过程中flag由0变为1，且YBTCashValueBack表中status、insuendate、prem、cashvalue字段置值(由0变为1的过程数据量较小时很快，较大时不清楚)
      b、flag由1变为2后，生成返回文件至银保通服务器（返回文件可参照REQ-4091需求中模板）：/data/app/FileContent/BankFile/psbc/SvcOut/{}_167_outSvc/
  4、银保通页面执行批处理d27-保单状态批量同步回盘上传
    预期结果
      a、生成回盘文件（银保通服务器）：/data/app/FileContent/BankFile/psbc/piliang/out/{YYYYMMDD}/
至此邮储现价查询及回盘流程结束
*/

select a.*
  from lccont a
 where agentcom like '06%'
   and appflag = '1'
   and not exists
 (select 1 from lcconthangupstate where contno = a.contno)
   and not exists (select 1 from lpedoritem where contno = a.contno) and
       cvalidate between date '2018-01-01' and date
 '2024-05-15'
   and rownum < 101
   and not exists (select 1 from YBTCashValueBack where contno=a.contno)

--Terminate-终止状态\Available-失效状态\DefedPay-缓交状态
select a.* from ldcode a where codetype = 'contstatetype'
--
select appflag,a.* from lccont a where contno='2024040400000156'
--
select a.contno
  from lccont a, lccontstate b
 where a.contno = b.contno
   and a.appflag = '4'
   and b.statetype = 'Terminate'
   and b.state = '1'
   and startdate between date '2024-01-01' and date '2024-04-15'
--
select a.* from YBTCashValueBack a where contno in ('2024040300000286','2024040300000326','2022112200001156','2022031000008986','2024040400000156');