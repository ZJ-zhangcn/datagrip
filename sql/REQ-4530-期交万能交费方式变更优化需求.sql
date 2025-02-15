--批处理逻辑
select *
  from lccont a
 where a.conttype = '1'
   and a.appflag = '1'
   and a.signdate < date '"+tParamCalDate+"'
   and exists (select 1
          from lcpol
         where contno = a.contno
           and kindcode = 'U'
           and payintv <> '0')
   and not exists
 (select 1 from xqpaychangeinfo where contno = a.contno)


select signdate,cvalidate,a.*, rowid
  from lcpol a
 where appflag = '1'
   and riskcode = '1303012'
   and not exists
 (select 1 from xqpaychangeinfo where contno = a.contno)
   and not exists (select 1
          from lccontstate
         where statetype = 'DefedPay'
           and enddate is null
           and contno = a.contno)
   and contno in ('2024102900000386',
                  '2024102900000476',
                  '2024102900000566',
                  '2024102900000656',
                  '2024102900000886',
                  '2024102900000926')

select a.*, rowid
  from xqpaychangeinfo a
 where contno in ('2024102900000386',
                  '2024102900000476',
                  '2024102900000566',
                  '2024102900000656',
                  '2024102900000886',
                  '2024102900000926')
 order by contno

--续期相关短信
select a.*,rowid from lcmeglog a where otherno='2024102900000476'
--查短信编码  serivceid
select * from lisdata.lcmegrelation WHERE sendcode='XQ00024';

select a.*,rowid from ldtask a where taskdescribe like '%续期%短信%' 
select a.*,rowid from ldtask a where taskclass like '%MessagesSend%'

select a.*,rowid from lcaddress a,lcappnt b where a.customerno= 
