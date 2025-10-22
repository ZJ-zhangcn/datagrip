--新增配置
select * from ldcode where codetype = 'TerminateMesg';
update lcpol set appflag='4' where contno='2018041200023568';
update lccont set appflag='4' where contno='2018041200023568';
--满期终止批处理提数
select *
  from LCPol a
 where 1 = 1
   and not exists (select 'X'
          from lccontstate
         where enddate is null
           and state = '1'
           and statetype = 'Available'
           and polno = a.polno)
   and not exists
 (select 'X' from lcconthangupstate where contno = a.contno)
   and checkclaim(a.contno) = '0'
   and not exists
 (select 1
          from lccontstate
         where state = '1'
           and startdate <= date '2024-12-04'
           and EndDate is null
           and trim(statetype) = 'Lost'
           and contno = a.contno
           and polno = a.PolNo)
   and not exists
 (select 1
          from lccontstate
         where state = '1'
           and startdate <= date '2024-12-04'
           and EndDate is null
           and trim(statetype) = 'Lost'
           and contno = a.contno
           and polno = '000000')
   and a.AppFlag = '1'
   and a.EndDate <= date'2024-12-04'
   and ManageCom like '86%'
   and a.grpcontno = '00000000000000000000'
 order by contno, polno, mainpolno


select * from sms_dispatch_list a where a.serviceid='Ma1029' and makedate=date'2024-12-04' order by maketime

select requesttime,count(requesttime),sendtime,count(sendtime) from sms_dispatch_list a where a.serviceid='Ma1029' and makedate=date'2024-12-04' group by requesttime,sendtime order by requesttime

select distinct(otherno),requesttime,count(requesttime),sendtime,count(sendtime) from sms_dispatch_list a where a.serviceid='Ma1029' and makedate=date'2024-12-04' group by otherno,requesttime,sendtime order by requesttime


select a.* from sms_dispatch_list a where a.serviceid='Ma1029' and makedate=date'2024-12-04' order by requesttime
select a.* from sms_dispatch_list a where serviceid='Ma1029' and otherno='2018080800001986'

select * from lcmeglog where sendcode in('BQ00047','BQ00048') and makedate=date'2024-12-04';