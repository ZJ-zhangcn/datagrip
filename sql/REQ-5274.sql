-- ID: REQ-5274
-- 标题: 反洗钱新规涉及非自然人模块理赔调整需求

select relationtopayee,
       payeename,
       payeesex,
       payeebirthday,
       payeeidtype,
       payeeidno,
       payeeidstartdate,
       payeeidexpdate,
       payeemobile,
       a.*
from llbnf a
where grpcontno = '2026060900001286';

select relationtopayee,
       payeename,
       payeesex,
       payeebirthday,
       payeeidtype,
       payeeidno,
       payeeidstartdate,
       payeeidexpdate,
       payeemobile,
       a.*
from llbnf a
where /*caseno in (select rgtno from llregister where rgtobjno = 'P86012026001144')
   or */caseno in ('3631815101011538');

update llbnf set relationtopayee='01' where caseno in ('3631815101011515');

--

/*
update llbnf set relationtopayee='03' where caseno in (select rgtno from llregister where rgtobjno = 'P86012026001144')
*/

select rgtobjno, a.*
from llregister a
where rgtno = '3631815101011495';

select a.*
from ljaget a
where otherno in (select rgtno from llregister where rgtobjno = '3631815101011515');

select /*LicName, LicIdNo,*/ a.*
from lpgrpnonaturecustomerinfo a
where EDORACCEPTNO = '3631815101011422';


select /*LicName, LicIdNo,*/ a.*
from lcgrpcustomerinfo a
where GRPCUSTOMERNO = 'c';

select a.*
from lpgrpnonaturecustomerinfo a
where edoracceptno in ('3631815101011538', '', '');

select a.*
from lpnonatureprobnf a
where edoracceptno in ('3631815101011538', '', '');

select a.*
from lpnonatureprobnf a
where CUSTOMERNO in ('1000012249', '', '');

select a.*
from lcprobnf a
where CUSTOMERNO in ('1000012249', '', '');

select a.* from ldgrp a where CUSTOMERNO='1000012249'

select a.*
from lcprobnf a
where NUMID in ('BNF_0000000520', '', '');

select count(1)
from LPNoNatureProBnf
where EdorAcceptNo = 'P86012026001132'
  and NumID = 'BNF_0000000505';

select *
FROM ldgrp
WHERE customerno = '1060094014';

update ldgrp
set fdname='上海耕工广告有限公司'
where customerno = '1060094014';


select CustomerNo
from ldgrp
where GrpName = '上海塔苏国际商贸有限公司'
  and ComDocIDNo = '91310120D586DSF42T';
select a.*
from ldgrp a
where CustomerNo = '1060101780';

--风险等级
select name                                    名称,
       sex                                     性别,
       birthday                                出生日期,
       cardtype                                证件类型,
       cardid                                  证件号码,
       case
           when RISKGRADE = '3' then '较高'
           when RISKGRADE = '4' then '最高'
           else '非“较高”或“最高”' end         风险等级,
       case
           when state = '05' then '复核完成'
           when state = '06' then '评级结束'
           else '非“复核完成”或“评级结束”' end 评级状态,
       a.*
from fxdj.cr_client a
where CLIENTNO in
      ('100181271701', '100181271702', '100181271703', '100181271704', '100181271705', '100181271706', '100181271707')
order by clientno;

SELECT checkinfo, decode(state, '0', '未确认', '1', '已确认', '未确认')
FROM LLAutoCheckInfo
WHERE grpclmno = 'P86012026001132';

/*
delete from LLAutoCheckInfo where grpclmno = 'P86012026001143' and state = '1';
*/

