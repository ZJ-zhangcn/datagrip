-- id: req-5263
-- 标题: 关于需求xj-20续保方案核保审核点智能提示部分核心推送字段的需求

--团单有效lcgrpcontxbbak
select b.grpcontno                          as 承保单号,
       b.grpname                            as 投保单位,
       b.salechannels                       as 销售渠道,
       b.cvalidate                          as 生效日期,
       b.peoples                            as 团体人数,
       (select count(1)
        from lcinsured li
        where grpcontno = b.grpcontno
          and exists (select 1
                      from lcpol
                      where contno = li.contno
                        and appflag = '1')) as 承保人数,
       (select count(1)
        from lcinsured li
        where grpcontno = b.grpcontno
          and sex = '0'
          and exists (select 1
                      from lcpol
                      where contno = li.contno
                        and appflag = '1')) as 男性被保人人数,
       (select count(1)
        from lcinsured li
        where grpcontno = b.grpcontno
          and sex = '1'
          and exists (select 1
                      from lcpol
                      where contno = li.contno
                        and appflag = '1')) as 女性被保人人数,
       (select to_char(avg(trunc(months_between(to_date('2026-04-22', 'yyyy-mm-dd'), birthday) / 12)), '999999999.99')
        from lcinsured li
        where grpcontno = b.grpcontno
          and exists (select 1
                      from lcpol
                      where contno = li.contno
                        and appflag = '1')) as 平均年龄,
       (select max(trunc(months_between(to_date('2026-04-22', 'yyyy-mm-dd'), birthday) / 12))
        from lcinsured li
        where grpcontno = b.grpcontno
          and exists (select 1
                      from lcpol
                      where contno = li.contno
                        and appflag = '1')) as 最大年龄,
       (select min(trunc(months_between(to_date('2026-04-22', 'yyyy-mm-dd'), birthday) / 12))
        from lcinsured li
        where grpcontno = b.grpcontno
          and exists (select 1
                      from lcpol
                      where contno = li.contno
                        and appflag = '1')) as 最小年龄,
       (select max(salary)
        from lcinsured li
        where grpcontno = b.grpcontno
          and exists (select 1
                      from lcpol
                      where contno = li.contno
                        and appflag = '1')) as 最高月薪,
       (select avg(salary)
        from lcinsured li
        where grpcontno = b.grpcontno
          and exists (select 1
                      from lcpol
                      where contno = li.contno
                        and appflag = '1')) as 平均月薪,
       decode(payintv, 0, '0', '12')        as 交费方式,
       grpspec                              as 特别约定信息,
       (select amnt
        from lcgrppol
        where riskcode = '2062050'
          and b.grpcontno = grpcontno)      as 公共保额保额,
       (select (select (select sum(pag.sumactupaymoney)
                        from ljapaygrp pag
                        where pag.grppolno = gp.grppolno
                          and exists (select 1
                                      from ljapay ap
                                      where ap.payno = pag.payno
                                        and ap.incomeno = b.grpcontno)) +
                       (select nvl(sum(agd.getmoney), 0)
                        from ljagetendorse agd
                        where agd.grppolno = gp.grppolno
                          and agd.getflag <> '1'
                          and exists (select 1
                                      from lpedoritem pd
                                      where pd.edorno = agd.endorsementno
                                        and pd.edorstate = '0'))
                from dual) -
               (select nvl(sum(agd.getmoney) * -1, 0)
                from ljagetendorse agd
                where agd.grppolno = gp.grppolno
                  and agd.getflag = '1'
                  and exists (select 1
                              from lpedoritem pd
                              where pd.edorno = agd.endorsementno
                                and pd.edorstate = '0'))
        from lcgrppol gp
        where gp.riskcode = '2062050'
          and b.grpcontno = gp.grpcontno)   as 公共保额保费,
       '2026-04-22'                         as 最后更新日期,
       '16:41:51'                           as 最后更新时间
from lcgrpcont b
where b.grpcontno = '2026052800000186';

