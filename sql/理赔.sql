-------- 16.68环境IPAI理赔测试 
-- 流程：立案受理（单证录入、受益人录入）---审核管理（匹配理算、豁免处理、合同状态处理、保单结算、受益人分配）---审批管理（换人）
select * from lktransstatus where bankcode='07' and transdate=date'2014-01-01' and proposalno='0658745692' order by transtime desc;---查询电销导入被什么核保规则卡住
select * from lccont where contno='0000000365861666';
----查询保单状态（STATE字段301代表失效，302代表有效）
select * from lcpol where contno='280000353606';
----查询保单状态（APPFLAG字段0.1.2代表有效，4代表无效）
-------- 17.91环境ULGL理赔测试
select * from LMInsuAccRate where riskcode ='ULGL11';
-----此险种每个月的利率
select * from LMInsuAccRate where riskcode ='BULG11';
select * from LMAccGuratRate where riskcode ='ULGL11';
-----查看此险种的最低保证利率
select * from lcinsureacc where contno ='280000369806';
----查询上一次的账户价值【LASTACCBALA】和下一次的账户价值【INSUACCBALA】
select * from lcinsureacctrace where contno ='290000303860';----查询保费、管理费之类的费用
select * from lcpol where riskcode='ULGL11';---查看此险种所有保单
select * from lddisease where showflag ='Y';

-- 前提条件：
-- 1、保单险种有对应的责任
-- 2、保单做到客户回执（单证回执回销）:单证管理-机打单证-单证回收
-- 3、事故日期要在保障期间内
-- 流程：
-- 受理登记（单证录入、受益人录入）---审核管理（匹配理算、豁免处理、合同状态处理、保单结算、受益人分配）---审批管理（换人）
-- 注意：审核要进行理赔任务分配才能查到
-- 医疗单证在呈报处理-录入修改里面录入

-----主要表结构
select * from llquickclaimrisk where riskcode='1031007';
---判断团险批量受理还是普通受理，表里有值为批量受理
select * from lmdutygetclm where getdutycode in (select getdutycode from lmdutygetrela where
dutycode in (select dutycode from lmriskduty where riskcode = '2062014'));
select * from lmriskduty where riskcode  in('2072004');
select * from lmduty where dutycode  in('ID0303','ID0304');
select * from lmrisk;
select a.riskcode,c.riskname,b.* from lmriskduty a,lmdutygetrela b ,lmrisk c
where a.dutycode=b.dutycode and a.riskcode=c.riskcode and b.getdutyname like'%门诊%';
select * from lmcalmode where calcode ='IG0693';
select * from lcduty where contno='2023060600000676';
select * from lmdutyget where getdutycode in('IG0525');
---责任给付
select * from lmdutygetrela where dutycode in('GD0106');
---责任给付关联
select * from lmdutygetclm where getdutykind like'%09%';
---责任给付赔付
select * from lmdutygetalive where getdutycode in('IG0775');
----责任给付生存
select * from lisdata.ldcode where codetype ='getdutykind';
---理赔类型（lmdutygetclm.getdutykind )
select * from LMRiskClaimFeeLimit where riskcode='1066008';
---医疗费用限额limittype是0，不限制1限额2限次

select * from LLCaseRela;
SELECT * from LLReport where RPTNO='3631815101009649';
---个人报案表
select t.dutycode,t.getendstate,t.* from lcget t where contno='2021102800000386';-----保单责任
select rgtdate,accdate,deathdate,endcasedate,t.*  from llcase t where caseno='3631815101009649';--出险信息（受理日期、出险日期、死亡日期、结案日期）、出险人信息、账户信息等
select t.clmstate,t.endcasedate,t.* from llclaim t where
 caseno in('3631815101009649');---（案件状态、赔付金额等）
 select * from LLReportApply where contno='2024101000000286';
select t.endcasedate,t.* from llregister t where
  rgtno in('3631815101007831');
