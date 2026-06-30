-- id: req-5181
-- 标题: 关于新增续期交费方式变更、补录账户信息保全项需求

select count(1)
from lccont a,
     ljspay ljs
where '1770017995000' = '1770017995000'
  and a.contno = ljs.otherno
  and ljs.othernotype = '2'
  and a.contno = '2026013000000156'
  and a.salecom in (select lv.salecom from lmuserview lv where lv.usercode = '001')
  and a.appflag = '1'
  and not exists (select 1
                  from lccontstate s
                  where s.contno = a.contno
                    and s.statetype in ('Available', 'DefedPay')
                    and s.state = '1'
                    and s.enddate is null)
  and not exists (select 1 from lcconthangupstate h where h.contno = a.contno)
  and (ljs.bankonthewayflag is null or ljs.bankonthewayflag <> '1');

select a.*
from ljspay a
where otherno = '2026013000000156';

/*
insert into lisdata.ljspay (getnoticeno, otherno, othernotype, appntno, sumduepaymoney, paydate, bankonthewayflag,
                            banksuccflag, sendbankcount, approvecode, approvedate, serialno, operator, makedate,
                            maketime, modifydate, modifytime, managecom, agentcom, agenttype, bankcode, bankaccno,
                            riskcode, agentcode, agentgroup, accname, startpaydate, paytypeflag, payform, idtype, idno,
                            currency, prtnotestate, bankprovince, acctype, bankcity, sendtype, payformtype, paymode)
values ('86010120280310000631', '2026013000000156', '2', '1060099726', 100000.00, date '2028-03-31', null, null, 0,
        '002', date '2026-01-30', null, '001', date '2028-01-31', '00:00:24', date '2028-02-02', '05:34:00', '86010101',
        null, null, '0101', '1234567890654321', '1011005', '0101100032', '000000005971', '个险投保一二八',
        date '2028-01-31', null, 'N', '0', '350624197001101547', '01', null, '3100', '0', '3100', null, null, '0');
*/


select a.pubpayerrel                              对公转账人与投保人关系,
       a.pubpayername                             对公转账人姓名,
       a.pubpayersex                              对公转账人性别,
       a.pubpayerbirthday                         对公转账人出生日期,
       a.pubpayeridtype                           对公转账人证件类型,
       a.pubpayeridno                             对公转账人证件号码,
       a.paymode                                  本次交费方式,
       a.bankcode                                 开户行,
       a.bankprovince                             开户行所在省,
       a.bankcity                                 开户行所在市,
       a.acctype                                  卡折类型,
       a.accname                                  账户姓名,
       a.accno                                    账号,
       a.busino                                   流水号,
       case
           when a.state = '0' then '变更生效'
           when a.state = '1' then '变更暂存'
           when a.state = '2' then '撤销生效'
           when a.state = '3' then '撤销暂存'
           when a.state = '4' then '申请修改' end 状态,
       a.dueflag                                  尽调标志/*需要尽职调查dueflag=1,不需要尽职调查dueflag=0*/,
       a.cancelapptype                            撤销录入的申请方式,
       a.cancelappdate                            撤销录入的申请日期,
       a.cancelrecordno                           "撤销录入的录音/工单编号",
       a.cancelremark                             撤销备注
from lcxqbankdata a,
     lcxqbankdatatrace b
where a.contno = b.contno
  and a.busino = b.busino
  and a.state = b.state
  and a.contno = '2026013000000156'
  and a.startpaydate = date'2032-01-31'
  and a.busino = 'XQZH000000000017'
  and rownum = 1
order by a.busino desc, b.serialno desc;

select a.*
from lcxqbankdata a
where contno = '2026013000000156'
order by busino;

select a.*
from lcxqbankdatatrace a
where contno = '2026013000000156'
order by serialno;

select filetype, filepath, filename
from lcxqbankfilepath
where busino = 'XQZH000000000009'
  and filecategory in ('TY', 'JZDC')
order by filetype;

select a.*
from lcxqbankfilepath a
where contno = '2026013000000156';

select a.*
from ldtask a
where taskdescribe like '%自动核销批处理%';--000018

select a.*
from ldtaskplan a
where taskcode = '000018';

select a.*
from lcappnt a
where contno = '2026030200000586';

/*
update lccont
set getpoldate=signdate,
    customgetpoldate=signdate,
    appflag='1'
where contno in ('2026013000000156', '', '', '');--2026021000001516
*/

select a.*
from lisdata.lccontstate a
where contno = '2026013000000156';

select a.*
from lisdata.lcconthangupstate a
where contno = '2026013000000156';


select b.*
from fxdj.cr_client b,
     lccont c
where '1774597082000' = '1774597082000'
  and c.contno = '2026030200000586'
  and b.name = c.appntname
  and b.sex = c.appntsex
  and b.birthday = c.appntbirthday
  and b.cardtype = c.appntidtype
  and b.cardid = c.appntidno
  and b.state in ('05', '06')
order by b.dealtime desc;

/*
update fxdj.cr_client set riskgrade='4' where cardid='460201199001010053';
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
values ('6666700004', '1', '自己选一', date '1990-01-01', null, '0', null, '0', '460201199001010053', null, null,
        null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null,
        null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null,
        null, null, null, null, null, null, null, null, null, null, null, null, null, null, '3', '05', null, null, null,
        null, null, null);
*/
