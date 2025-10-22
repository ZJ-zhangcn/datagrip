--投保人
select a.contno, a.idno, b.state, b.riskgrade, b.clientno
  from lcappnt a, fxdj.cr_client b, lcpol c
 where a.contno = c.contno
   and a.appntname = b.name
   and a.appntsex = b.sex
   and a.appntbirthday = b.birthday
   and a.idtype = b.cardtype
   and a.idno = b.cardid
   and a.contno in ('2024111400000486','')
   and b.state in ('05', '06')
   and b.riskgrade in ('3', '4')
   and c.appflag = '1'
   and c.grpcontno = '00000000000000000000'
   --and a.relationtoappnt = '00'
 order by c.cvalidate desc

--被保人
select a.contno, a.idno, b.state, b.riskgrade, b.clientno
  from lcinsured a, fxdj.cr_client b, lcpol c
 where a.contno = c.contno
   and a.name = b.name
   and a.sex = b.sex
   and a.birthday = b.birthday
   and a.idtype = b.cardtype
   and a.idno = b.cardid
   and a.contno in ('2024111400000486','')
   and b.state in ('05', '06')
   and b.riskgrade in ('3', '4')
   --and c.appflag = '1'
   and c.grpcontno = '00000000000000000000'
   --and a.relationtoappnt = '00'
 order by c.cvalidate desc

/*
较高风险：
高风险：2022032900000416
*/

select lc.* from lcpol lc where contno='2025091500002026'

select a.appntname,a.appntbirthday,a.idtype,a.idno,a.appntsex,b.mobile,idstdate,idexpdate from lcappnt a,lcaddress b 
where a.appntno=b.customerno and a.addressno=b.addressno and a.contno='2022032900000416'

select name,birthday,idtype,idno,a.* from lcinsured a where contno='2022032900000416'

select state,riskgrade,a.* from fxdj.cr_client a where clientno = '6666666703';
select state,riskgrade,a.* from fxdj.cr_client a where clientno = '6666700005';
select a.* from fxdj.cr_client a where CARDID = '310107199205040131';
select a.* from ldcode a where codetype like '%riskgrade%';
INSERT INTO FXDJ.CR_CLIENT (CLIENTNO, SOURCE, NAME, BIRTHDAY, AGE, SEX, GRADE, CARDTYPE, CARDID, CARDEXPIREDATE,
                            CLIENTTYPE, WORKPHONE, FAMILYPHONE, TELEPHONE, OCCUPATION, BUSINESSTYPE, INCOME, GRPNAME,
                            ADDRESS, OTHERCLIENTINFO, ZIPCODE, NATIONALITY, PROVINCE, COMCODE, CONTTYPE,
                            BUSINESSLICENSENO, ORGCOMCODE, TAXREGISTCERTNO, BUSINESSSOURCE, LEGALPERSON,
                            LEGALPERSONCARDTYPE, LEGALPERSONCARDID, LINKMAN, COMREGISTAREA, COMREGISTTYPE,
                            COMBUSINESSAREA, COMBUSINESSSCOPE, APPNTNUM, COMSTAFFSIZE, AMLISCOUNT, AMLIHCOUNT,
                            AMLISREPORTCOUNT, AMLIHREPORTCOUNT, GRPNATURE, FOUNDDATE, HOLDERKEY, HOLDERNAME,
                            HOLDERCARDTYPE, HOLDERCARDID, HOLDEROCCUPATION, HOLDERRADIO, HOLDEROTHERINFO, RELARISKTIP,
                            ISEXCEPTION, ISCOMPLETED, EXCEPTIONCODE, FIRSTAUDITOR, SECONDAUDITOR, THIRDAUDITOR,
                            GRADEWAY, RISKSCORE, RISKGRADE, STATE, REMARK, DEALTIME, NEXTAUDITDATE, OPER, MAKEDATE,
                            MAKETIME)
VALUES ('1111111110', '1', '少一', DATE '1992-05-04', null, '0', null, '1', '310107199205040131', null, null, null, null, null,
        null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null,
        null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null,
        null, null, null, null, null, null, null, null, null, null, null, '4', '05', null, DATE '2022-05-01', null,
        null, null, null);
insert into fxdj.cr_client (CLIENTNO, SOURCE, NAME, BIRTHDAY, AGE, SEX, GRADE, CARDTYPE, CARDID, CARDEXPIREDATE, CLIENTTYPE, WORKPHONE, FAMILYPHONE, TELEPHONE, OCCUPATION, BUSINESSTYPE, INCOME, GRPNAME, ADDRESS, OTHERCLIENTINFO, ZIPCODE, NATIONALITY, PROVINCE, COMCODE, CONTTYPE, BUSINESSLICENSENO, ORGCOMCODE, TAXREGISTCERTNO, BUSINESSSOURCE, LEGALPERSON, LEGALPERSONCARDTYPE, LEGALPERSONCARDID, LINKMAN, COMREGISTAREA, COMREGISTTYPE, COMBUSINESSAREA, COMBUSINESSSCOPE, APPNTNUM, COMSTAFFSIZE, AMLISCOUNT, AMLIHCOUNT, AMLISREPORTCOUNT, AMLIHREPORTCOUNT, GRPNATURE, FOUNDDATE, HOLDERKEY, HOLDERNAME, HOLDERCARDTYPE, HOLDERCARDID, HOLDEROCCUPATION, HOLDERRADIO, HOLDEROTHERINFO, RELARISKTIP, ISEXCEPTION, ISCOMPLETED, EXCEPTIONCODE, FIRSTAUDITOR, SECONDAUDITOR, THIRDAUDITOR, GRADEWAY, RISKSCORE, RISKGRADE, STATE, REMARK, DEALTIME, NEXTAUDITDATE, OPER, MAKEDATE, MAKETIME)
values ((select max(CLIENTNO)+1 from fxdj.cr_client), '1', '预生产测试', to_date('01-10-1989', 'dd-mm-yyyy'), null, '1', null, '0', '110101198910016540', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '4', '05', null, to_date('01-05-2022', 'dd-mm-yyyy'), null, null, null, null);
select SaleChnl,a.* from lccont a where contno='2022032900000416'

select a.* from laagent a where name='周围'

SELECT GiveType,GetDutyCode FROM LLClaimDetail where  ClmNo = '3631815101010354'

select a.* from LLClaimDetail a where;