-- id: req-4705
-- 标题: 交通银行2025年系统改造需求（第1点和第2点）

select inputoperator,a.* from lccont a where contno='2025080100000386';

select a.* from lwmission a where missionprop1='2025080100000386';

select startdate,enddate,a.* from lmriskapp a where riskcode='1303012';

select a.* from lcinsured a where contno='2025080100000386';

select agentcode,a.* from lccont a where contno='2025080100000386';

select a.* from loprtmanager a where otherno='2025080100000386';

select a.* from ljspay a where otherno='2025080100000386';

select a.* from lcmegmode a where serviceid in ('Ne1008','Ne1009','Ne1010','Ne1011','Ne1014');

select a.* from ldtask a where taskdescribe like '%签单%';

--000001
select a.* from ldtask a where taskdescribe like '%交行客户资产回传%';

--000639
select a.* from ldtaskplan a where taskcode='000639';

select a.* from ldtask a where taskclass='YbtUploadImageTask';

--000233
select signdate,a.* from lcpol a where contno='2025080100000516';

select a.* from es_doc_main a where doccode='2025080100000386';

select a.* from es_doc_relation a where doccode='2025080100000386';

select a.* from ldtask a where taskclass in ('YbtGetStockDataTask','YbtGetStockDataMonthTask')

select a.* from ybtgetstockdata a where contno='2025080600000566';