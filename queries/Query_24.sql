select a.* from ljatax a where GRPCONTNO != '00000000000000000000';

select a.* from lysendbill a where orderno in (select ORDERNO from lysendbillorder where contno='2025061100000206');
select a.* from lysendbill a where orderno in (select ORDERNO from lysendbillorder where grpcontno='2025092400000476');
select a.* from lysendbillorder a where contno='2025061100000206';
select a.* from lysendbillorder a where grpcontno='2025092400000476';

alter table LYINVOICINGPARTY modify (bankcode varchar2(400));