select a.* from ljaget a where otherno='2026062200000156';

select a.* from ljagetdraw a where contno='2026062200000156' order by makedate,maketime;

select a.* from lcinsureacc a where contno='2026062200000156';--baladate  insuaccbala

select a.* from lcinsureaccclass a where contno='2026062200000156' order by makedate,maketime;--baladate  insuaccbala

select a.* from lcinsureacctrace a where contno='2026062200000156' order by /*otherno,*/makedate,maketime;

select a.* from lcinsureaccfee a where contno='2026062200000156';

select a.* from lcinsureaccclassfee a where contno='2026062200000156' order by makedate,maketime;

select a.* from lcinsureaccfeetrace a where contno='2026062200000156' order by otherno,makedate,maketime;

select a.* from loprtmanager a where otherno='2026062200000156' order by makedate,maketime;

select a.* from lcget a where contno='2026062200000156';


/*
delete from ljaget where otherno='2026062200000156';

delete from ljagetdraw where contno='2026062200000156';

delete from lcinsureacc where contno='2026062200000156' and insuaccno='000009';

update lcinsureacc set baladate=date'2032-04-01',insuaccbala='108211.44' where contno='2026062200000156' and insuaccno='13030221';

delete from lcinsureaccclass where contno='2026062200000156' and insuaccno='000009';

update lcinsureaccclass set baladate=date'2032-04-01',insuaccbala='108211.44' where contno='2026062200000156' and insuaccno='13030221';

delete from lcinsureacctrace where contno='2026062200000156' and paydate>=date'2032-05-01';

update lcget set summoney='0.00' where contno='2026062200000156' and getdutycode='IG2054';
*/
