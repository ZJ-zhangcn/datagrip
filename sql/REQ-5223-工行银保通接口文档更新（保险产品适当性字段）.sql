/*
1、准备文件，文件路径：/data/app/FileContent/BankFile/icbc/PL/
2、批处理：1715-工行监管补充信息

delete from LCCustEvaluation;
*/

select PRTNO          投保单号,
       CONTNO         保单号,
       OTHERNO        保单印刷号,
       CUSTEVALUATION 客户是否完成适当性评估,
       PRODSUITABLE   产品适当性是否匹配,
       RISKSIGN       风险警示确认书是否签署,
       CUSTRISKLEVEL  客户风险评级,
       CUSTPRODLEVEL  客户适配产品评级,
       TYPE           保单类型
from LCCustEvaluation a
where prtno = '3000117150314139'
order by SERIALNO;

select a.*
from lccont a
where bankcode = '0101'
  and appflag = '1';



select ContNo,
       Prtno,
       AppntName,
       InsuredName,
       ProposalContNo,
       InsuredNo,
       GrpContNo,
       (select t.*
        from (select otherno
              from tranlog
              where funcflag = 0
                and rcode = 0
                and PROPOSALPRTNO in (select a.prtno
                                      from lccont a,
                                           lcpol b
                                      where a.contno = b.contno
                                        and a.salechnl = '03'
                                        and a.selltype = '08'
                                        and a.appflag = '1'
                                        and a.ContNo = '2015021502000006')
              order by trandate desc) t
        where rownum = 1),
       case
           when appflag = '4' then '终止'
           when exists (select 1
                        from lccontstate a,
                             lcpol b
                        where a.contno = LCCont.contno
                          and a.state = '1'
                          and a.polno = b.polno
                          and b.polno = b.mainpolno
                          and a.statetype = 'Available'
                          and a.enddate is null) then '失效'
           when exists (select 1
                        from lccontstate a,
                             lcpol b
                        where a.contno = LCCont.contno
                          and a.state = '1'
                          and a.polno = b.polno
                          and b.polno = b.mainpolno
                          and a.statetype = 'DefedPay'
                          and a.enddate is null) then '缓交'
           when appflag = '1' then '有效'
           else '' end as PolStatus,
       CustomGetPolDate,
       case TrustCompanyFlag when 'Y' then '是' when 'N' then '否' else '' end
from LCCont
where ContNo = '2015021502000006'
  and ManageCom like '86%';

--满期未给付
select a.*
from lccont a
where appflag = '4'
  and bankcode = '0101'
  and SALECHNL = '03'
  and agentcom like '09%'
  and GRPCONTNO = '00000000000000000000'
  and exists(select 1
             from lccontstate
             where contno = a.contno
               and statetype = 'Terminate'
               and state = '1'
               and statereason = '01'
               and enddate is null)
  and exists(select 1 from lcinsureacc where contno = a.contno and ACCTYPE = '009' and insuaccbala > 0)
order by contno desc;

select a.*
from lcinsureacc a
where contno = '2025111700006886'

select a.*
from LISDATA.LCCONTSTATE a
where contno = '2025120900000226';

select a.*
from ldcode a
where codetype = 'contterminatereason';

--失效
select a.*
from lccont a
where appflag = '1'
  and bankcode = '0101'
  and SALECHNL = '03'
  and agentcom like '09%'
  and GRPCONTNO = '00000000000000000000'
  and exists(select 1
             from lccontstate
             where contno = a.contno
               and statetype = 'Available'
               and state = '1'
               --and statereason = '02'
               and enddate is null)
order by contno desc;

--核保失败
select a.*
from lccont a
where uwflag in ('1', '2', 'a')
  and bankcode = '0101'
  and conttype = '1'
  and SALECHNL = '03'
  and agentcom like '09%'
  and GRPCONTNO = '00000000000000000000'
order by contno desc;

select a.* from lccont a where contno='5000118200482742'