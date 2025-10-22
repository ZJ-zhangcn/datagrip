select * from ljaget where otherno='2025072000000106';
--delete
select leavingmoney,a.* from lcpol a where contno='2025072000000106';
/*
update lcpol a set leavingmoney=1540.80 where contno='2025042500000206';
*/
select a.* from LOBONUSPOL a where contno='2025072000000106' order by FISCALYEAR;
select * from ljabonusget where contno='2025072000000106' order by BONUSYEAR;
--delete
select * from lcinsureacctrace where contno='2025072000000106' order by paydate;
--delete
select a.* from LISDATA.LCINSUREACC a where contno='2025072000000106';
select a.* from LISDATA.LCINSUREACCCLASS a where contno='2025072000000106';
/*
update lcinsureacc a set a.insuaccbala=25223.15,a.baladate=date'2031-04-26' where contno='2025072000000106' and acctype='004';
update lcinsureaccclass a set a.insuaccbala=25223.15,a.baladate=date'2031-04-26' where contno='2025072000000106' and acctype='004';
*/

--购买减额交清
select a.* from lcduty a where contno='2025072000000106';
--amnt;