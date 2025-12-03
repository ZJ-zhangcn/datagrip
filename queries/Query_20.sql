select a.* from lcappnt a where IDNO='110101198001100091';
select a.* from LISDATA.LCINSURED a where IDNO='110101198001100091';

update LCINSURED set idno='110101198001100092' where IDNO='110101198001100091' and insuredno <> '1060099203';

select a.* from LISDATA.LDPERSON a where IDNO='110101198001100091';

update LDPERSON set idno='110101198001100092' where IDNO='110101198001100091' and CUSTOMERNO <> '1060099203';

select * from LCPastContToCustomer b where b.prtno = '5000118351009666';