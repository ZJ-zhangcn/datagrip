/*
--101日志
tail -f /home/weblogic/Oracle/Middleware/user_projects/domains/rsxcsdomain/bin/nohup.out
*/

select a.*,rowid from ldtask a where taskdescribe like '%保单登记%' 
select a.*,rowid from ldtask a where taskdescribe like '%满期%' 

select a.*,rowid from ldtaskplan a where taskcode='000218' order by taskplancode desc;

select distinct grpcontno from lccont a where grpcontno not like '0000000000000%' and appflag='1' and appntname like '%询价单%' ;

select a.*,rowid from LDGRPUWUSER a where '1718939238000'='1718939238000' and  a.usercode = '001'

--保单登记报送支持的险种
SELECT * FROM  BDDJ_LMPRODUCT where productname like '%团体%' 

select a.*,rowid from lcget a where polno in (select polno from lcpol where riskcode='2022001' and rownum<2)

select distinct GETDUTYCODE from lcget a where grpcontno='2024062100000126'

select a.*,rowid from ljaget a where ACTUGETNO='86000020240370009539'
select a.* from ljagetendorse a where ACTUGETNO='86000020240370009539'

--05-满期
----temp
select a.* from temp_LCPolTransaction a where grppolicyno='2024071700000186';
select PolStatus,PolicyEndDate,TerminationDate,TerminationReason,a.* from temp_LCGrpCont a where grppolicyno='2024071700000186';
select InvalidDate,Status,a.* from temp_LCGrpProduct a where grppolicyno='2024071700000186';
select GrpPolicyNo,PolicyNo,GPFlag,PolStatus,PolicyEndDate,TerminationDate,TerminationReason,a.* from temp_LCCont a where grppolicyno='2024071700000186';
select GrpPolicyNo,PolicyNo,GPFlag,InvalidDate,Status,TerminationDate,a.* from temp_LCProduct a where grppolicyno='2024071700000186';
select GrpPolicyNo,PolicyNo,GPFlag,a.* from temp_LCProdInsuRela a where grppolicyno='2024071700000186';
select GrpPolicyNo,PolicyNo,GPFlag,InvalidDate,Status,a.* from temp_LCLiability a where grppolicyno='2024071700000186';
select GrpPolicyNo,PolicyNo,GPFlag,a.* from temp_LCBnf a where grppolicyno='2024071700000186';
----prip
select a.* from prip_LCPolTransaction a where grppolicyno='2024071700000186';
select PolStatus,PolicyEndDate,TerminationDate,TerminationReason,a.* from prip_LCGrpCont a where grppolicyno='2024071700000186';
select InvalidDate,Status,a.* from prip_LCGrpProduct a where grppolicyno='2024071700000186';
select GrpPolicyNo,PolicyNo,GPFlag,PolStatus,PolicyEndDate,TerminationDate,TerminationReason,a.* from prip_LCCont a where grppolicyno='2024071700000186';
select GrpPolicyNo,PolicyNo,GPFlag,InvalidDate,Status,TerminationDate,a.* from prip_LCProduct a where grppolicyno='2024071700000186';
select GrpPolicyNo,PolicyNo,GPFlag,a.* from prip_LCProdInsuRela a where grppolicyno='2024071700000186';
select GrpPolicyNo,PolicyNo,GPFlag,InvalidDate,Status,a.* from prip_LCLiability a where grppolicyno='2024071700000186';
select GrpPolicyNo,PolicyNo,GPFlag,a.* from prip_LCBnf a where grppolicyno='2024071700000186';

--76-保全补退费
----temp
select a.*,rowid from temp_LCPolTransaction a where grppolicyno='2024071700000186';
select a.*,rowid from temp_LJAGetEndorse a where grppolicyno='2024071700000186';
----prip
select a.*,rowid from prip_LCPolTransaction a where grppolicyno='2024071700000186';
select a.*,rowid from prip_LJAGetEndorse a where grppolicyno='2024071700000186';


