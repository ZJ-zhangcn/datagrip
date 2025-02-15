select a.*,rowid from ldtask a where taskdescribe like '%ÐøÆÚÃ÷Ï¸%' 

select * from YBTInsRenewal order by to_number(SerialNo)
for update;

update YBTInsRenewal set makedate=date'2024-07-10',modifydate=date'2024-07-10'
update YBTInsRenewal set makedate=date'2025-03-05',modifydate=date'2025-03-05' where SERIALNO='4'

select contno,prtno from lcpol a where prtno in (select PROPOSALPRTNO from YBTInsRenewal)

select ContNo,PayPeriod,SerialNo from YBTInsRenewal where funcflag='182' and busitype='XQ' and state='0' and makedate=date '2024-07-09'

select paytodate,a.*,rowid from lcpol a where contno='2023030300001206'

select a.*,rowid from lccontstate a where contno='2023110600000786'

select payform,a.*,rowid from ljspay a where otherno='2023030300001206'

SELECT SYSVARVALUE FROM LDSYSVAR WHERE SYSVAR = 'SHSFtp' for update;--/CallSvc/spdb/
SELECT SYSVARVALUE FROM LDSYSVAR WHERE SYSVAR = 'BDFtp'

select a.*,rowid from lccont a where agentcom like '03%' and payintv='12' and appflag='1' order by contno desc

select contno,prem,amnt,cvalidate,paytodate from lcpol a where prtno in ('2024092500000476','2024031500000106','5000118231130047','5000118231130030')
