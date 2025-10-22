--支持的保全申请号
select a.* from ldcode a where codetype = 'fubqappno';
select a.* from lcappnt a where contno='2024091400000266'

--冻结轨迹
select a.* from futrace a where contno='2024091400000266' order by to_number(serialno) desc;
--冻结状态支持的保全
select a.* from ldcode a where codetype='fuedortype'

--保全逾期终止批处理   000222   参数：EdorAcceptNo
select a.* from ldtask a where taskdescribe like '%保全逾期终止批处理%';