--团单终止lcgrpcontxbbak
select b.grpcontno                                        as 承保单号,
       b.grpname                                          as 投保单位,
       b.salechannels                                     as 销售渠道,
       b.cvalidate                                        as 生效日期,
       b.peoples                                          as 团体人数,
       (select count(1)
        from lcinsured li
        where grpcontno = b.grpcontno
          and exists (select 1
                      from lcpol
                      where contno = li.contno
                        and enddate = date '2025-01-08')) as 承保人数,
       (select count(1)
        from lcinsured li
        where grpcontno = b.grpcontno
          and sex = '0'
          and exists (select 1
                      from lcpol
                      where contno = li.contno
                        and enddate = date '2025-01-08')) as 男性被保人人数,
       (select count(1)
        from lcinsured li
        where grpcontno = b.grpcontno
          and sex = '1'
          and exists (select 1
                      from lcpol
                      where contno = li.contno
                        and enddate = date '2025-01-08')) as 女性被保人人数,
       (select to_char(avg(trunc(months_between(to_date('2026-04-22', 'yyyy-mm-dd'), birthday) / 12)), '999999999.99')
        from lcinsured li
        where grpcontno = b.grpcontno
          and exists (select 1
                      from lcpol
                      where contno = li.contno
                        and enddate = date '2025-01-08')) as 平均年龄,
       (select max(trunc(months_between(to_date('2026-04-22', 'yyyy-mm-dd'), birthday) / 12))
        from lcinsured li
        where grpcontno = b.grpcontno
          and exists (select 1
                      from lcpol
                      where contno = li.contno
                        and enddate = date '2025-01-08')) as 最大年龄,
       (select min(trunc(months_between(to_date('2026-04-22', 'yyyy-mm-dd'), birthday) / 12))
        from lcinsured li
        where grpcontno = b.grpcontno
          and exists (select 1
                      from lcpol
                      where contno = li.contno
                        and enddate = date '2025-01-08')) as 最小年龄,
       (select max(salary)
        from lcinsured li
        where grpcontno = b.grpcontno
          and exists (select 1
                      from lcpol
                      where contno = li.contno
                        and enddate = date '2025-01-08')) as 最高月薪,
       (select avg(salary)
        from lcinsured li
        where grpcontno = b.grpcontno
          and exists (select 1
                      from lcpol
                      where contno = li.contno
                        and enddate = date '2025-01-08')) as 平均月薪,
       decode(payintv, 0, '0', '12')                      as 交费方式,
       grpspec                                            as 特别约定信息,
       (select amnt
        from lcgrppol
        where riskcode = '2062050'
          and b.grpcontno = grpcontno)                    as 公共保额保额,
       (select (select (select sum(pag.sumactupaymoney)
                        from ljapaygrp pag
                        where pag.grppolno = gp.grppolno
                          and exists (select 1
                                      from ljapay ap
                                      where ap.payno = pag.payno
                                        and ap.incomeno = b.grpcontno))
                           + (select nvl(sum(agd.getmoney), 0)
                              from ljagetendorse agd
                              where agd.grppolno = gp.grppolno
                                and agd.getflag <> '1'
                                and exists (select 1
                                            from lpedoritem pd
                                            where pd.edorno = agd.endorsementno
                                              and pd.edorstate = '0'))
                from dual)
                   - (select nvl(sum(agd.getmoney) * -1, 0)
                      from ljagetendorse agd
                      where agd.grppolno = gp.grppolno
                        and agd.getflag = '1'
                        and exists (select 1
                                    from lpedoritem pd
                                    where pd.edorno = agd.endorsementno
                                      and pd.edorstate = '0'))
        from lcgrppol gp
        where gp.riskcode = '2062050'
          and b.grpcontno = gp.grpcontno)                 as 公共保额保费,
       '2026-04-22'                                       as 最后更新日期,
       '17:53:35'                                         as 最后更新时间
from lcgrpcont b
where b.grpcontno = '2024022200000576';