--85-其他保全类型
----temp
select a.* from temp_LCPolTransaction a where grppolicyno='2024071700000186';
select a.* from temp_LCGrpCont a where grppolicyno='2024071700000186';
select a.* from temp_LCGrpProduct a where grppolicyno='2024071700000186';
select GrpPolicyNo,PolicyNo,GPFlag,Premium,SumInsured,CashValue,AccumPremium,PolicyEndDate,a.* from temp_LCCont a where grppolicyno='2024071700000186';
select GrpPolicyNo,GrpProductNo,PolicyNo,GPFlag,ProductNo,a.* from temp_LCProdInsuRela a where grppolicyno='2024071700000186';
select GrpPolicyNo,PolicyNo,ProductNo,GPFlag,EffDate,InvalidDate,Premium,AccumPremium,BasicSumInsured,CashValue,SurrenderAmnt,Status,a.* from temp_LCProduct a 
where grppolicyno='2024071700000186';
select GrpPolicyNo,PolicyNo,ProductNo,GPFlag,LiabilityCode,LiabilityName,EffDate,InvalidDate,Status,a.* from temp_LCLiability a where grppolicyno='2024071700000186';
select a.* from temp_LCBnf a where grppolicyno='2024071700000186';
select a.* from temp_LCInsureAcc a where grppolicyno='2024071700000186';
select a.* from temp_LCInsureAccTrace a where grppolicyno='2024071700000186';
select a.* from temp_LJAPayGrp a where grppolicyno='2024071700000186';
select a.* from temp_LJAPay a where grppolicyno='2024071700000186';
----prip
select a.* from prip_LCPolTransaction a where grppolicyno='2024071700000186';
select a.* from prip_LCGrpCont a where grppolicyno='2024071700000186';
select a.* from prip_LCGrpProduct a where grppolicyno='2024071700000186';
select GrpPolicyNo,PolicyNo,GPFlag,Premium,SumInsured,CashValue,AccumPremium,PolicyEndDate,a.* from prip_LCCont a where grppolicyno='2024071700000186';
select GrpPolicyNo,GrpProductNo,PolicyNo,GPFlag,ProductNo,a.* from prip_LCProdInsuRela a where grppolicyno='2024071700000186';
select GrpPolicyNo,PolicyNo,ProductNo,GPFlag,EffDate,InvalidDate,Premium,AccumPremium,BasicSumInsured,CashValue,SurrenderAmnt,Status,a.* from prip_LCProduct a 
where grppolicyno='2024071700000186';
select GrpPolicyNo,PolicyNo,ProductNo,GPFlag,LiabilityCode,LiabilityName,EffDate,InvalidDate,Status,a.* from prip_LCLiability a where grppolicyno='2024071700000186';
select a.* from prip_LCBnf a where grppolicyno='2024071700000186';
select a.* from prip_LCInsureAcc a where grppolicyno='2024071700000186';
select a.* from prip_LCInsureAccTrace a where grppolicyno='2024071700000186';
select a.* from prip_LJAPayGrp a where grppolicyno='2024071700000186';
select a.* from prip_LJAPay a where grppolicyno='2024071700000186';



--54-定期结算方式变更
----temp
select pushdate,a.* from temp_LCPolTransaction a where grppolicyno='2024071700000186';
select RegularClearingFlag,RegularClearing,PremiumDueDate,a.* from temp_LCGrpCont a where grppolicyno='2024071700000186';
select a.* from temp_LCGrpProduct a where grppolicyno='2024062100000126';
----prip
select a.* from prip_LCPolTransaction a where grppolicyno='2024071700000186';
select RegularClearingFlag,RegularClearing,PremiumDueDate,a.* from prip_LCGrpCont a where grppolicyno='2024071700000186';
select a.* from prip_LCGrpProduct a where grppolicyno='2024062100000126';


--31-退保
select pushdate,a.* from temp_LCPolTransaction a where grppolicyno='2024071700000186';
