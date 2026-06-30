-- id: req-5274
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

/*
update llbnf set relationtopayee='01' where caseno in ('3631815101011515');
*/

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

select /*licname, licidno,*/ a.*
from lpgrpnonaturecustomerinfo a
where edoracceptno = '3631815101011422';


select /*licname, licidno,*/ a.*
from lcgrpcustomerinfo a
where grpcustomerno = 'c';

select a.*
from lpgrpnonaturecustomerinfo a
where edoracceptno in ('3631815101011538', '', '');

select a.*
from lpnonatureprobnf a
where edoracceptno in ('3631815101011538', '', '');

select a.*
from lpnonatureprobnf a
where customerno in ('1000012249', '', '');

select a.*
from lcprobnf a
where customerno in ('1000012249', '', '');

select a.* from ldgrp a where customerno='1000012249'

select a.*
from lcprobnf a
where numid in ('BNF_0000000520', '', '');

select count(1)
from lpnonatureprobnf
where edoracceptno = 'P86012026001132'
  and numid = 'BNF_0000000505';

select *
from ldgrp
where customerno = '1060094014';

/*
update ldgrp
set fdname='上海耕工广告有限公司'
where customerno = '1060094014';
*/


select customerno
from ldgrp
where grpname = '上海塔苏国际商贸有限公司'
  and comdocidno = '91310120D586DSF42T';

select a.*
from ldgrp a
where customerno = '1060101780';

--风险等级
select name                                    名称,
       sex                                     性别,
       birthday                                出生日期,
       cardtype                                证件类型,
       cardid                                  证件号码,
       case
           when riskgrade = '3' then '较高'
           when riskgrade = '4' then '最高'
           else '非“较高”或“最高”' end         风险等级,
       case
           when state = '05' then '复核完成'
           when state = '06' then '评级结束'
           else '非“复核完成”或“评级结束”' end 评级状态,
       a.*
from fxdj.cr_client a
where clientno in
      ('100181271701', '100181271702', '100181271703', '100181271704', '100181271705', '100181271706', '100181271707')
order by clientno;

select checkinfo, decode(state, '0', '未确认', '1', '已确认', '未确认')
from llautocheckinfo
where grpclmno = 'P86012026001132';

/*
delete from llautocheckinfo where grpclmno = 'P86012026001143' and state = '1';
*/

/*
update fxdj.cr_client set name='上海塔苏国际商贸有限公司',sex=null,birthday=null,cardtype=null,cardid='91310120D586DSF42T' where clientno='100181271701';

update fxdj.cr_client set riskgrade='3',state='04' where clientno='100181271707';
*/

/*
insert into fxdj.cr_client (clientno, source, name, birthday, age, sex, grade, cardtype, cardid, cardexpiredate,
                            clienttype, workphone, familyphone, telephone, occupation, businesstype, income, grpname,
                            address, otherclientinfo, zipcode, nationality, province, comcode, conttype,
                            businesslicenseno, orgcomcode, taxregistcertno, businesssource, legalperson,
                            legalpersoncardtype, legalpersoncardid, linkman, comregistarea, comregisttype,
                            combusinessarea, combusinessscope, appntnum, comstaffsize, amliscount, amlihcount,
                            amlisreportcount, amlihreportcount, grpnature, founddate, holderkey, holdername,
                            holdercardtype, holdercardid, holderoccupation, holderradio, holderotherinfo, relarisktip,
                            isexception, iscompleted, exceptioncode, firstauditor, secondauditor, thirdauditor,
                            gradeway, riskscore, riskgrade, state, remark, dealtime, nextauditdate, oper, makedate,
                            maketime)
values ('100181271707', '1', '受益五', date '1991-01-10', 30, '1', null, '0', '362229199101100341', date '2024-10-24',
        '01', null,
        null, '150****3695', '4070401', null, 0.00, null, null, null, null, 'CHN', null, '86010101', '1', null, null,
        null, null, null, null, null, null, null, null, null, null, 1, 1, null, null, 0, null, null, null, null, null,
        null, null, null, null, null, 'R00', null, null, null, 'zhangwei', null, null, '01', 46.00, '3', '05',
        '评级结束', timestamp '2021-04-19 02:48:21', date '2025-08-22', 'sys', date '2019-09-16', '05:04:59');
*/

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

/*
insert into lisdata.lxblacklist (seq, name, conttype, birthday, standbyflag1, standbyflag2, standbyflag3, standbyflag4,
                                 standbyflag5, operator, makedate, maketime, modifydate, modifytime, blacklistsource,
                                 country, areagrade, sex, idtype, idno, blacklisttype)
values ('725973906', '受益五', '08', date '1991-01-10', '0901', '1037700253470', null, '0', '0', null,
        date '2020-07-01',
        '19:21:27', date '2020-01-28', null, null, null, null, '1', '0', '362229199101100341', '00');
*/


--政治公众人物
select name     名称,
       birthday 出生日期,
       cardid   证件号码,
       a.*