--团单有效lccontplanxbbak
select a.grpcontno                         as 保单号,
       a.contplancode                      as 计划别,
       a.contplanname                      as 计划名称,
       a.healthinsflag                     as 有无社保,
       (select count(1)
        from lcinsured li
        where grpcontno = b.grpcontno
          and contplancode = a.contplancode
          and occupationtype = '0'
          and exists(select 1
                     from lcpol
                     where contno = li.contno
                       and appflag = '1')) as 被保险人属性,
       (select count(1)
        from lcinsured li
        where grpcontno = b.grpcontno
          and contplancode = a.contplancode
          and occupationtype = '1'
          and exists(select 1
                     from lcpol
                     where contno = li.contno
                       and appflag = '1')) as 一类人数,
       (select count(1)
        from lcinsured li
        where grpcontno = b.grpcontno
          and contplancode = a.contplancode
          and occupationtype = '2'
          and exists(select 1
                     from lcpol
                     where contno = li.contno
                       and appflag = '1')) as 二类人数,
       (select count(1)
        from lcinsured li
        where grpcontno = b.grpcontno
          and contplancode = a.contplancode
          and occupationtype = '3'
          and exists(select 1
                     from lcpol
                     where contno = li.contno
                       and appflag = '1')) as 三类人数,
       (select count(1)
        from lcinsured li
        where grpcontno = b.grpcontno
          and contplancode = a.contplancode
          and occupationtype = '4'
          and exists(select 1
                     from lcpol
                     where contno = li.contno
                       and appflag = '1')) as 四类人数,
       (select count(1)
        from lcinsured li
        where grpcontno = b.grpcontno
          and contplancode = a.contplancode
          and occupationtype = '5'
          and exists(select 1
                     from lcpol
                     where contno = li.contno
                       and appflag = '1')) as 五类人数,
       (select count(1)
        from lcinsured li
        where grpcontno = b.grpcontno
          and contplancode = a.contplancode
          and occupationtype = '6'
          and exists(select 1
                     from lcpol
                     where contno = li.contno
                       and appflag = '1')) as 六类人数,
       case
           when (select count(1)
                 from lccontplandutyparam
                 where grpcontno = a.grpcontno
                   and contplancode = a.contplancode
                   and calfactor = 'CalRule'
                   and riskcode <> '2062050'
                   and calfactorvalue = '3') =
                (select count(distinct (dutycode))
                 from lccontplandutyparam
                 where grpcontno = a.grpcontno
                   and contplancode = a.contplancode
                   and riskcode <> '2062050')
               then (select nvl(to_char(sum(to_number(calfactorvalue)), 'fm999999999.00'), 0)
                     from lccontplandutyparam
                     where grpcontno = a.grpcontno
                       and contplancode = a.contplancode
                       and calfactor = 'Prem'
                       and riskcode <> '2062050')
           else '0.00'
           end                             as 人均保费,
       '2026-04-22'                        as 最后更新日期,
       '16:41:51'                          as 最后更新时间
from lccontplan a,
     lcgrpcont b
where a.grpcontno = b.grpcontno
  and a.grpcontno = '2026052800000186';

