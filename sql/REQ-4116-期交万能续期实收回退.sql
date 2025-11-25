--lcpol
select paytodate,a.* from lcpol a where contno='2024112000000286'
--lccont
select paytodate,a.* from lccont a where contno='2024112000000286'
--lccontstate
select a.* from lccontstate a where contno='2024112000000286'
--应收
select a.* from ljspay a where otherno='2024112000000286'
/*
update ljspay set payform='Y' where otherno='2024112000000286'
*/
select a.* from lysendtobank a where polno='2024112000000286'
--实收
select getnoticeno,a.* from ljapay a where incomeno='2024112000000286'
select a.* from ljapayperson a where contno='2024112000000286'

--
select a.* from ljagetb a where actugetno='86000020250370015179'

--
select a.* from ljagetperson a where contno='2024112000000286'

--账户
select a.* from lcinsureacc a where contno='2024112000000286';
--baladate sumpay lastaccbala insuaccbala
select a.* from lcinsureaccclass a where contno='2024112000000286';
--baladate sumpay lastaccbala insuaccbala
select a.* from lcinsureacctrace a where contno='2024112000000286' order by makedate ,maketime;
--删除续期实收产生的轨迹
select a.* from LCInsureAccTraceHT a where contno='2024112000000286' order by makedate ,maketime;
/*
update lcinsureacctrace set makedate=paydate,modifydate=paydate where contno='2024112000000286' and paydate>=date'2025-05-01'
*/

select a.* from lcinsureaccfee a where contno='2024112000000286';
--fee baladate
select a.* from lcinsureaccclassfee a where contno='2024112000000286';
--baladate fee
select a.* from lcinsureaccfeetrace a where contno='2024112000000286' order by paydate;
/*
update lcinsureaccfeetrace set makedate=paydate,modifydate=paydate where contno='2024112000000286' and paydate>=date'2025-05-01'
*/

--实收回退备份
select a.* from lpinsureacc a where contno='2024112000000286';
--edorno=ljapay.getnoticeno
select a.* from lpinsureaccclass a where contno='2024112000000286';
select a.* from lpinsureacctrace a where contno='2024112000000286' order by makedate ,paydate;
--2024102900000886

select a.* from lpinsureaccfee a where contno='2024112000000286';
select a.* from lpinsureaccclassfee a where contno='2024112000000286';
select a.* from lpinsureaccfeetrace a where contno='2024112000000286' order by paydate desc;