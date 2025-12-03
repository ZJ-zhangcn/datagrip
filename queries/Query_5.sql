select m.contno,
       m.cvalidate,
       m.orderdate,
       m.pdfurl,
       (case m.status when '1' then '开具中' when '2' then '已开具' else '未开具' end),
       (case m.ordertype when 2 then '电子' else '' end)
from (select distinct a.contno, a.cvalidate, c.orderdate, d.pdfurl, c.ordertype, c.status
      from lccont a
               left join ljapay b on a.contno = b.incomeno
               left join lysendbillorder c on b.payno = c.getnoticeno
               left join lyreturnbillorder d on c.orderno = d.orderno
      where b.incometype = '2'
        and c.buinesstype = 'QY'
      union all
      select distinct a.contno, a.cvalidate, to_date('', 'yyyy-MM-dd'), '', null, '未开具'
      from lccont a
               left join ljapay b on a.contno = b.incomeno
               left join ljatax c on b.payno = c.getnoticeno
      where b.incometype = '2'
        and c.buinesstype = 'QY'
        and not exists (select 1
                        from lysendbillorder ly
                        where ly.contno = c.contno
                          and ly.getnoticeno = c.getnoticeno
                          and ly.status in ('3', '2', 'd'))) m
where 1 = 1
  and m.contno = '2025102900000206'