--团单终止lccontplanxbbak
select a.grpcontno                                        as 保单号,
       a.contplancode                                     as 计划别,
       a.contplanname                                     as 计划名称,
       a.healthinsflag                                    as 有无社保,
       (select count(1)
        from lcinsured li
        where li.grpcontno = b.grpcontno
          and li.contplancode = a.contplancode
          and li.occupationtype = '0'
          and exists (select 1
                      from lcpol
                      where contno = li.contno
                        and enddate = date '2025-01-08')) as 被保险人属性,
       (select count(1)
        from lcinsured li
        where grpcontno = b.grpcontno
          and contplancode = a.contplancode
          and occupationtype = '1'
          and exists (select 1
                      from lcpol
                      where contno = li.contno
                        and enddate = date '2025-01-08')) as 一类人数,
       (select count(1)
        from lcinsured li
        where grpcontno = b.grpcontno
          and contplancode = a.contplancode
          and occupationtype = '2'
          and exists (select 1
                      from lcpol
                      where contno = li.contno
                        and enddate = date '2025-01-08')) as 二类人数,
       (select count(1)
        from lcinsured li
        where grpcontno = b.grpcontno
          and contplancode = a.contplancode
          and occupationtype = '3'
          and exists (select 1
                      from lcpol
                      where contno = li.contno
                        and enddate = date '2025-01-08')) as 三类人数,
       (select count(1)
        from lcinsured li
        where grpcontno = b.grpcontno
          and contplancode = a.contplancode
          and occupationtype = '4'
          and exists (select 1
                      from lcpol
                      where contno = li.contno
                        and enddate = date '2025-01-08')) as 四类人数,
       (select count(1)
        from lcinsured li
        where grpcontno = b.grpcontno
          and contplancode = a.contplancode
          and occupationtype = '5'
          and exists (select 1
                      from lcpol
                      where contno = li.contno
                        and enddate = date '2025-01-08')) as 五类人数,
       (select count(1)
        from lcinsured li
        where grpcontno = b.grpcontno
          and contplancode = a.contplancode
          and occupationtype = '6'
          and exists (select 1
                      from lcpol
                      where contno = li.contno
                        and enddate = date '2025-01-08')) as 六类人数,
       case
           when (select count(1)
                 from lccontplandutyparam
                 where grpcontno = a.grpcontno
                   and contplancode = a.contplancode
                   and calfactor = 'CalRule'
                   and riskcode <> '2062050'
                   and calfactorvalue = '3') =
                (select count(distinct dutycode)
                 from lccontplandutyparam
                 where grpcontno = a.grpcontno
                   and contplancode = a.contplancode
                   and riskcode <> '2062050')
               then (select nvl(to_char(sum(to_number(calfactorvalue)), 'fm999999999.00'), 0)
                     from lccontplandutyparam
                     where grpcontno = a.grpcontno
                       and contplancode = a.contplancode
                       and calfactor = 'Prem'
                       and riskcode <> '2062050')
           else '0.00'
           end                                            as 人均保费,
       '2026-04-22'                                       as 最后更新日期,
       '17:53:35'                                         as 最后更新时间
from lccontplan a,
     lcgrpcont b
where a.grpcontno = b.grpcontno
  and a.grpcontno = '2024062100000126';


