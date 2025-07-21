select * from ljaget where otherno='2025071100000466';--delete
select leavingmoney,a.* from lcpol a where contno='2025071100000466';
/*
update lcpol a set leavingmoney=1540.80 where contno='2025042500000206';
*/
select a.* from LOBONUSPOL a where contno='2025071100000466';
select * from ljabonusget where contno='2025071100000466';--delete
select * from lcinsureacctrace where contno='2025071100000466' ;--delete
select a.* from LISDATA.LCINSUREACC a where contno='2025071100000466';
select a.* from LISDATA.LCINSUREACCCLASS a where contno='2025071100000466';
/*
update lcinsureacc a set a.insuaccbala=25223.15,a.baladate=date'2031-04-26' where contno='2025071100000466' and acctype='004';
update lcinsureaccclass a set a.insuaccbala=25223.15,a.baladate=date'2031-04-26' where contno='2025071100000466' and acctype='004';
*/
