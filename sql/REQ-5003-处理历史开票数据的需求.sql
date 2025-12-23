select a.*
from ldtask a
where TASKDESCRIBE like '%¼ÛË°·ÖÀë%';

select a.*
from ldtaskplan a
where taskcode = '000621'
order by TASKPLANCODE desc;

select a.*
from ljatax a
where contno = '2025121500000116';

select a.buinessno, a.buinesstype, a.buinessdate, a.contno
from ljatax a
where a.grpcontno like '00%'
  and a.money > 0
  and not exists (select 1
                  from lysendbillorder d,
                       lysendbill b
                  where d.orderno = b.orderno
                    and a.taxmainno = b.taxmainno
                    and d.status in ('1', '2', '3'))
  and a.GetnoticeNo = '86010120250320004932'
  and a.buinessdate >= date'2025-09-18'
  and a.buinessdate <= date'2025-12-16'
group by a.buinessno, a.buinesstype, a.buinessdate, a.contno;