select * from lisdata.ldcode where codetype like'%clmstate%';
select t.contno,t.* from LLClaimDetail t where caseno='3631815101007831';
----赔付明细
select * from LLAccident where makedate=date'2015-10-27';
-----事件（事故发生日期，1 意外 2 疾病）
select * from llcasereceipt where caseno='3631815101009779';
----单证信息（费用项目类型，费用项目，金额等）
select * from Llclaimlimit where caseno='3631815101009779';
----览海医疗
select * from llappclaimreason where caseno='3631815101009553';----reasoncode(理赔类型)
select t.endcasedate,t.* from llclaimpolicy t where caseno in('3631815101009553');
-------赔案保单明细
select * from lccontstate where contno='290000322515';
---(Available: 0-有效 1-失效 （险种状态）
select GetMoney,
       BnfNo,
       CasePayMode,
       BankCode,
       BankAccNo,
       AccName,
       RelationToInsured
  from LLBnf
 where 1 = 1
   and payeename = '总四九'
   and ClmNo = '3631815101007875';
-- Terminate: 0-未终止 1-终止 （险种状态）

select t.OPConfirmDate,t.confdate,t.* from LJAGetClaim t where contno='290000324315';
----赔付实付表 （给付日期，confdate财务确认日期）
select * from LLBalance;
---理赔结算表（保单结算、合同处理、理赔金）
select * from ljaget where makedate=date'2015-10-27';
select * from ljsget where agentcode='T005892040';
-- 理赔保全相关注意点：
-- 1、正在审理中的案件所关联的保单不允许做保全申请（即理赔挂起）
-- 2、正在进行保全处理的保单不许被关联进行理算操作
-- 3、出险日后发生过影响保障的保全项目的保单，在案件理算时应以出险时刻的保障内容为准（如万能险在出险日后做了部分领取，再去理赔身故、账户价值已经做了变动）
-- 4、身故日期等于事故发生日期，系统目前处理身故理赔时

select t.dutycode,t.getendstate,t.* from lcget t where contno='2020011500004696';
----getendstate = '1''标示责任已终止。
select * from LMDutyGetFeeRela where getdutycode like 'WLFL00%';
--- CLMFEECODE like'A%'的是门诊， CLMFEECODE like'B%'的是住院，住院产品只要配置B的账单类型

select * from lmdutygetclm where getdutykind like '%05' or getdutykind like '%07';
----05的是特种疾病，07是生命末期
---理赔表结构生成流程：
-- 保存出险人及申请人信息时，llcase表会产生数据，受理日期取系统日期，事故日期取录入的日期，身故日期为空，受理状态20
-- 40

-- 进入审批的规则补充(LLClaimUWMainConfirmBL)：
-- 1、	代理人被稽核
-- 2、	曾发起调查
-- 3、	曾发起二核
-- 4、	事故人在黑名单中
-- 5、	案件类型为“反弹案件”15 llregister rgtstate
-- 6、	案件类型为“通融案件”14
-- 7、	案件类型为“申诉案件”13
-- 8、	案件类型为“诉讼案件”12
-- 9、	审核结论为拒赔
-- 10、	对合同状态进行了修改
-- 11、	审核人在岗状态新人在岗
-- 12、	含身故、高残、伤残、重疾、豁免理赔类型
-- 13、	给付金额超过审核人员的权限
-- 14、	最终核赔金额+拒赔金额-年度红利>5000
-- 15、	延滞息金额>0

---理赔状态

select * from lwmission t where
activityid in ('0000005015','0000005035','0000005055' , '0000005075')
and t.modifydate=date'2021-07-20';
----(activityid值对应的理赔状态)
select * from lwmission t where t.missionprop1='3631815101006579';

    select a.riskcode,b.riskname,a.cvalidate,a.* from lcpol a,lmrisk b where a.riskcode=b.riskcode and a.insuredno='1002797463';
select * from lcduty where contno='130310000077571';
select a.getdutycode,b.getdutyname,a.* from lcget a,lmdutygetrela b  where a.dutycode=b.dutycode and a. contno='130310000077571';
select t.* from lmdutygetclm t where getdutycode in (select getdutycode from lmdutygetrela where
dutycode in (select dutycode from lmriskduty a where a.riskcode in
('2022001','2052002','2062007','2072001','2062006')
)
);
select * from LLQUICKCLAIMRISK where riskcode='2062008';
---团险微信理赔限额;