--团单有效lccontplandutyparamxbbak
select a.grpcontno                                as 保单号,
       a.contplancode                             as 计划编码,
       a.riskcode                                 as 险种编码,
       (select riskname
        from lmriskapp
        where riskcode = a.riskcode)              as 险种名称,
       a.dutycode                                 as 责任编码,
       (select dutyname
        from lmduty
        where dutycode = a.dutycode)              as 责任名称,
       (select case substr(c.calfactorvalue, 0, instr(c.calfactorvalue, ',') - 1)
                   when '2' then 0
                   when '1' then to_number(substr(c.calfactorvalue, instr(c.calfactorvalue, ',', -1) + 1))
                   else to_number(c.calfactorvalue)
                   end
        from lccontplandutyparam c
        where c.grpcontno = a.grpcontno
          and c.riskcode = a.riskcode
          and c.dutycode = a.dutycode
          and c.calfactor = 'Amnt'
          and c.contplancode = a.contplancode)    as 保额,
       (select c.calfactorvalue
        from lccontplandutyparam c
        where c.grpcontno = a.grpcontno
          and c.riskcode = a.riskcode
          and c.dutycode = a.dutycode
          and c.calfactor = 'DailyLimit'
          and c.contplancode = a.contplancode)    as 日限额,
       (select c.calfactorvalue
        from lccontplandutyparam c
        where c.grpcontno = a.grpcontno
          and c.riskcode = a.riskcode
          and c.dutycode = a.dutycode
          and c.calfactor = 'GetLimitType'
          and c.contplancode = a.contplancode)    as 免赔类型,
       (select c.calfactorvalue
        from lccontplandutyparam c
        where c.grpcontno = a.grpcontno
          and c.riskcode = a.riskcode
          and c.dutycode = a.dutycode
          and c.calfactor = 'GetLimit'
          and c.contplancode = a.contplancode)    as 免赔额,
       (select c.calfactorvalue
        from lccontplandutyparam c
        where c.grpcontno = a.grpcontno
          and c.riskcode = a.riskcode
          and c.dutycode = a.dutycode
          and c.calfactor = 'GetRate'
          and c.contplancode = a.contplancode)    as 赔付比例,
       (select substr(c.calfactorvalue, instr(c.calfactorvalue, ',', -1) + 1)
        from lccontplandutyparam c
        where c.grpcontno = a.grpcontno
          and c.riskcode = a.riskcode
          and c.dutycode = a.dutycode
          and c.calfactor = 'Amnt'
          and c.contplancode = a.contplancode
          and c.riskcode = '2062050'
          and c.dutycode in ('062050', '062051')) as 个人限额,
       (select c.calfactorvalue
        from lccontplandutyparam c
        where c.grpcontno = a.grpcontno
          and c.riskcode = a.riskcode
          and c.dutycode = a.dutycode
          and c.calfactor = 'PayDay'
          and c.contplancode = a.contplancode)    as 给付天数,
       (select c.calfactorvalue
        from lccontplandutyparam c
        where c.grpcontno = a.grpcontno
          and c.riskcode = a.riskcode
          and c.dutycode = a.dutycode
          and c.calfactor = 'Prem'
          and c.contplancode = a.contplancode)    as 保费,
       (select case substr(c.calfactorvalue, 0, instr(c.calfactorvalue, ',') - 1)
                   when '2' then 'Y'
                   else 'N'
                   end
        from lccontplandutyparam c
        where c.grpcontno = a.grpcontno
          and c.riskcode = a.riskcode
          and c.dutycode = a.dutycode
          and c.calfactor = 'Amnt'
          and c.contplancode = a.contplancode)    as 按月薪算保额标记,
       (select substr(c.calfactorvalue, instr(c.calfactorvalue, ',', -1) + 1)
        from lccontplandutyparam c
        where c.grpcontno = a.grpcontno
          and c.riskcode = a.riskcode
          and c.dutycode = a.dutycode
          and c.calfactor = 'Amnt'
          and c.contplancode = a.contplancode
          and c.calfactorvalue like '2,%')        as 月薪倍数,
       (select c.calfactorvalue
        from lccontplandutyparam c
        where c.grpcontno = a.grpcontno
          and c.riskcode = a.riskcode
          and c.dutycode = a.dutycode
          and c.calfactor = 'FloatRate'
          and c.contplancode = a.contplancode)    as 费率,
       '2026-04-22'                               as 最后更新日期,
       '16:57:31'                                 as 最后更新时间
from (select distinct grpcontno, contplancode, riskcode, dutycode
      from lccontplandutyparam c
      where c.grpcontno = '2026052800000186') a,
     lcgrpcont b
where a.grpcontno = b.grpcontno;

