select a.grpcontno,
       a.contplancode,
       a.contplanname,
       a.HealthInsFlag,
       '',
       (select count(1)
        from lcinsured li
        where grpcontno = b.grpcontno
          and contplancode = a.contplancode
          and occupationtype = '0'
          and exists(select 1 from lcpol where contno = li.contno and appflag = '1')),
       (select count(1)
        from lcinsured li
        where grpcontno = b.grpcontno
          and contplancode = a.contplancode
          and occupationtype = '1'
          and exists(select 1 from lcpol where contno = li.contno and appflag = '1')),
       (select count(1)
        from lcinsured li
        where grpcontno = b.grpcontno
          and contplancode = a.contplancode
          and occupationtype = '2'
          and exists(select 1 from lcpol where contno = li.contno and appflag = '1')),
       (select count(1)
        from lcinsured li
        where grpcontno = b.grpcontno
          and contplancode = a.contplancode
          and occupationtype = '3'
          and exists(select 1 from lcpol where contno = li.contno and appflag = '1')),
       (select count(1)
        from lcinsured li
        where grpcontno = b.grpcontno
          and contplancode = a.contplancode
          and occupationtype = '4'
          and exists(select 1 from lcpol where contno = li.contno and appflag = '1')),
       (select count(1)
        from lcinsured li
        where grpcontno = b.grpcontno
          and contplancode = a.contplancode
          and occupationtype = '5'
          and exists(select 1 from lcpol where contno = li.contno and appflag = '1')),
       (select count(1)
        from lcinsured li
        where grpcontno = b.grpcontno
          and contplancode = a.contplancode
          and occupationtype = '6'
          and exists(select 1 from lcpol where contno = li.contno and appflag = '1')),
       case
           when (select count(1)
                 from LCContPlanDutyParam
                 where GrpContNo = a.grpcontno
                   and ContPlanCode = a.contplancode
                   and calfactor = 'CalRule'
                   and riskcode <> '2062050'
                   and calfactorvalue = '3') = (select count(distinct (dutycode))
                                                from LCContPlanDutyParam
                                                where GrpContNo = a.grpcontno
                                                  and ContPlanCode = a.contplancode
                                                  and riskcode <> '2062050') then (select nvl(
                                                                                                  to_char(sum(to_number(calfactorvalue)), 'fm999999999.00'),
                                                                                                  0)
                                                                                   from LCContPlanDutyParam
                                                                                   where GrpContNo = a.GrpContNo
                                                                                     and ContPlanCode = a.ContPlanCode
                                                                                     and calfactor = 'Prem'
                                                                                     and riskcode <> '2062050')
           else '0.00' end,
       '2026-04-23',
       '15:47:38'
from LCCONTPLAN a,
     LCGRPCONT b
where a.grpcontno = b.grpcontno
  and a.grpcontno = '2026042200000556'