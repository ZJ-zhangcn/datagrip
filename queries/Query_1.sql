select m.contno,
       m.cvalidate,
       m.returndate,
       m.shorturl,
       decode(m.vstatus, '1', '已开具', '未开具'),
       (case m.INVOCETYPE when 2 then '电子' when 0 then '纸质' when 1 then '纸质' else '' end)
from (select distinct a.contno,
                      a.cvalidate,
                      to_date(d.fdate, 'yyyy-MM-dd') returndate,
                      d.shorturl,
                      d.INVOCETYPE,
                      d.vstatus
      from lccont a
               left join ljapay b on a.contno = b.incomeno
               left join vms_resp_inoutflow c on b.payno = c.buinessno
               left join view_dzfphx d on c.pk_inoutflow = d.busipk
      where b.incometype = '2') m
where 1 = 1
  and m.returndate <= to_date('2025-10-17', 'yyyy-MM-dd')
  and (m.vstatus = '0' or m.vstatus = '5' or m.vstatus is null)
  and '3' = '3'
union
select m.contno,
       m.cvalidate,
       decode(m.status, 'd', to_date('', 'yyyy-MM-dd'), m.returndate),
       decode(m.status, 'd', '', m.pdfurl),
       (case m.status when '3' then '开具中' when '2' then '已开具' else '未开具' end),
       decode(m.status, 'd', '', (case m.ordertype when 2 then '电子' else '' end))
from (select distinct a.contno, a.cvalidate, d.returndate, d.pdfurl, c.ordertype, c.status
      from lccont a
               left join ljapay b on a.contno = b.incomeno
               left join lysendbillorder c on b.payno = c.getnoticeno
               left join lyreturnbillorder d on c.orderno = d.orderno
      where b.incometype = '2') m
where 1 = 1
  and m.returndate <= to_date('2025-10-17', 'yyyy-MM-dd')
  and m.status = '1'