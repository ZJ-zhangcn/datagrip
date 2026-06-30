/*
req-3961-关于保单登记平台销售渠道信息数据质量优化的申请
*/

--branchtype  5-网销  8-健康险    0000000031-网销
select agentcom,branchtype,a.* from lacom a where agentcom in ('JK00000001','JK00000006','JKX0000000016','JK00000040','JKX0000000017','0000000031','JK00000016','','');

select a.* from ldcode a where codetype like '%branchtype%';

--许可证有效起止期
select licensestartdate,licenseenddate,a.* from lacom a where a.branchtype = '2' and a.agentcom ='0000000070';

--中介合作协议有效起止期
select cooperationstartdate,cooperationenddate,a.* from lacom a where agentcom = '0000000070';

--团体健康险
select a.* from ldcode a where codetype='prompt';

--配置高端医疗产品
select a.* from ldcode a where codetype = 'healthguardrisk' and code = '2062001';

--保单销售渠道
select
       salechnl, selltype, salechannels,
       a.*
from lccont a where contno='2023122800000286';

select
       salecom, agentcom, signdate,
       a.*
from lccont a where salechannels='010206' and appflag='1' order by a.signdate desc;

--销售渠道配置
select a.* from ldcode a where codetype = 'gsalechannels';

--交易执行脚本
select * from lmcalmode_pripsx where calcode = 'PRIP08';

--第一步
select * from lmcalmode_pripsx where calcode in ( 'HH0001-02','','','','');
--第二步
--lcgrpcont脚本
select * from lmcalmode_pripsx where calcode = 'HH0004-01';

--交易涉及表
select * from ldcodebddj where code = '58';

--报送类型
select * from lmcalmode_pripsx a where calcode like 'PRIP16%';

--temp_lcpoltransaction
select transdate,pushdate,a.* from temp_lcpoltransaction a
where grppolicyno in ('2024062100000126','','','','','')
or policyno in ('', '', '', '');

--temp_lccont
select pushdate,policyno 保单号,grppolicyno 团单号,distribchnl 销售渠道代码,agencycode 代理机构编码,agencyname 代理机构名称,a.*
from temp_lccont a
where --policyno='2024010300000476'
grppolicyno='2024062100000126'
--grppolicyno in ('2024010400000116','2024010400000206','2024010400000396','','','')
--or policyno in ('2024010300000476', '', '', '')
--and agencycode = '5A0120603100000078'
--and agencyname = '上海银行股份有限公司华泾支行'
order by grppolicyno;

--temp_lcgrpcont
select pushdate,grppolicyno 团单号,distribchnl 销售渠道代码,agencycode 代理机构编码,agencyname 代理机构名称,a.*
from temp_lcgrpcont a
where grppolicyno='2024010400000396'
--grppolicyno in ('2023122600002056','2023122600001816','2023122600002506','2023122600002696','2023122600002786','2023122600002876')
order by grppolicyno;

--temp_laagent
select pushdate,policyno 保单号,grppolicyno 团单号,agencycode 代理或经纪机构编码,agencyname 代理或经纪机构名称,agentcode 从业人员编码,name 从业人员姓名,sex 从业人员性别代码,
       birthdate 从业人员出生日期,quafcertno 从业人员资格证书号码,certstartdate 证书开始日期,certenddate 证书结束日期,busidevcertifno 执业证号码,a.*
from temp_laagent a
where --policyno='2024010300000476'
grppolicyno='2024010400000396'
--grppolicyno in ('2024010400000116','2024010400000206','2024010400000396','','','')
or policyno in ('2024010300000476', '', '', '');

--prip_lccont
select distribchnl,a.* from prip_lccont a
where grppolicyno='2023122600002696'
--grppolicyno in ('2023122600002056','2023122600001816','2023122600002506','2023122600002696','2023122600002786','2023122600002876')
or policyno in ('2023122600002326', '2023122600002416', '', '');

--prip_lccont_d  数据上报时未被校验进这个表，校验进prip_lccont表
select distribchnl,a.* from prip_lccont_d a
where policyno='2023122600002416'
--grppolicyno='2023122600002696'
and batchno='000190LINC0000201193'
--grppolicyno in ('2023122600002056','2023122600001816','2023122600002506','2023122600002696','2023122600002786','2023122600002876')
or policyno in ('2023122600002326', '2023122600002416', '', '');

--prip_lcgrpcont
select a.* from prip_lcgrpcont a
where --grppolicyno='2023122600002056'
grppolicyno in ('2023122600002056','2023122600001816','2023122600002506','2023122600002696','2023122600002786','2023122600002876');

--prip_lcgrpcont_d
select a.* from prip_lcgrpcont_d a
where --grppolicyno='2023122600002056'
grppolicyno in ('2023122600002056','2023122600001816','2023122600002506','2023122600002696','2023122600002786','2023122600002876');
--or policyno in ('2023122600002326', '2023122600002416', '', '')


--红利分配表
select a.* from temp_ljdivdistrib a where policyno='2025042500000206';