--团单终止lccontplandutyparamxbbak
select a.grpcontno                                as 保单号,
       a.contplancode                             as 计划编码,
       a.riskcode                                 as 险种编码,
       (select riskname
        from lmriskapp
        where riskcode = a.riskcode)              as 险种名称,
       a.dutycode                                 as 责任编码,
       (select dutyname
        from lmduty
        where dutycode = a.dutycode)              as 责任名称,
       (select case substr(c.calfactorvalue, 0, instr(c.calfactorvalue, ',') - 1)
                   when '2' then 0
                   when '1' then to_number(substr(c.calfactorvalue, instr(c.calfactorvalue, ',', -1) + 1))
                   else to_number(c.calfactorvalue)
                   end
        from lccontplandutyparam c
        where c.grpcontno = a.grpcontno
          and c.riskcode = a.riskcode
          and c.dutycode = a.dutycode
          and c.calfactor = 'Amnt'
          and c.contplancode = a.contplancode)    as 保额,
       (select c.calfactorvalue
        from lccontplandutyparam c
        where c.grpcontno = a.grpcontno
          and c.riskcode = a.riskcode
          and c.dutycode = a.dutycode
          and c.calfactor = 'DailyLimit'
          and c.contplancode = a.contplancode)    as 日限额,
       (select c.calfactorvalue
        from lccontplandutyparam c
        where c.grpcontno = a.grpcontno
          and c.riskcode = a.riskcode
          and c.dutycode = a.dutycode
          and c.calfactor = 'GetLimitType'
          and c.contplancode = a.contplancode)    as 免赔类型,
       (select c.calfactorvalue
        from lccontplandutyparam c
        where c.grpcontno = a.grpcontno
          and c.riskcode = a.riskcode
          and c.dutycode = a.dutycode
          and c.calfactor = 'GetLimit'
          and c.contplancode = a.contplancode)    as 免赔额,
       (select c.calfactorvalue
        from lccontplandutyparam c
        where c.grpcontno = a.grpcontno
          and c.riskcode = a.riskcode
          and c.dutycode = a.dutycode
          and c.calfactor = 'GetRate'
          and c.contplancode = a.contplancode)    as 赔付比例,
       (select substr(c.calfactorvalue, instr(c.calfactorvalue, ',') + 1)
        from lccontplandutyparam c
        where c.grpcontno = a.grpcontno
          and c.riskcode = a.riskcode
          and c.dutycode = a.dutycode
          and c.calfactor = 'Amnt'
          and c.contplancode = a.contplancode
          and c.riskcode = '2062050'
          and c.dutycode in ('062050', '062051')) as 个人限额,
       (select c.calfactorvalue
        from lccontplandutyparam c
        where c.grpcontno = a.grpcontno
          and c.riskcode = a.riskcode
          and c.dutycode = a.dutycode
          and c.calfactor = 'PayDay'
          and c.contplancode = a.contplancode)    as 给付天数,
       (select c.calfactorvalue
        from lccontplandutyparam c
        where c.grpcontno = a.grpcontno
          and c.riskcode = a.riskcode
          and c.dutycode = a.dutycode
          and c.calfactor = 'Prem'
          and c.contplancode = a.contplancode)    as 保费,
       (select case substr(c.calfactorvalue, 0, instr(c.calfactorvalue, ',') - 1)
                   when '2' then 'Y'
                   else 'N'
                   end
        from lccontplandutyparam c
        where c.grpcontno = a.grpcontno
          and c.riskcode = a.riskcode
          and c.dutycode = a.dutycode
          and c.calfactor = 'Amnt'
          and c.contplancode = a.contplancode)    as 按月薪算保额标记,
       (select substr(c.calfactorvalue, instr(c.calfactorvalue, ',', -1) + 1)
        from lccontplandutyparam c
        where c.grpcontno = a.grpcontno
          and c.riskcode = a.riskcode
          and c.dutycode = a.dutycode
          and c.calfactor = 'Amnt'
          and c.contplancode = a.contplancode
          and c.calfactorvalue like '2,%')        as 月薪倍数,
       (select c.calfactorvalue
        from lccontplandutyparam c
        where c.grpcontno = a.grpcontno
          and c.riskcode = a.riskcode
          and c.dutycode = a.dutycode
          and c.calfactor = 'FloatRate'
          and c.contplancode = a.contplancode)    as 费率,
       '2026-04-22'                               as 最后更新日期,
       '17:53:35'                                 as 最后更新时间
from (select distinct grpcontno, contplancode, riskcode, dutycode
      from lccontplandutyparam c
      where c.grpcontno = '2024062100000126') a,
     lcgrpcont b
where a.grpcontno = b.grpcontno;