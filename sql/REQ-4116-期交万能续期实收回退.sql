--lcpol
select paytodate,a.*,rowid from lcpol a where contno='2024112000000286'
--lccont
select paytodate,a.*,rowid from lccont a where contno='2024112000000286'
--lccontstate
select a.*,rowid from lccontstate a where contno='2024112000000286'
--应收
select a.*,rowid from ljspay a where otherno='2024112000000286'
/*
update ljspay set payform='Y' where otherno='2024112000000286'
*/
select a.*,rowid from lysendtobank a where polno='2024112000000286'
--实收
select getnoticeno,a.*,rowid from ljapay a where incomeno='2024112000000286'
select a.*,rowid from ljapayperson a where contno='2024112000000286'

--
select a.*,rowid from ljagetb a where actugetno='86000020250370015179'

--
select a.*,rowid from ljagetperson a where contno='2024112000000286'

--账户
select a.*,rowid from lcinsureacc a where contno='2024112000000286';--baladate sumpay lastaccbala insuaccbala
select a.*,rowid from lcinsureaccclass a where contno='2024112000000286';--baladate sumpay lastaccbala insuaccbala
select a.*,rowid from lcinsureacctrace a where contno='2024112000000286' order by makedate ,maketime ;--删除续期实收产生的轨迹
select a.*,rowid from LCInsureAccTraceHT a where contno='2024112000000286' order by makedate ,maketime ;
/*
update lcinsureacctrace set makedate=paydate,modifydate=paydate where contno='2024112000000286' and paydate>=date'2025-05-01'
*/

select a.*,rowid from lcinsureaccfee a where contno='2024112000000286';--fee baladate
select a.*,rowid from lcinsureaccclassfee a where contno='2024112000000286';--baladate fee
select a.*,rowid from lcinsureaccfeetrace a where contno='2024112000000286' order by paydate ;
/*
update lcinsureaccfeetrace set makedate=paydate,modifydate=paydate where contno='2024112000000286' and paydate>=date'2025-05-01'
*/

--实收回退备份
select a.*,rowid from lpinsureacc a where contno='2024112000000286' ;--edorno=ljapay.getnoticeno
select a.*,rowid from lpinsureaccclass a where contno='2024112000000286';
select a.*,rowid from lpinsureacctrace a where contno='2024112000000286' order by makedate ,paydate ;--2024102900000886

select a.*,rowid from lpinsureaccfee a where contno='2024112000000286';
select a.*,rowid from lpinsureaccclassfee a where contno='2024112000000286';
select a.*,rowid from lpinsureaccfeetrace a where contno='2024112000000286' order by paydate desc;
