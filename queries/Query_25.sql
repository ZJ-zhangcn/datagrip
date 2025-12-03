select a.* from ldtask a where TASKDESCRIBE like '%价税分离%';
select a.* from LDTASKPLAN a where TASKCODE='000578';


select min(CVALIDATE),max(CVALIDATE) from lcpol a where APPNTNAME like '%比亚迪%' and appflag='1'