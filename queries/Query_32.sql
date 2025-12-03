select a.contno,
       a.polno,
       a.getdutycode,
       a.dutycode,
       (case
            when (select count(1)
                  from lcduty lc
                  where lc.annuitygetmode = '2'
                    and lc.dutycode = a.dutycode
                    and lc.contno = a.contno
                    and lc.polno = a.polno
                    and exists(select 1
                               from lmdutygetalive
                               where getdutycode = a.getdutycode
                                 and getdutyname in ('养老保险金', '特别养老保险金', '全残额外养老保险金'))) > 0
                then date '2074-12-01'
            else date'2074-12-28' end),
       (case
            when (select count(1)
                  from lcduty lc
                  where lc.annuitygetmode = '2'
                    and lc.dutycode = a.dutycode
                    and lc.contno = a.contno
                    and lc.polno = a.polno
                    and exists(select 1
                               from lmdutygetalive
                               where getdutycode = a.getdutycode
                                 and getdutyname in ('养老保险金', '特别养老保险金', '全残额外养老保险金'))) > 0
                then add_months(a.getenddate, 11)
            else a.getenddate end) getenddate
from lcget a,
     lccont b
where a.contno = b.contno
  and b.conttype = '1'
  and checkclaim(b.contno) = '0'
  and substr(b.ManageCom, 0, 2) = '86'
  and b.ContNo = '2025112700000626'
  and a.gettodate between date '2015-01-01' and (case
                                                     when (select count(1)
                                                           from lcduty lc
                                                           where lc.annuitygetmode = '2'
                                                             and lc.dutycode = a.dutycode
                                                             and lc.contno = a.contno
                                                             and lc.polno = a.polno
                                                             and exists(select 1
                                                                        from lmdutygetalive
                                                                        where getdutycode = a.getdutycode
                                                                          and getdutyname in ('养老保险金', '特别养老保险金', '全残额外养老保险金'))) >
                                                          0 then date '2074-12-01'
                                                     else date '2074-12-28' end)
  and a.LiveGetType = '0'
  and a.UrgeGetFlag = 'Y'
  and a.gettodate <= (case
                          when (select count(1)
                                from lcduty lc
                                where lc.annuitygetmode = '2'
                                  and lc.dutycode = a.dutycode
                                  and lc.contno = a.contno
                                  and lc.polno = a.polno
                                  and exists(select 1
                                             from lmdutygetalive
                                             where getdutycode = a.getdutycode
                                               and getdutyname in ('养老保险金', '特别养老保险金', '全残额外养老保险金'))) >
                               0 then add_months(a.getenddate, 11)
                          else a.getenddate end)
  and ((a.getintv = 0 and a.summoney = 0) or a.getintv > 0)
  and not exists (select 'V'
                  from LCContState
                  where PolNo = a.PolNo
                    and StateType = 'Available'
                    and State = '1'
                    and EndDate is null
                    and startdate <= a.gettodate)
  and not exists(select 'X' from lcconthangupstate where posflag = '1' and hanguptype = '2' and contno = b.contno)
  and not exists(select 'X' from lcconthangupstate where ClaimFlag = '1' and hanguptype = '4' and contno = b.contno)
  and not exists (select 1
                  from lccontstate
                  where state = '1'
                    and startdate <= (case
                                          when (select count(1)
                                                from lcduty lc
                                                where lc.annuitygetmode = '2'
                                                  and lc.dutycode = a.dutycode
                                                  and lc.contno = a.contno
                                                  and lc.polno = a.polno
                                                  and exists(select 1
                                                             from lmdutygetalive
                                                             where getdutycode = a.getdutycode
                                                               and getdutyname in ('养老保险金', '特别养老保险金', '全残额外养老保险金'))) >
                                               0 then date '2074-12-01'
                                          else date '2074-12-28' end)
                    and EndDate is null
                    and trim(statetype) = 'Lost'
                    and contno = b.contno
                    and polno in (a.PolNo, '000000'))
  and exists(select 'X'
             from LCPol
             where conttype = '1'
               and PolNo = a.PolNo
               and (AppFlag = '1' or (AppFlag = '4' and exists(select 'T'
                                                               from LCContState
                                                               where PolNo = LCPol.PolNo
                                                                 and StateType = 'Terminate'
                                                                 and State = '1'
                                                                 and StartDate <= (case
                                                                                       when (select count(1)
                                                                                             from lcduty lc
                                                                                             where lc.annuitygetmode = '2'
                                                                                               and lc.dutycode = a.dutycode
                                                                                               and lc.contno = a.contno
                                                                                               and lc.polno = a.polno
                                                                                               and exists(select 1
                                                                                                          from lmdutygetalive
                                                                                                          where getdutycode = a.getdutycode
                                                                                                            and getdutyname in ('养老保险金', '特别养老保险金', '全残额外养老保险金'))) >
                                                                                            0 then date '2074-12-01'
                                                                                       else date '2074-12-28' end)
                                                                 and EndDate is null
                                                                 and StateReason in ('01')) or UrgeGetFlag = 'L')))
  AND NOT EXISTS (SELECT 1
                  FROM lcpol d
                  WHERE 1 = 1
                    and exists (select 1
                                from ldcode
                                where codetype = 'edormainrisk'
                                  and codealias = '1'
                                  and code = d.riskcode
                                  and code not in ('1303006', '1303008', '1333012'))
                    AND paymentpro IS NULL
                    AND polno = a.polno)
  and not exists(select 1
                 from ljagetdraw
                 where contno = a.contno
                   and polno = a.polno
                   and getdate = (case
                                      when (select count(1)
                                            from lcduty lc
                                            where lc.annuitygetmode = '2'
                                              and lc.dutycode = a.dutycode
                                              and lc.contno = a.contno
                                              and lc.polno = a.polno
                                              and exists(select 1
                                                         from lmdutygetalive
                                                         where getdutycode = a.getdutycode
                                                           and getdutyname in ('养老保险金', '特别养老保险金', '全残额外养老保险金'))) >
                                           0 then add_months(a.getenddate, 11)
                                      else a.getenddate end)
                   and getdutycode = a.getdutycode
                   and feeoperationtype = 'AG')
  and not exists(select 1
                 from ljsgetdraw
                 where contno = a.contno
                   and polno = a.polno
                   and getdate = (case
                                      when (select count(1)
                                            from lcduty lc
                                            where lc.annuitygetmode = '2'
                                              and lc.dutycode = a.dutycode
                                              and lc.contno = a.contno
                                              and lc.polno = a.polno
                                              and exists(select 1
                                                         from lmdutygetalive
                                                         where getdutycode = a.getdutycode
                                                           and getdutyname in ('养老保险金', '特别养老保险金', '全残额外养老保险金'))) >
                                           0 then add_months(a.getenddate, 11)
                                      else a.getenddate end)
                   and getdutycode = a.getdutycode
                   and feeoperationtype = 'AG')