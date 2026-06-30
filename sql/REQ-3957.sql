-- id: req-3957
-- 标题: 申请修改保单登记管理平台中“代理或经纪机构编码”和“代理或经纪机构名称”两个字段的取数逻辑

select salechnl,selltype,salechannels,signdate,agentcode,agentcom,a.* from lccont a where contno='2023122500001266';

select actype,a.* from lacom a where branchtype='2' and sellflag = 'Y'  and state='N';

select a.licensestartdate 许可证,a.licenseenddate,cooperationstartdate 合作协议,cooperationenddate,a.* from lacom a where agentcom='0000000050';

select * from  ldthreadtask  where status in ('0','1') and prtno='3206915140103016';

select policyno    保单号,
       distribchnl 销售渠道代码,
       agencycode  代理机构编码,
       agencyname  代理机构名称,
       a.*
  from temp_lccont a
 where --grppolicyno in ('', '', '', '')
 policyno in ('2023122800000786', '', '', '');
   --and agencycode = '5A0120603100000078'
   --and agencyname = '上海银行股份有限公司华泾支行'

select policyno        保单号,
       agencycode      代理或经纪机构编码,
       agencyname      代理或经纪机构名称,
       agentcode       从业人员编码,
       name            从业人员姓名,
       sex             从业人员性别代码,
       birthdate       从业人员出生日期,
       quafcertno      从业人员资格证书号码,
       certstartdate   证书开始日期,
       certenddate     证书结束日期,
       busidevcertifno 执业证号码,
       a.*
  from temp_laagent a
 where policyno in ('2023122800000786', '', '','');

select a.* from temp_ljapay a where a.policyno in ('2023122500001086','2023122500001176','2023122500001266');