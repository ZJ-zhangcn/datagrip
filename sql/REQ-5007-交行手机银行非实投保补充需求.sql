select a.*
from YBTNoticeSave a
where prtno = '2025121800000286';
select a.*
from LISDATA.ES_DOC_MAIN a
where DOCCODE in ('2025112700000266', '');
select a.*
from ldtask a
where TASKCLASS = 'YbtUploadImageTask';
select a.*
from ldtaskplan a
where TASKCODE = '000233';
--ssh
select s.sysvarvalue
from ldsysvar s
where s.sysvar = 'SFTPServer-ShareImage';--10.52.200.101#22#weblogic#weblogic2020%
--核心影像路径
select s.sysvarvalue
from ldsysvar s
where s.sysvar = 'SFTPServer-OriginalImage';--/data/Image/psbc/RECV