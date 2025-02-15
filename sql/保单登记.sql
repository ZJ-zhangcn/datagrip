select a.*, rowid
  from prip_lcpoltransaction a
 where grppolicyno in ('2023122600002056',
                       '2023122600001816',
                       '2023122600002506',
                       '2023122600002696')
    or policyno in ('2023122600002326', '2023122600002416', '', '')

select * from prip_lcpoltransaction_d t where t.gpflag='02' and t.busstype='03'
t.transactionno='000190201810161000000001';
select * from prip_
----核心批处理PripCashValueTask
1、数据提取----
select pushdate,a.* from temp_lcpoltransaction a where policyno in ('2023122500001086','2023122500001176','2023122500001266')
for update 
select * from temp_TEMP_LCLIABILITY
select * from temp_ljapay
2、现价计算
select * from lis.lmcalmode_pripsx;
select * from lisdata.LDCODEBDDJ where code= '02' 
select * from lis.ldcodebddj where code='55';
---算法表
select * from lisdata.lmcalmode_pripsx where CALCODE ='HH0022-03'
cal_chk
3、保单登记平台上报，
select * from prip_lcpoltransaction where txtstatus='2';--校验不通过

select * from prip_checkfield a where a.errormsg like '%保单交易表中“交易类型所对应业务代码”为“500-保全”%'---上报时校验的规则

select * from errorinfo;---错误数据存储

select * from ljaget where otherno='7402121100320629';

核心批处理提数，


--承保交易执行脚本
select * from LMCALMODE_PRIPSX where CALCODE = 'PRIP02';--第一步
select * from LMCALMODE_PRIPSX where CALCODE in ( 'HH0001-01','HH0001-02','HH0001-04','HH0023-01','HH0023-02'); --第二步

select * from LMCALMODE_PRIPSX where CALCODE = 'HH0006-01';

--承保涉及表
select * from LDCODEBDDJ where CODE = '05';
select * from LMCALMODE_PRIPSX