/*
update fxdj.cr_client set name='上海塔苏国际商贸有限公司',sex=null,birthday=null,cardtype=null,cardid='91310120D586DSF42T' where CLIENTNO='100181271701';
update fxdj.cr_client set RISKGRADE='3',state='04' where CLIENTNO='100181271707';
*/

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
VALUES ('100181271707', '1', '受益五', DATE '1991-01-10', 30, '1', null, '0', '362229199101100341', DATE '2024-10-24',
        '01', null,
        null, '150****3695', '4070401', null, 0.00, null, null, null, null, 'CHN', null, '86010101', '1', null, null,
        null, null, null, null, null, null, null, null, null, null, 1, 1, null, null, 0, null, null, null, null, null,
        null, null, null, null, null, 'R00', null, null, null, 'zhangwei', null, null, '01', 46.00, '3', '05',
        '评级结束', TIMESTAMP '2021-04-19 02:48:21', DATE '2025-08-22', 'sys', DATE '2019-09-16', '05:04:59');

--反洗钱黑名单
select /*name     名称,
       sex      性别,
       birthday 出生日期,
       idtype   证件类型,
       idno     证件号码,*/
    a.*
from lxblacklist a
where seq in ('725973901', '725973902', '725973903', '725973904', '725973905', '725973906')
order by seq;

INSERT INTO LISDATA.LXBLACKLIST (SEQ, NAME, CONTTYPE, BIRTHDAY, STANDBYFLAG1, STANDBYFLAG2, STANDBYFLAG3, STANDBYFLAG4,
                                 STANDBYFLAG5, OPERATOR, MAKEDATE, MAKETIME, MODIFYDATE, MODIFYTIME, BLACKLISTSOURCE,
                                 COUNTRY, AREAGRADE, SEX, IDTYPE, IDNO, BLACKLISTTYPE)
VALUES ('725973906', '受益五', '08', DATE '1991-01-10', '0901', '1037700253470', null, '0', '0', null,
        DATE '2020-07-01',
        '19:21:27', DATE '2020-01-28', null, null, null, null, '1', '0', '362229199101100341', '00');


--政治公众人物
select name     名称,
       birthday 出生日期,
       cardid   证件号码,
       a.*
from amlPEPList a
where SEQ in ('601', '602', '603', '604', '605', '606')
order by seq;

INSERT INTO LISDATA.AMLPEPLIST (SEQ, NAME, SEX, BIRTHDAY, CARDTYPE, CARDID, STANDBYFLAG1, STANDBYFLAG2, STANDBYFLAG3,
                                STANDBYFLAG4, OPERATOR, MAKEDATE, MAKETIME, MODIFYDATE, MODIFYTIME)
VALUES ('606', '受益五', '1', '1991/1/10', '0', '362229199101100341', null, null, null, null, '001', DATE '2018-06-27',
        '08:00:00', DATE '2018-06-27', '08:00:00');



select a.*
from FXQBnfCheckInfo a
where otherno = '3631815101011423';

select a.*
from FXQBnfCheckInfo a
where otherno = '3229315100007253';

select count(1)
from FXQBnfCheckInfo
where '1782266146000' = '1782266146000'
  and OtherNo = '3631815101011485'
  and OtherNoType = '4';

select *
from LCIDCardCheckInfo
where contno = '3229315100007235'
  and CUSTOMERTYPE = 'CD';

