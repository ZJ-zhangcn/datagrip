select ClmNo,
       InqNo,
       CustomerNo,
       CustomerName,
       applydate,
       (case
            when exists (select 1
                         from ldcode
                         where '1765334753000' = '1765334753000' and codetype = 'llinqcom' and code = a.inqper)
                then (select codename from ldcode where codetype = 'llinqcom' and code = a.inqper)
            else (select username from lduser where usercode = a.inqper) end) inqper,
       (select nvl(endcasedate, '') from llregister where rgtno = a.clmno),
       (case
            when exists (select 1 from llinqbasicfee where clmno = a.clmno and INQNO = a.inqno) then 'ÊÇ'
            else '·ñ' end),
       (case
            when exists (select 1 from llinqbasicfee where clmno = a.clmno and INQNO = a.inqno) then (select
                                                                                                          b.operator ||
                                                                                                          '-' ||
                                                                                                          (select username from lduser where usercode = b.operator)
                                                                                                      from llinqbasicfee b
                                                                                                      where b.clmno = a.clmno
                                                                                                        and b.INQNO = a.inqno
                                                                                                        and rownum = 1)
            else '' end) ,
       (case
            when exists (select 1 from llinqbasicfee where clmno = a.clmno and INQNO = a.inqno) then (select INQBASICFEE
                                                                                                      from llinqbasicfee
                                                                                                      where clmno = a.clmno
                                                                                                        and inqno = a.inqno)
            else 0 end),
       (case
            when exists (select 1 from llinqbasicfee where clmno = a.clmno and INQNO = a.inqno) then (select INQPRIZEFEE
                                                                                                      from llinqbasicfee
                                                                                                      where clmno = a.clmno
                                                                                                        and inqno = a.inqno)
            else 0 end),
       (case
            when exists (select 1 from llinqbasicfee where clmno = a.clmno and INQNO = a.inqno) then (select INQDETFEE
                                                                                                      from llinqbasicfee
                                                                                                      where clmno = a.clmno
                                                                                                        and inqno = a.inqno)
            else 0 end)
from llinqapply a
where a.inqstate = '1'
  and a.applydate = (SELECT MIN(b.ApplyDate) FROM llinqapply b WHERE b.ClmNo = a.ClmNo)
  and a.ClmNo = '3631815101010936'
order by a.clmno asc
