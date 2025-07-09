select a.* from ldtask a where TASKDESCRIBE like '%红利%'
select a.* from lccont a where contno='2025060400000216'
select * from ljaget where otherno='2025060400000216';--delete
select leavingmoney,a.* from lcpol a where contno='2025060400000216'
select a.* from LISDATA.LOBONUSPOL a where contno='2025060400000216' order by FISCALYEAR
select * from ljabonusget where contno='2025060400000216' order by ACTUGETNO;--delete
select a.* from lcinsureacc a where contno='2025060400000216'
select * from lcinsureacctrace where contno='2025060400000216' order by SERIALNO;--delete
select a.* from LISDATA.LOPRTMANAGER a where otherno='2025060400000216';

select a.* from LISDATA.LYSENDTOBANK a where polno='2025060400000216';
select a.* from lysendtobankb a where polno='2025060400000216';
select a.* from LISDATA.LYSENDTOBANKB a where polno='2025060400000216';

select IDSTDATE,IDEXPDATE,a.* from lcappnt a where contno='2025060400000216'--9999-01-01

select a.* from LCBonusAutoAccTrace a where contno='2025060400000216'
select a.* from lyreturnfrombankb a where paycode='86310020250370000267'
/*
delete from ljaget where otherno='2025060400000216' and OTHERNOTYPE='7';
update lcpol a set leavingmoney=0 where contno='2025060400000216';
delete from ljabonusget where contno='2025060400000216' and PAYMODE='4';
delete from lcinsureacctrace where contno='2025060400000216' and PAYPLANCODE='IP0274' and MONEYTYPE='LJTF';
update lcinsureacc a set a.insuaccbala=902.81,a.baladate=date'2030-06-05' where contno='2025060400000216' and acctype='004';
update lcinsureaccclass a set a.insuaccbala=902.81,a.baladate=date'2030-06-05' where contno='2025060400000216' and acctype='004';
delete from LCBonusAutoAccTrace a where contno='2025060400000216'
*/

--保单登记
--个人险种表
select AccumDiv,AccumDivInt,AccumDivSI,LstDistriDate,CurrentDivAmnt,a.* from temp_LCProduct a where POLICYNO='2025060400000216';
--红利分配表
select DivDistribMeth,DivAmnt,BankCode,BankName,BankAccNo,AccName,DivAmntDraw,DivDrawDate,a.* from temp_LJDivDistrib a where POLICYNO='2025060400000216' order by DIVYEAR;
--付费明细表
select GetType,a.* from temp_LJAGet a where POLICYNO='2025060400000216';
/*
delete from temp_LCCont where POLICYNO='2025060400000216';
delete from temp_LCInsureAcc where POLICYNO='2025060400000216';
delete from temp_LCInsureAccTrace where POLICYNO='2025060400000216';
delete from temp_LCLiability where POLICYNO='2025060400000216';
delete from temp_LCProdInsuRela where POLICYNO='2025060400000216';
delete from temp_LCProduct where POLICYNO='2025060400000216';
delete from temp_LJLoanRepayment where POLICYNO='2025060400000216';
delete from temp_LJDivDistrib where POLICYNO='2025060400000216';
delete from temp_LCBnf where POLICYNO='2025060400000216';
*/
