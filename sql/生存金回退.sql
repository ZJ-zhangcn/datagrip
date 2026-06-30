select a.* from ljaget a where otherno='2026062200000156';
select a.* from ljagetdraw a where contno='2026062200000156' order by MAKEDATE,MAKETIME;
select a.* from LCINSUREACC a where contno='2026062200000156';--baladate  INSUACCBALA
select a.* from LCINSUREACCCLASS a where contno='2026062200000156' order by MAKEDATE,MAKETIME;--baladate  INSUACCBALA
select a.* from LCINSUREACCTRACE a where contno='2026062200000156' order by /*OTHERNO,*/MAKEDATE,MAKETIME;
select a.* from LCINSUREACCFEE a where contno='2026062200000156';
select a.* from LCINSUREACCCLASSFEE a where contno='2026062200000156' order by MAKEDATE,MAKETIME;
select a.* from LCINSUREACCFEETRACE a where contno='2026062200000156' order by OTHERNO,MAKEDATE,MAKETIME;
select a.* from LOPRTMANAGER a where otherno='2026062200000156' order by MAKEDATE,MAKETIME;
select a.* from lcget a where contno='2026062200000156';


delete from ljaget where otherno='2026062200000156';
delete from ljagetdraw where contno='2026062200000156';
delete from LCINSUREACC where contno='2026062200000156' and INSUACCNO='000009';
update LCINSUREACC set baladate=date'2032-04-01',INSUACCBALA='108211.44' where contno='2026062200000156' and INSUACCNO='13030221';
delete from LCINSUREACCCLASS where contno='2026062200000156' and INSUACCNO='000009';
update LCINSUREACCCLASS set baladate=date'2032-04-01',INSUACCBALA='108211.44' where contno='2026062200000156' and INSUACCNO='13030221';
delete from LCINSUREACCTRACE where contno='2026062200000156' and PAYDATE>=date'2032-05-01';
update lcget set SUMMONEY='0.00' where contno='2026062200000156' and GETDUTYCODE='IG2054';