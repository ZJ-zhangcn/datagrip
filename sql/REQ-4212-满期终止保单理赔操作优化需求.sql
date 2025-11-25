/*
累积生息：2024122300000106\2024122300000296\2024122300000476\2024122300000566
自动转账：
*/

--账户
select a.* from lcinsureacc a where contno='2024121100002906';
--baladate sumpay lastaccbala insuaccbala
select a.* from lcinsureaccclass a where contno='2024121100002906';
--baladate sumpay lastaccbala insuaccbala
select a.* from lcinsureacctrace a where contno='2024121100002906' order by otherno,paydate,makedate ,maketime;
--删除续期实收产生的轨迹
select sum(money) from lcinsureacctrace a where contno='2024121100002906' and makedate<=date'2029-11-01'
select 2720+2720+81.82 from dual
select 2720+81.60+84.28 from dual--2885.88
select 81.82+81.60+84.28+round((2720+81.60+84.28)*(date'2028-12-30'-date'2028-12-12')*round(0.06/365,8),2) from dual
/*
update lcinsureacctrace set makedate=paydate,modifydate=paydate where contno='2024121100002906' and paydate between date'2025-01-01' and date'2029-12-01'
*/

select a.* from lcinsureaccfee a where contno='2024121100002906';
--fee baladate
select a.* from lcinsureaccclassfee a where contno='2024121100002906';
--baladate fee
select a.* from lcinsureaccfeetrace a where contno='2024121100002906' order by paydate;
/*
update lcinsureaccfeetrace set makedate=paydate,modifydate=paydate where contno='2024121100002906' and paydate between date'2025-01-01' and date'2029-12-01'
*/

--
select a.* from ljaget a where otherno='7402121100326283';
select a.* from ljagetdraw a where contno='2024121100002906'
--
select a.* from lljagetdraw a where contno='2024121100002906'

--
select a.StateFlag,a.* from loprtmanager a where otherno='2024121100002906'
--
select a.* from loprtmanageclm a where otherno='2024121100002906'

--
select a.* from ldtask a where taskdescribe like '%满期%' 
select a.* from ldtask a where taskclass='EFLongTermUNGetNoticeTask'

--
select a.* from ljaget a where otherno='3631815101010394'

--保单登记
select a.* from temp_lcpoltransaction a where CLAIMNO='3631815101010445';
select polstatus,terminationdate,terminationreason,a.* from temp_lccont a where policyno='2025011000000296';
select status,terminationdate,a.* from temp_lcproduct a where policyno='2025011000000296';
select status,a.* from temp_lcliability a where policyno='2025011000000296';
select insuaccno,accountvalue,a.* from temp_lcinsureacc a where policyno='2025011000000296';
select insuaccno,moneytype,money,claimno,a.* from temp_lcinsureacctrace a where policyno='2025011000000296';
select polstatus,terminationdate,terminationreason,a.* from prip_lccont a where policyno='2025011000000296';
select status,terminationdate,a.* from prip_lcproduct a where policyno='2025011000000296';
select status,a.* from prip_lcliability a where policyno='2025011000000296';
select insuaccno,accountvalue,a.* from prip_lcinsureacc a where policyno='2025011000000296';
select insuaccno,moneytype,money,claimno,a.* from prip_lcinsureacctrace a where policyno='2025011000000296';