INSERT INTO FXQBNFCHECKINFO (SERIALNO, GRPCONTNO, GRPCUSTOMERNO, GRPNAME, GRPIDNO, BDMANAGECOM, CONTNO, OTHERNO,
                             OTHERNOTYPE, MESSAGEFLAG, MESSAGE, RESULTFLAG, LOGINUSERNAME, ISGROUP, BNFKEY, NAME, SEX,
                             NATIVEPLACE, BRITHDAY, ADDR, IDTYPE, IDNO, IDDATE, MOBILE, PHONE, ACTCTRL, ACTHDRAT,
                             SHARERATIOSTARTDATE, SHARERATIOENDDATE, ACTCTRLCPNY, ACTCTRLTYPE, OBTAINACTDATE,
                             TERMINATIONACTDATE, ACTOTHERFORMS, ACTCONUPPERMARKET, ACTCONUPPERENTNAME, ACTCONUNISCID,
                             PRIBENFIT, BENEFITRAT, ACTOWNERPROFITRATIO, PROFITRATIOSTARTDATE, PROFITRATIOENDDATE,
                             ACTOWNERPROFITRATIOVOTE, PROFITRATIOVOTESTARTDATE, PROFITRATIOVOTEENDDATE, SENIORMGR,
                             SENIORMGRPOS, ACTDAILYMGMTPOSTOTHER, SENIORMGRCN, SENIORMGRPOSCN, OWNERRIGHTMGMTPOSTOTHER,
                             BENSTARTDATE, BENENDDATE, CUSTID, BNFTYPE, PROPORTION, STATICTM, SUBJECTID, REPORTID,
                             OPERATETYPE, OPERATETYPESTR, DATASOURCE, ISHST, IDTPDISP, GENDERDISP, NTLTYDISP,
                             BNFTYPEDISP, DATASOURCESTR, MANAGECOM, OPERATOR, MAKEDATE, MAKETIME, MODIFYDATE,
                             MODIFYTIME, STANDBYFLAG1, STANDBYFLAG2, STANDBYFLAG3, STANDBYFLAG4, STANDBYFLAG5)
VALUES ('980QB000000000412', null, 'test_company_1', '上海塔苏国际商贸有限公司', '91310120D586DSF42T', '8601', null,
        '3229315100007253', '2', '1', '核验查询成功', '1', null, null, '150924197206043108', '郁伟', '1', '156',
        DATE '1972-06-04', '内蒙古自治区乌兰察布市兴和县12号', '10', '150924197206043108', DATE '2030-12-31',
        '13120901587', null, 'Y', '33', DATE '2026-05-01', null, null, null, null, null, null, null, null, null, 'N',
        null, null, null, null, null, null, null, 'N', null, null, 'N', null, null, null, null, null, null, null,
        '2026-06-16 14:41:00', '6ac0af432a16449d9eb84930973140a0', null, null, null, null, null, null, null, null, null,
        null, '86', '001', DATE '2026-06-16', '15:28:26', DATE '2026-06-16', '15:28:26', null, null, null, null, null);

select a.*
from ljaget a
where otherno in (select rgtno from LLREGISTER where rgtobjno = 'P86012026001132')
   or otherno in ('3631815101011515')
order by otherno;

select *
from LOPrintPath
where contno = '3631815101011486'
  and bak1 = '3631815101011486';

select a.*
from LISDATA.LOPRTMANAGER a
where /*otherno in (select rgtno from LLREGISTER where rgtobjno = 'P86012026001132')
   or */otherno in ('3631815101011515')
    and othernotype = '5';

select *
from lcidCardCheckInfo a
where contno = 'P86012026001142';

select a.*
from lcidCardCheckInfo a
where IDNO IN
      ('362229199101100261', '362229199101100288', '362229199101100309', '362229199101100325', '362229199101100341',
       '362229199101100384', '362229199101100368', '362229199101100405') and contno = '3631815101011422';

/*
delete from LOPRTMANAGER where otherno in (select rgtno from LLREGISTER where rgtobjno = 'P86012026001132') or otherno in ('3631815101011515');
update ljaget set SENDBANKCOUNT='0',PRTNOTESTATE=null where otherno in (select rgtno from LLREGISTER where rgtobjno = 'P86012026001132') or otherno in ('3631815101011515');
*/

select a.*
from LISDATA.LYSENDTOBANK a
where polno = '3631815101011515';

select a.*
from LCNoNatureProBnfTree a
where otherno = 'P86012026001132'
  and NumID = 'BNF_0000000513';

select *
from ldmenu
where NodeSign = '2'
  and runscript like '%/customer/GrpCustomerInfoEntrySave.jsp%';

select *
from (select 1 from LCGrpCont where 1 = 1 and appntno = '1000012249' group by appntno, grpname, grpnature)
;

select fdname
FROM ldgrp
WHERE customerno = '1000012249';
select fdname
FROM ldgrp
WHERE customerno = '1060101140';