from amlpeplist a
where seq in ('601', '602', '603', '604', '605', '606')
order by seq;

/*
insert into lisdata.amlpeplist (seq, name, sex, birthday, cardtype, cardid, standbyflag1, standbyflag2, standbyflag3,
                                standbyflag4, operator, makedate, maketime, modifydate, modifytime)
values ('606', '受益五', '1', '1991/1/10', '0', '362229199101100341', null, null, null, null, '001', date '2018-06-27',
        '08:00:00', date '2018-06-27', '08:00:00');
*/



select a.*
from fxqbnfcheckinfo a
where otherno = '3631815101011423';

select a.*
from fxqbnfcheckinfo a
where otherno = '3229315100007253';

select count(1)
from fxqbnfcheckinfo
where '1782266146000' = '1782266146000'
  and otherno = '3631815101011485'
  and othernotype = '4';

select *
from lcidcardcheckinfo
where contno = '3229315100007235'
  and customertype = 'CD';

/*
insert into fxqbnfcheckinfo (serialno, grpcontno, grpcustomerno, grpname, grpidno, bdmanagecom, contno, otherno,
                             othernotype, messageflag, message, resultflag, loginusername, isgroup, bnfkey, name, sex,
                             nativeplace, brithday, addr, idtype, idno, iddate, mobile, phone, actctrl, acthdrat,
                             shareratiostartdate, shareratioenddate, actctrlcpny, actctrltype, obtainactdate,
                             terminationactdate, actotherforms, actconuppermarket, actconupperentname, actconuniscid,
                             pribenfit, benefitrat, actownerprofitratio, profitratiostartdate, profitratioenddate,
                             actownerprofitratiovote, profitratiovotestartdate, profitratiovoteenddate, seniormgr,
                             seniormgrpos, actdailymgmtpostother, seniormgrcn, seniormgrposcn, ownerrightmgmtpostother,
                             benstartdate, benenddate, custid, bnftype, proportion, statictm, subjectid, reportid,
                             operatetype, operatetypestr, datasource, ishst, idtpdisp, genderdisp, ntltydisp,
                             bnftypedisp, datasourcestr, managecom, operator, makedate, maketime, modifydate,
                             modifytime, standbyflag1, standbyflag2, standbyflag3, standbyflag4, standbyflag5)
values ('980QB000000000412', null, 'test_company_1', '上海塔苏国际商贸有限公司', '91310120D586DSF42T', '8601', null,
        '3229315100007253', '2', '1', '核验查询成功', '1', null, null, '150924197206043108', '郁伟', '1', '156',
        date '1972-06-04', '内蒙古自治区乌兰察布市兴和县12号', '10', '150924197206043108', date '2030-12-31',
        '13120901587', null, 'Y', '33', date '2026-05-01', null, null, null, null, null, null, null, null, null, 'N',
        null, null, null, null, null, null, null, 'N', null, null, 'N', null, null, null, null, null, null, null,
        '2026-06-16 14:41:00', '6ac0af432a16449d9eb84930973140a0', null, null, null, null, null, null, null, null, null,
        null, '86', '001', date '2026-06-16', '15:28:26', date '2026-06-16', '15:28:26', null, null, null, null, null);
*/

select a.*
from ljaget a
where otherno in (select rgtno from llregister where rgtobjno = 'P86012026001132')
   or otherno in ('3631815101011515')
order by otherno;

select *
from loprintpath
where contno = '3631815101011486'
  and bak1 = '3631815101011486';

select a.*
from lisdata.loprtmanager a
where /*otherno in (select rgtno from llregister where rgtobjno = 'P86012026001132')
   or */otherno in ('3631815101011515')
    and othernotype = '5';

select *
from lcidcardcheckinfo a
where contno = 'P86012026001142';

select a.*
from lcidcardcheckinfo a
where idno in
      ('362229199101100261', '362229199101100288', '362229199101100309', '362229199101100325', '362229199101100341',
       '362229199101100384', '362229199101100368', '362229199101100405') and contno = '3631815101011422';

/*
delete from loprtmanager where otherno in (select rgtno from llregister where rgtobjno = 'P86012026001132') or otherno in ('3631815101011515');

update ljaget set sendbankcount='0',prtnotestate=null where otherno in (select rgtno from llregister where rgtobjno = 'P86012026001132') or otherno in ('3631815101011515');
*/

select a.*
from lisdata.lysendtobank a
where polno = '3631815101011515';

select a.*
from lcnonatureprobnftree a
where otherno = 'P86012026001132'
  and numid = 'BNF_0000000513';

select *
from ldmenu
where nodesign = '2'
  and runscript like '%/customer/GrpCustomerInfoEntrySave.jsp%';

select *
from (select 1 from lcgrpcont where 1 = 1 and appntno = '1000012249' group by appntno, grpname, grpnature)
;

select fdname
from ldgrp
where customerno = '1000012249';

select fdname
from ldgrp
where customerno = '1060101140';