-- id: req-5007
-- 标题: 交行手机银行非实投保补充需求

select a.*
from ybtnoticesave a
where prtno = '2025121800000286';

select a.*
from lisdata.es_doc_main a
where doccode in ('2025112700000266', '');

select a.*
from ldtask a
where taskclass = 'YbtUploadImageTask';

select a.*
from ldtaskplan a
where taskcode = '000233';

--ssh
select s.sysvarvalue
from ldsysvar s
where s.sysvar = 'SFTPServer-ShareImage';--10.52.200.101#22#weblogic#weblogic2020%

--核心影像路径
select s.sysvarvalue
from ldsysvar s
where s.sysvar = 'SFTPServer-OriginalImage';--/data/image/psbc/recv