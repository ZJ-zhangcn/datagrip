/*
REQ-3961-关于保单登记平台销售渠道信息数据质量优化的申请
*/

--branchtype  5-网销  8-健康险    0000000031-网销
select agentcom,branchtype,a.* from lacom a where agentcom in ('JK00000001','JK00000006','JKX0000000016','JK00000040','JKX0000000017','0000000031','JK00000016','','')
select a.* from ldcode a where codetype like '%branchtype%'

--许可证有效起止期
select licensestartdate,licenseenddate,a.* from lacom a where a.branchtype = '2' and a.agentcom ='0000000070'

--中介合作协议有效起止期
select CooperationStartDate,CooperationEndDate,a.* from lacom a where agentcom = '0000000070'

--团体健康险
select a.* from ldcode a where codetype='prompt'

--配置高端医疗产品
select a.* from ldcode a where codetype = 'healthguardrisk' and code = '2062001'

--保单销售渠道
select salechnl,selltype,salechannels,a.* from lccont a where contno='2023122800000286'
select salecom,agentcom,signdate,a.* from lccont a where salechannels='010206' and appflag='1' order by a.signdate desc;

--销售渠道配置
select a.* from ldcode a where codetype = 'gsalechannels'

--交易执行脚本
select * from LMCALMODE_PRIPSX where CALCODE = 'PRIP08';--第一步
select * from LMCALMODE_PRIPSX where CALCODE in ( 'HH0001-02','','','',''); --第二步
--LCGrpCont脚本
select * from LMCALMODE_PRIPSX where CALCODE = 'HH0004-01';
--交易涉及表
select * from LDCODEBDDJ where CODE = '58';--报送类型
select * from LMCALMODE_PRIPSX a where calcode like 'PRIP16%'

--TEMP_LCPolTransaction
select TRANSDATE,PUSHDATE,a.* from TEMP_LCPolTransaction a
where grppolicyno in ('2024062100000126','','','','','')
or policyno in ('', '', '', '')

--temp_lccont
select pushdate,policyno 保单号,grppolicyno 团单号,DistribChnl 销售渠道代码,AgencyCode 代理机构编码,AgencyName 代理机构名称,a.*
from temp_lccont a
where --policyno='2024010300000476'
grppolicyno='2024062100000126'
--grppolicyno in ('2024010400000116','2024010400000206','2024010400000396','','','')
--or policyno in ('2024010300000476', '', '', '')
--and AgencyCode = '5A0120603100000078'
--and AgencyName = '上海银行股份有限公司华泾支行'
order by grppolicyno

--Temp_LCGrpCont
select pushdate,grppolicyno 团单号,DistribChnl 销售渠道代码,AgencyCode 代理机构编码,AgencyName 代理机构名称,a.*
from Temp_LCGrpCont a
where grppolicyno='2024010400000396'
--grppolicyno in ('2023122600002056','2023122600001816','2023122600002506','2023122600002696','2023122600002786','2023122600002876')
order by grppolicyno

--temp_laagent
select pushdate,policyno 保单号,grppolicyno 团单号,AgencyCode 代理或经纪机构编码,AgencyName 代理或经纪机构名称,AgentCode 从业人员编码,Name 从业人员姓名,Sex 从业人员性别代码,
       BirthDate 从业人员出生日期,QuafCertNo 从业人员资格证书号码,CertStartDate 证书开始日期,CertEndDate 证书结束日期,BusiDevCertifNo 执业证号码,a.*
from temp_laagent a
where --policyno='2024010300000476'
grppolicyno='2024010400000396'
grppolicyno in ('2024010400000116','2024010400000206','2024010400000396','','','')
or policyno in ('2024010300000476', '', '', '')

--prip_lccont
select DISTRIBCHNL,a.*, rowid from prip_lccont a
where grppolicyno='2023122600002696'
grppolicyno in ('2023122600002056','2023122600001816','2023122600002506','2023122600002696','2023122600002786','2023122600002876')
or policyno in ('2023122600002326', '2023122600002416', '', '')

--prip_lccont_D  数据上报时未被校验进这个表，校验进prip_lccont表
select DISTRIBCHNL,a.*, rowid from prip_lccont_D a
where policyno='2023122600002416'
--grppolicyno='2023122600002696'
and batchno='000190LINC0000201193'
grppolicyno in ('2023122600002056','2023122600001816','2023122600002506','2023122600002696','2023122600002786','2023122600002876')
or policyno in ('2023122600002326', '2023122600002416', '', '')

--prip_LCGrpCont
select a.*, rowid from prip_LCGrpCont a
where --grppolicyno='2023122600002056'
grppolicyno in ('2023122600002056','2023122600001816','2023122600002506','2023122600002696','2023122600002786','2023122600002876')

--prip_LCGrpCont_D
select a.*, rowid from prip_LCGrpCont_D a
where --grppolicyno='2023122600002056'
grppolicyno in ('2023122600002056','2023122600001816','2023122600002506','2023122600002696','2023122600002786','2023122600002876')
--or policyno in ('2023122600002326', '2023122600002416', '', '')


--红利分配表
select a.* from temp_LJDivDistrib a where POLICYNO='2025042500000206'