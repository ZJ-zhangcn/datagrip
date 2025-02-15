select paytodate,sumprem,a.*,rowid from lccont a where contno='2024052700000106';
select paytodate,sumprem,a.*,rowid from lcpol a where contno='2024052700000106';
select paytodate,sumprem,paytimes,a.*,rowid from lcprem a where contno='2024052700000106';
select paytodate,sumprem,a.*,rowid from lcduty a where contno='2024072300003656';

select a.*,rowid from ljapay a where otherno='2024052700000106';
select a.*,rowid from ljapayperson a where contno='2024052700000106';

select sumpay,insuaccbala,baladate,a.*,rowid from lcinsureacc a where contno='2024052700000106';
select sumpay,insuaccbala,baladate,a.*,rowid from lcinsureaccclass a where contno='2024052700000106';
select a.*,rowid from lcinsureacctrace a where contno='2024052700000106' order by paydate desc;

select fee/*fee=feetrace表删除续期数据后的总和*/,baladate,a.*,rowid from lcinsureaccfee a where contno='2024052700000106';
select fee,baladate,a.*,rowid from lcinsureaccclassfee a where contno='2024052700000106';
select a.*,rowid from lcinsureaccfeetrace a where contno='2024052700000106' order by paydate desc;


select a.*,rowid from ljaget a where otherno='2024052700000106'
select a.*,rowid from ljagetdraw a where contno='2024052700000106' order by getdate desc;

select a.*,rowid from lccontstate a where contno='2024052700000106'
