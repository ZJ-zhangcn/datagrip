select inputoperator,a.* from lccont a where contno='2025061300001786';
select a.* from lwmission a where MISSIONPROP1='2025061300000776';
select STARTDATE,ENDDATE,a.* from lmriskapp a where riskcode='1013015';
select a.* from lcinsured a where contno='2025061300001376';
select AGENTCODE,a.* from lccont a where contno='2025061300001786';
select a.* from LISDATA.LOPRTMANAGER a where otherno='2025061300001786';
select a.* from ljspay a where otherno='2025061300001786';
select a.* from lcmegmode a where SERVICEID in ('Ne1008','Ne1009','Ne1010','Ne1011','Ne1014');
select a.* from ldtask a where TASKDESCRIBE like '%签单%';--000001
select a.* from ldtask a where TASKDESCRIBE like '%交行客户资产回传%';--000639
select a.* from ldtaskplan a where TASKCODE='000639';
select a.* from ldtask a where TASKCLASS='YbtUploadImageTask';--000233
select signdate,a.* from lcpol a where contno='2025061900000556';
select a.* from es_doc_main a where doccode='2025062000000496';
select a.* from es_doc_relation a where doccode='2025062000000496';