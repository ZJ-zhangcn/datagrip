select count(1)
from lccont a,
     ljspay ljs
where '1770017995000' = '1770017995000'
  and a.contno = ljs.otherno
  and ljs.othernotype = '2'
  and a.contno = '2026013000000156'
  and a.salecom in (select lv.salecom from LmUserView lv where lv.usercode = '001')
  and a.appflag = '1'
  and not exists (select 1
                  from lccontstate s
                  where s.contno = a.contno
                    and s.statetype in ('Available', 'DefedPay')
                    and s.state = '1'
                    and s.enddate is null)
  and not exists (select 1 from LCContHangUpState h where h.contno = a.contno)
  and (ljs.bankonthewayflag is null or ljs.bankonthewayflag <> '1');

select a.*
from ljspay a
where otherno = '2026013000000156';

INSERT INTO LISDATA.LJSPAY (GETNOTICENO, OTHERNO, OTHERNOTYPE, APPNTNO, SUMDUEPAYMONEY, PAYDATE, BANKONTHEWAYFLAG,
                            BANKSUCCFLAG, SENDBANKCOUNT, APPROVECODE, APPROVEDATE, SERIALNO, OPERATOR, MAKEDATE,
                            MAKETIME, MODIFYDATE, MODIFYTIME, MANAGECOM, AGENTCOM, AGENTTYPE, BANKCODE, BANKACCNO,
                            RISKCODE, AGENTCODE, AGENTGROUP, ACCNAME, STARTPAYDATE, PAYTYPEFLAG, PAYFORM, IDTYPE, IDNO,
                            CURRENCY, PRTNOTESTATE, BANKPROVINCE, ACCTYPE, BANKCITY, SENDTYPE, PAYFORMTYPE, PAYMODE)
VALUES ('86010120280310000631', '2026013000000156', '2', '1060099726', 100000.00, DATE '2028-03-31', null, null, 0,
        '002', DATE '2026-01-30', null, '001', DATE '2028-01-31', '00:00:24', DATE '2028-02-02', '05:34:00', '86010101',
        null, null, '0101', '1234567890654321', '1011005', '0101100032', '000000005971', '个险投保一二八',
        DATE '2028-01-31', null, 'N', '0', '350624197001101547', '01', null, '3100', '0', '3100', null, null, '0');


select a.PubPayerRel                              对公转账人与投保人关系,
       a.PubPayerName                             对公转账人姓名,
       a.PubPayerSex                              对公转账人性别,
       a.PubPayerBirthday                         对公转账人出生日期,
       a.PubPayerIDType                           对公转账人证件类型,
       a.PubPayerIDNo                             对公转账人证件号码,
       a.PayMode                                  本次交费方式,
       a.BankCode                                 开户行,
       a.BankProvince                             开户行所在省,
       a.BankCity                                 开户行所在市,
       a.AccType                                  卡折类型,
       a.AccName                                  账户姓名,
       a.AccNo                                    账号,
       a.BUSINO                                   流水号,
       case
           when a.state = '0' then '变更生效'
           when a.state = '1' then '变更暂存'
           when a.state = '2' then '撤销生效'
           when a.state = '3' then '撤销暂存'
           when a.state = '4' then '申请修改' end 状态,
       a.DUEFLAG                                  尽调标志/*需要尽职调查DueFlag=1,不需要尽职调查DueFlag=0*/,
       a.CANCELAPPTYPE                            撤销录入的申请方式,
       a.CANCELAPPDATE                            撤销录入的申请日期,
       a.CANCELRECORDNO                           "撤销录入的录音/工单编号",
       a.CANCELREMARK                             撤销备注
from LCXQBankData a,
     LCXQBANKDATATRACE b
where a.contno = b.contno
  and a.BUSINO = b.BUSINO
  and a.STATE = b.STATE
  and a.contno = '2026013000000156'
  and a.STARTPAYDATE = date'2032-01-31'
  and a.BUSINO = 'XQZH000000000017'
  and ROWNUM = 1
order by a.BUSINO desc, b.SERIALNO desc;

select a.*
from LCXQBankData a
where contno = '2026013000000156'
order by BUSINO;

select a.*
from LCXQBANKDATATRACE a
where contno = '2026013000000156'
order by SERIALNO;

select FileType, FilePath, FileName
from LCXQBankFilePath
where BusiNo = 'XQZH000000000009'
  and FileCategory in ('TY', 'JZDC')
order by FileType;

select a.*
from LCXQBankFilePath a
where CONTNO = '2026013000000156';

select a.*
from ldtask a
where TASKDESCRIBE like '%自动核销批处理%';--000018

select a.*
from LDTASKPLAN a
where taskcode = '000018';

select a.*
from lcappnt a
where contno = '2026030200000586';

update lccont
set getpoldate=signdate,
    customgetpoldate=signdate,
    appflag='1'
where contno in ('2026013000000156', '', '', '');--2026021000001516

select a.*
from LISDATA.LCCONTSTATE a
where contno = '2026013000000156';

select a.*
from LISDATA.LCCONTHANGUPSTATE a
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
update FXDJ.CR_CLIENT set riskgrade='4' where CARDID='460201199001010053';
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
VALUES ('6666700004', '1', '自己选一', DATE '1990-01-01', null, '0', null, '0', '460201199001010053', null, null,
        null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null,
        null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null,
        null, null, null, null, null, null, null, null, null, null, null, null, null, null, '3', '05', null, null, null,
        null, null, null);
