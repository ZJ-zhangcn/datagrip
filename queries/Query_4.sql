select case
           when (to_date('?InjuryDate?', 'YYYY-MM-DD') - to_date('?CValiDate?', 'YYYY-MM-DD')) > 90 or
                ? AccidentReason ? = 1 then case
                                                when to_date('?PolicyYear?', 'YYYY-MM-DD') >
                                                     to_date('?InjuryDate?', 'YYYY-MM-DD') then greatest(? CashValue ?,
                                                                                                         decode('? PUFlag ?', '1', ? PUPrem ?, ? SumPrem ?))
                                                when to_date('?PolicyYear?', 'YYYY-MM-DD') <=
                                                     to_date('?InjuryDate?', 'YYYY-MM-DD') then case
                                                                                                    when exists(select 1 from lcpol where polno = '?PolNo?' and payintv = 0)
                                                                                                        then greatest(
                                                                                                            greatest(
                                                                                                                    (select case when ? ReachAge ? between 18 and 40 then decode('? PUFlag ?','1',? PUPrem ?,? SumPrem ?)* 1.6 when ? ReachAge ? between 41 and 60 then decode('? PUFlag ?','1',? PUPrem ?,? SumPrem ?)* 1.4 when ? ReachAge ? > 60 then decode('? PUFlag ?','1',? PUPrem ?,? SumPrem ?)* 1.2 end from dual),
                                                                                                                    ?
                                                                                                                    CashValue
                                                                                                                    ?),
                                                                                                            ? Amnt ? *
                                                                                                                   power((1 + 0.0175), (select ? Duration ? -1 from dual)))
                                                                                                    when exists(select 1
                                                                                                                from lcpol
                                                                                                                where polno = '?PolNo?'
                                                                                                                  and payintv = 12
                                                                                                                  and paytodate < payenddate)
                                                                                                        then greatest(
                                                                                                            (select case when ? ReachAge ? between 18 and 40 then decode('? PUFlag ?','1',? PUPrem ?,? SumPrem ?)* 1.6 when ? ReachAge ? between 41 and 60 then decode('? PUFlag ?','1',? PUPrem ?,? SumPrem ?)* 1.4 when ? ReachAge ? > 60 then decode('? PUFlag ?','1',? PUPrem ?,? SumPrem ?)* 1.2 end from dual),
                                                                                                            ? CashValue
                                                                                                            ?)
                                                                                                    when exists(select 1
                                                                                                                from lcpol
                                                                                                                where polno = '?PolNo?'
                                                                                                                  and payintv = 12
                                                                                                                  and paytodate = payenddate)
                                                                                                        then greatest(
                                                                                                            greatest(
                                                                                                                    (select case when ? ReachAge ? between 18 and 40 then decode('? PUFlag ?','1',? PUPrem ?,? SumPrem ?)* 1.6 when ? ReachAge ? between 41 and 60 then decode('? PUFlag ?','1',? PUPrem ?,? SumPrem ?)* 1.4 when ? ReachAge ? > 60 then decode('? PUFlag ?','1',? PUPrem ?,? SumPrem ?)* 1.2 end from dual),
                                                                                                                    ?
                                                                                                                    CashValue
                                                                                                                    ?),
                                                                                                            ? Amnt ? *
                                                                                                                   power((1 + 0.0175), (select ? Duration ? -1 from dual))) end end
           else decode('? PUFlag ?', '1', ? PUPrem ?, ? SumPrem ?) end
from dual