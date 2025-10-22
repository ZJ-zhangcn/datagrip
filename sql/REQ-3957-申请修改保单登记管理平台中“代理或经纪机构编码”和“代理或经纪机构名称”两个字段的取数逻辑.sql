select salechnl,selltype,salechannels,signdate,agentcode,agentcom,a.* from lccont a where contno='2023122500001266';

select actype,a.* from lacom a where branchtype='2' and sellflag = 'Y'  and state='N';
select a.licensestartdate 许可证,a.licenseenddate,CooperationStartDate 合作协议,CooperationEndDate,a.* from lacom a where agentcom='0000000050';
select * from  ldthreadtask  where status in ('0','1') and prtno='3206915140103016';
select policyno    保单号,
       DistribChnl 销售渠道代码,
       AgencyCode  代理机构编码,
       AgencyName  代理机构名称,
       a.*
  from temp_lccont a
 where --grppolicyno in ('', '', '', '')
 policyno in ('2023122800000786', '', '', '');
   --and AgencyCode = '5A0120603100000078'
   --and AgencyName = '上海银行股份有限公司华泾支行'

select policyno        保单号,
       AgencyCode      代理或经纪机构编码,
       AgencyName      代理或经纪机构名称,
       AgentCode       从业人员编码,
       Name            从业人员姓名,
       Sex             从业人员性别代码,
       BirthDate       从业人员出生日期,
       QuafCertNo      从业人员资格证书号码,
       CertStartDate   证书开始日期,
       CertEndDate     证书结束日期,
       BusiDevCertifNo 执业证号码,
       a.*
  from temp_laagent a
 where policyno in ('2023122800000786', '', '','');

select a.* from temp_ljapay a where a.policyno in ('2023122500001086','2023122500001176','2023122500001266');