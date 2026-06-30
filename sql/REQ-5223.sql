-- id: req-5223
-- 标题: 工行银保通接口文档更新（保险产品适当性字段）

/*
1、准备文件，文件路径：/data/app/filecontent/bankfile/icbc/pl/
2、批处理：1715-工行监管补充信息

delete from lccustevaluation;
*/

select prtno          投保单号,
       contno         保单号,
       otherno        保单印刷号,
       custevaluation 客户是否完成适当性评估,
       prodsuitable   产品适当性是否匹配,
       risksign       风险警示确认书是否签署,
       custrisklevel  客户风险评级,
       custprodlevel  客户适配产品评级,
       type           保单类型
from lccustevaluation a
where prtno = '3000117150314139'
order by serialno;

select a.*
from lccont a
where bankcode = '0101'
  and appflag = '1';



select contno,
       prtno,
       appntname,
       insuredname,
       proposalcontno,
       insuredno,
       grpcontno,
       (select t.*
        from (select otherno
              from tranlog
              where funcflag = 0
                and rcode = 0
                and proposalprtno in (select a.prtno
                                      from lccont a,
                                           lcpol b
                                      where a.contno = b.contno
                                        and a.salechnl = '03'
                                        and a.selltype = '08'
                                        and a.appflag = '1'
                                        and a.contno = '2015021502000006')
              order by trandate desc) t
        where rownum = 1),
       case
           when appflag = '4' then '终止'
           when exists (select 1
                        from lccontstate a,
                             lcpol b
                        where a.contno = lccont.contno
                          and a.state = '1'
                          and a.polno = b.polno
                          and b.polno = b.mainpolno
                          and a.statetype = 'Available'
                          and a.enddate is null) then '失效'
           when exists (select 1
                        from lccontstate a,
                             lcpol b
                        where a.contno = lccont.contno
                          and a.state = '1'
                          and a.polno = b.polno
                          and b.polno = b.mainpolno
                          and a.statetype = 'DefedPay'
                          and a.enddate is null) then '缓交'
           when appflag = '1' then '有效'
           else '' end as polstatus,
       customgetpoldate,
       case trustcompanyflag when 'Y' then '是' when 'N' then '否' else '' end
from lccont
where contno = '2015021502000006'
  and managecom like '86%';

--满期未给付
select a.*
from lccont a
where appflag = '4'
  and bankcode = '0101'
  and salechnl = '03'
  and agentcom like '09%'
  and grpcontno = '00000000000000000000'
  and exists(select 1
             from lccontstate
             where contno = a.contno
               and statetype = 'Terminate'
               and state = '1'
               and statereason = '01'
               and enddate is null)
  and exists(select 1 from lcinsureacc where contno = a.contno and acctype = '009' and insuaccbala > 0)
order by contno desc;

select a.*
from lcinsureacc a
where contno = '2025111700006886'

select a.*
from lisdata.lccontstate a
where contno = '2025120900000226';

select a.*
from ldcode a
where codetype = 'contterminatereason';

--失效
select a.*
from lccont a
where appflag = '1'
  and bankcode = '0101'
  and salechnl = '03'
  and agentcom like '09%'
  and grpcontno = '00000000000000000000'
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
  and salechnl = '03'
  and agentcom like '09%'
  and grpcontno = '00000000000000000000'
order by contno desc;

select a.* from lccont a where contno='5000118200482742'